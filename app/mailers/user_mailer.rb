class UserMailer < ActionMailer::Base
    default from: "me@mydomain.com"

    def registration_confirmation(user)
        @user = user
        # mail(:to => "#{user.username} <#{user.email}>", :subject => "Registration Confirmation")
        mail(to: email_address_with_name(@user.email, @user.username), subject: 'Registration Confirmation')
    end
end
