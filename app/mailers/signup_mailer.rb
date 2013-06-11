class SignupMailer < ActionMailer::Base
  default :from => 'no-reply@bolaodaconfe.net'
  
  def confirm_email(user)
    @user = user
    @confirmation_link = confirmation_url({
      :token => @user.confirmation_token
    }) 
    
    mail({
      :to => user.email,
      :bcc => ['sign ups <signups@bolaodaconfe.net>'],
      :subject => 'Bolao da Confe - Confirme seu email'
    })
  end
end
