class DeporteHistoriasClinica < ActiveRecord::Base
  belongs_to :socio

  GRUPO_PACIENTE = [["Diabetico e Hipertenso", 0], ["Poblacin especial", 1], ["Persona aparentemente sana", 2], ["Otras patologias", 3]]

  attr_accessible :nombre_acompanante, :telefono_acompanante, :nombre_responsable, :socio_id, :grupo_paciente_id
  attr_accessible :telefono_responsable, :parentesco_responsable, :nombre_aseguradora, :tipo_aseguradora, :tipo_sangre
  attr_accessible :motivo_consulta, :enfermedad_actual, :ante_personales_patologicos, :ante_gino_obstetricos, :ante_quirurgicos, :ante_alergicos, :ante_familiares, :frecuencia_cardiaca, :frecuencia_respiratoria, :tension_arterial, :temperatura, :peso_actual, :talla, :imc, :porcentage_graso, :ccc, :cardiopulmonar, :abdomen, :extremidades, :snc, :diagnostico, :tratamiento, :recomendaciones

  validates_presence_of :motivo_consulta, :enfermedad_actual, :diagnostico, :recomendaciones

  def fecha_creacion
    I18n.localize self.created_at, :format => '%B %d de %Y'
  end

  def grupo_paciente
  	DeporteHistoriasClinica::GRUPO_PACIENTE[self.grupo_paciente_id][0] if self.grupo_paciente_id.present?
  end

  def motivo_consulta
    self.read_attribute(:motivo_consulta).to_s.force_encoding("UTF-8")
  end

  def enfermedad_actual
    self.read_attribute(:enfermedad_actual).to_s.force_encoding("UTF-8")
  end

  def diagnostico
    self.read_attribute(:diagnostico).to_s.force_encoding("UTF-8")
  end

  def diagnostico
    self.read_attribute(:diagnostico).to_s.force_encoding("UTF-8")
  end  
end