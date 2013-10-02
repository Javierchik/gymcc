class DeporteUsuario < ActiveRecord::Base

  # Devise
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  
  # Attributes
  attr_accessible :nombre, :apellido, :cedula, :celular, :rol, :direccion_residencia, :telefono_residencia
  attr_accessible :email, :password, :password_confirmation, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
  
  # Validations
  validates_presence_of :nombre, :apellido, :rol

  def nombre_completo
    nombre.to_s.force_encoding("UTF-8") + ' ' + apellido.to_s.force_encoding("UTF-8")
  end

  def role_name
    case rol
      when 'A'
        return ['Administrador', 'Recepcion', 'Medico']
      when 'R'
        return ['Recepcion']
      when 'M'
        return ['Medico']
      end
  end

  serialize [:rol], Array

  def role_symbols
    @role_symbols ||= [:guess, role_name.map{ |r| r.downcase.to_sym }].flatten
  end

  def is?(role_sym)
    role_symbols.include?(role_sym)
  end

  protected

  def password_required?
    password.present? || password_confirmation.present?
  end

end