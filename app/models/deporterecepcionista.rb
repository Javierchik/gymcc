class Deporterecepcionista < ActiveRecord::Base
  devise :database_authenticatable, :validatable
  attr_accessible :nombre, :email, :password, :password_confirmation
end
