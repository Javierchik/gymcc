class EstadoCivil < ActiveRecord::Base
  self.primary_key = 'CodEstadoCivil'
  belongs_to :socio
end