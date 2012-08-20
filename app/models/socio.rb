class Socio < ActiveRecord::Base
  self.primary_key = 'IdUnicoSocio'
  has_one :foto, :class_name => "Foto", :foreign_key => :IdPhoto
  has_many :deporte_citas_medicas

  def nombre_completo
    self.NombreSocio.to_s.force_encoding("UTF-8")
  end

end