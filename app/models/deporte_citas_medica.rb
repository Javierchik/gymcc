class DeporteCitasMedica < ActiveRecord::Base
  belongs_to :socio

  attr_accessible :dia_cita, :hora_cita, :socio_id

  validates_presence_of :dia_cita, :hora_cita, :socio_id
  validates_associated :socio

  validates_uniqueness_of :dia_cita, :scope => :hora_cita
  # validate :cita_vigente

  def estatus
    case estado
    when 'A'
      return 'Agendada'
    when 'T'
      return 'Terminada'
    when 'P'
      return 'Perdida'
    end      
  end

  def fecha_creacion
   created_at.strftime("%d de %B - %H:%M %p")
  end

  def fecha_cita
    dia + ' - ' + hora
  end

  def hora
    I18n.localize hora_cita, :format => :hora_minuto
  end

  def dia
    I18n.localize dia_cita, :format => :short
  end

  def cita_vigente
    if socio.deporte_citas_medicas.where(:estado => 'A').any?
      errors.add(:dia_cita, "El usuario ya tiene una cita Agendada.")
    end
  end
end