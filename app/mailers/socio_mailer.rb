class SocioMailer < ActionMailer::Base
  default from: "gymcc@country.com.co"
  
  def cita_email(cita)
    @cita = cita
    mail(:to => "javiersiado@gmail.com", :subject => "Cita medica en GymCC")
  end
end
