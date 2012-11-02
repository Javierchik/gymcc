class SocioMailer < ActionMailer::Base
  default from: "no-reply@country.com.co"
  layout 'mailer'

  def cita_email(cita)
    @cita = cita
    mail(:to => @cita.socio.EmailPersonal, :cc => "countrygym@country.com.co", :bcc => DeporteUsuario.all.collect(&:email), :subject => "Cita medica en Country Gym", :content_type => "text/html") do |format|
    	format.html
    end
  end

  def test_mail
    mail(:to => "javiersiado@gmail.com", :subject => "Testing email from CoountryGym", :content_type => "text/html") do |format|
    	format.html
    end
  end
end