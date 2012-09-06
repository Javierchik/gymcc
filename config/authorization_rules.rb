authorization do
  role :guest do
    has_permission_on :deporte_usuario_session, :to => [:create, :delete]
 end
  role :recepcion do
    includes :guest
    has_permission_on :citas_medicas, :to => [:manage, :citas, :busqueda, :agendar]
  end

  role :medico do
    includes :guest
    has_permission_on :deporte_historias_clinicas, :to => [:index, :create, :elaborar]
  end

  role :administrador do
    includes :guest, :recepcion, :medico
    has_permission_on :deporte_usuarios, :to => [:manage]
  end
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
