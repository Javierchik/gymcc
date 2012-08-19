class DeporteUsuario < ActiveRecord::Base
  
  # Devise
  devise :registerable, :database_authenticatable, :rememberable, :trackable, :validatable
  
  # Attributes
  attr_accessible :nombre, :apellido, :cedula, :celular, :rol, :direccion_residencia, :telefono_residencia
  attr_accessible :email, :password, :password_confirmation, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
  
  # Validations
  validates_presence_of :nombre, :apellido, :rol
end