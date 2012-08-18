class Socio < ActiveRecord::Base
  has_one :foto, :class_name => "Foto", :foreign_key => :IdPhoto
  has_many :deporte_citas_medicas, :class_name => "Deportecitasmedica", :foreign_key => :IdUnicoSocio
end