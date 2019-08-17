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
  render json: {}, status: 200
else
      render json: {}, status: 400
    end
end










def delete
   @w=Website.new
@w.url=params[:url]
   @email=params[:email]
@website = Website.where(email: @email)
c=0
@website.each do |p|
  if p.url == @w.rectify
    c=c+1
    p.destroy
  end
end
if(c!=0) 
    render json: {}, status: 200
   else
   render json:{},status: 400 
    
end
end


















end
