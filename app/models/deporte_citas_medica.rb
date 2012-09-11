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
    I18n.localize created_at, :format => :short
  end

  def fecha_cita
    dia + ' - ' + hora
  end

  def hora
    hora_cita
  end

  def dia
    dia_cita
  end

  def cita_vigente
    if socio.deporte_citas_medicas.where(:estado => 'A').any?
      errors.add(:dia_cita, "El usuario ya tiene una cita Agendada.")
    end
  end

  def hora_cita
    self.read_attribute(:hora_cita).strftime("%I:%M %p").to_s.force_encoding("UTF-8")
  end

  def dia_cita
    self.read_attribute(:dia_cita).strftime("%Y-%m-%d").to_s.force_encoding("UTF-8")
  end 
end