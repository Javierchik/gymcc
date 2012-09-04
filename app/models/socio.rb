class Socio < ActiveRecord::Base
  self.primary_key = 'IdUnicoSocio'
  has_one :estado_civil, :class_name => "EstadoCivil", :foreign_key => :CodEstadoCivil
  has_many :deporte_citas_medicas
  has_many :deporte_historias_clinicas
  
  def nombre_completo
    self.NombreSocio.to_s.force_encoding("UTF-8")
  end

  def fecha_nacimiento
    I18n.localize self.FechaNacimiento, :format => '%B %d de %Y'
  end

  def nombre_estado_civil
    if self.estado_civil.present?
      EstadoCivil.find(self.estado_civil).NombreEstadoCivil
    end
  end

  def foto_socio
    if self.IdPhoto.present?
      "http://srvbackup1/foto/ShowImage.ashx?id=" + self.IdPhoto.to_s
    else
      "http://placehold.it/160x200"
    end
  end

end