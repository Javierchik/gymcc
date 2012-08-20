class DeporteCitasMedicaObserver < ActiveRecord::Observer
  
  def before_create(deporte_citas_medica)
    deporte_citas_medica.estado = "A"
    @was_a_new_record = deporte_citas_medica.new_record?
  end

  def after_save(deporte_citas_medica)
    if @was_a_new_record && deporte_citas_medica.socio.EmailPersonal.present?
      SocioMailer.cita_email(deporte_citas_medica).deliver
    end
  end

end