authorization do
  role :guest do
    has_permission_on :deporte_usuario_session, :to => [:create, :delete]
 end

  role :recepcion do
    includes :guest
    has_permission_on :citas_medicas, :to => [:manage, :citas, :busqueda, :agendar]
    has_permission_on :busquedas, :to => [:detalle, :index]
  end

  role :medico do
    includes :guest
    has_permission_on :deporte_historias_clinicas, :to => [:manage, :elaborar, :show]
    has_permission_on :busquedas, :to => [:index, :detalle]
  end

  role :administrador do
    includes :guest, :recepcion, :medico
    has_permission_on :deporte_usuarios, :to => [:manage]
    has_permission_on :busquedas, :to => [:index, :detalle]
  end
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :create, :includes => :new
  privilege :read, :includes => [:index, :show]
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
