class SocioMailer < ActionMailer::Base
  default from: "gymcc@country.com.co"
  
  def cita_email(paciente)
    @paciente = paciente
    mail(:to => "javiersiado@gmail.com", :subject => "Cita medica en GymCC")
  end
end
