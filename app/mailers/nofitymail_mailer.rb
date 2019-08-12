class NofitymailMailer < ApplicationMailer

include Chartkick::Helper
require 'chartkick'
 default from: "aman@herokuoncaffeine.in"

def welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to HerokuOnCaffeine.in')
end

 

def bye_mail(user)
    @user = user
  
mail(to: @user.email, subject: 'Hope to see back soon on HerokuOnCaffeine.in')
end

def error(user,response)
    @response=response
@user=user
mail(to: @user.email, subject: 'Your Website is DOWN!!!!!')
end



def status(email)
@email=email
@k=Report.where("email = ?",@email).last.id.to_s
@k='/home/aman/Downloads/'+@k+'.png'
 attachments.inline['image.png'] = File.read( @k)
mail(to: @email, subject: 'Status of Your Website!!!')

end
end
