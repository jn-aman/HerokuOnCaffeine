class WebsitesController < ApplicationController

  

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


def verifyforzoho
  render layout: false

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


















end
