class WebsitesController < ApplicationController

  skip_before_action :verify_authenticity_token


  def new
  end


  def create
   @w=params[:url]
   @email=params[:email]
@website = Website.new
@website.url=@w
@website.email=@email

if !( Website.exists?(url: @website.rectify ) and  Website.exists?(email: @email))  
@website.save
Thread.new do 
NofitymailMailer.welcome_mail(@website).deliver_now
end
  render json: {}, status: 200
else
      render json: {}, status: 400
    end
end







def delete
   @w=Website.new
@w.url=params[:url]
   @email=params[:email]
@k=@w
@website = Website.where(email: @email)
c=0
@website.each do |p|
  if p.url == @w.rectify
    c=c+1
@l=Website.new
@l.url=p.url
@l.email=p.email

 p.destroy
Report.where("url = ?",@l.url ).delete_all


  end
end
if(c!=0) 
Thread.new do
NofitymailMailer.bye_mail(@l).deliver_now
end  
  render json: {}, status: 200
   else
   render json:{},status: 400 
    
end
end





def getgraph
@email=params[:email]
@k=Report.where("email = ?",@email).last.id.to_s

@p = Report.where("email = ?",@email).group(:url).group_by_minute(:created_at, format: " %r %d %b", time_zone: "Kolkata", series: false).maximum(:up)

end

def getgraph2
@email=params[:email]
@k=Report.where("email = ?",@email).last.id.to_s

@p = Report.where("email = ?",@email).group(:url).group_by_minute(:created_at, format: " %r %d %b", time_zone: "Kolkata", series: false).maximum(:up)

end


def insertdata

File.open("/home/aman/Desktop/hoc/somefilename1.png", 'wb') do |f|
      f.write(params[:image].read)
    end
end










end
