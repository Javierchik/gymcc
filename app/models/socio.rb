class Socio < ActiveRecord::Base
  self.primary_key = 'IdUnicoSocio'
  has_many :deporte_citas_medicas
  has_many :deporte_historias_clinicas
  
  def nombre_completo
    self.NombreSocio.to_s.force_encoding("UTF-8")
  end

  def fecha_nacimiento
    I18n.localize self.FechaNacimiento, :format => '%B %d de %Y' if self.FechaNacimiento.present?
  end

  def estado_civil
    nombre_estado_civil
  end

  def foto_socio
    if self.IdPhoto.present?
      "http://srvbackup1/foto/ShowImage.ashx?id=" + self.IdPhoto.to_s
    else
      "http://placehold.it/160x200"
    end
  end

  def email
    if self.EmailPersonal.present?
      return self.EmailPersonal
    else
      return "<span class='label label-warning'>El Socio no posee cuenta de correo. Por favor dirijase a Deportes</span>".html_safe
    end  
  end
  
  private 

  def nombre_estado_civil
    case self.CodEstadoCivil
      when 1 
        return 'VIUDO'
      when 2 
        return 'NINGUNO'
      when 3  
        return 'CASADO'
      when 4  
        return 'VIUDA'
      when 5  
        return 'NO DEFINIDO'
      when 6  
        return 'SOLTERO'
      when 7  
        return 'DIVORCIADO'
      end
  end

end