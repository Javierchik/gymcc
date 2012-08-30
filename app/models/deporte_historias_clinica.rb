class DeporteHistoriasClinica < ActiveRecord::Base
  belongs_to :socio

  attr_accessible :nombre_acompanante, :telefono_acompanante, :nombre_responsable, :socio_id
  attr_accessible :telefono_responsable, :parentesco_responsable, :nombre_aseguradora, :tipo_aseguradora, :tipo_sangre
  attr_accessible :motivo_consulta, :enfermedad_actual, :ante_personales_patologicos, :ante_gino_obstetricos, :ante_quirurgicos, :ante_alergicos, :ante_familiares, :frecuencia_cardiaca, :frecuencia_respiratoria, :tension_arterial, :temperatura, :peso_actual, :talla, :imc, :porcentage_graso, :ccc, :cardiopulmonar, :abdomen, :extremidades, :snc, :diagnostico, :tratamiento, :recomendaciones

  validates_presence_of :motivo_consulta, :enfermedad_actual, :diagnostico, :tratamiento
end