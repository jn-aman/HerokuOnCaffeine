class NofitymailMailer < ApplicationMailer
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

end
