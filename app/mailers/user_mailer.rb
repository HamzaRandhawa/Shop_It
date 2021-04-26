class UserMailer < ActionMailer::Base
    default from: "openshop@io.com"

    def registration_confirmation(user)
        @user = user
        # @user = params[:user]
        # mail(:to => "#{user.username} <#{user.email}>", :subject => "Registration Confirmation")
        # mail(to: email_address_with_name(@user.email, @user.username), subject: 'Registration Confirmation')
        mail(:to => "#{user.username} <#{user.email}>", :subject => "Registration Confirmation")
       
        # mail(to: @user.email, subject: 'Registration Confirmation')

    end
end
