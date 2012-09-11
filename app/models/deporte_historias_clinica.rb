class DeporteHistoriasClinica < ActiveRecord::Base
  belongs_to :socio

  GRUPO_PACIENTE = [["Diabetico e Hipertenso", 0], ["Poblacin especial", 1], ["Persona aparentemente sana", 2], ["Otras patologias", 3]]

  attr_accessible :nombre_acompanante, :telefono_acompanante, :nombre_responsable, :socio_id, :grupo_paciente_id
  attr_accessible :telefono_responsable, :parentesco_responsable, :nombre_aseguradora, :tipo_aseguradora, :tipo_sangre

  validates_presence_of :motivo_consulta, :enfermedad_actual, :diagnostico, :recomendaciones

  def fecha_creacion
    I18n.localize self.created_at, :format => '%B %d de %Y'
  end

  def grupo_paciente
  	DeporteHistoriasClinica::GRUPO_PACIENTE[self.grupo_paciente_id][0] if self.grupo_paciente_id.present?
  end

  def nombre_acompanante
    self.read_attribute(:nombre_acompanante).to_s.force_encoding("UTF-8")
  end 

  def telefono_acompanante
    self.read_attribute(:telefono_acompanante).to_s.force_encoding("UTF-8")
  end 

  def nombre_responsable
    self.read_attribute(:nombre_responsable).to_s.force_encoding("UTF-8")
  end 

  def telefono_responsable
    self.read_attribute(:telefono_responsable).to_s.force_encoding("UTF-8")
  end 

  def tipo_aseguradora
    self.read_attribute(:tipo_aseguradora).to_s.force_encoding("UTF-8")
  end

  def tipo_sangre
    self.read_attribute(:tipo_sangre).to_s.force_encoding("UTF-8")
  end 

  def nombre_aseguradora
    self.read_attribute(:nombre_aseguradora).to_s.force_encoding("UTF-8")
  end 

  attr_accessible :motivo_consulta, :enfermedad_actual, :ante_personales_patologicos, :ante_gino_obstetricos, :ante_quirurgicos, :ante_alergicos, :ante_familiares, :frecuencia_cardiaca, :frecuencia_respiratoria, :tension_arterial, :temperatura, :peso_actual, :talla, :imc, :porcentage_graso, :ccc, :cardiopulmonar, :abdomen, :extremidades, :snc, :diagnostico, :tratamiento, :recomendaciones
  
  def enfermedad_actual
    self.read_attribute(:enfermedad_actual).to_s.force_encoding("UTF-8")
  end

  def ante_personales_patologicos
    self.read_attribute(:ante_personales_patologicos).to_s.force_encoding("UTF-8")
  end

  def ante_gino_obstetricos
    self.read_attribute(:ante_gino_obstetricos).to_s.force_encoding("UTF-8")
  end
  
  def ante_quirurgicos
    self.read_attribute(:ante_quirurgicos).to_s.force_encoding("UTF-8")
  end

  def ante_alergicos
    self.read_attribute(:ante_alergicos).to_s.force_encoding("UTF-8")
  end

  def ante_familiares
    self.read_attribute(:ante_familiares).to_s.force_encoding("UTF-8")
  end

  def frecuencia_cardiaca
    self.read_attribute(:frecuencia_cardiaca).to_s.force_encoding("UTF-8")
  end
  
  def frecuencia_respiratoria
    self.read_attribute(:frecuencia_respiratoria).to_s.force_encoding("UTF-8")
  end
  
  def ccc
    self.read_attribute(:ccc).to_s.force_encoding("UTF-8")
  end
  
  def cardiopulmonar
    self.read_attribute(:cardiopulmonar).to_s.force_encoding("UTF-8")
  end
  
  def abdomen
    self.read_attribute(:abdomen).to_s.force_encoding("UTF-8")
  end
  
  def extremidades
    self.read_attribute(:extremidades).to_s.force_encoding("UTF-8")
  end

  def snc
    self.read_attribute(:snc).to_s.force_encoding("UTF-8")
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

  def recomendaciones
    self.read_attribute(:recomendaciones).to_s.force_encoding("UTF-8")
  end  
end