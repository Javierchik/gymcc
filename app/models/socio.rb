class Socio < ActiveRecord::Base
  has_one :foto, :class_name => "Foto", :foreign_key => :IdPhoto
end