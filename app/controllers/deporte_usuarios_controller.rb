class DeporteUsuariosController < ApplicationController
  before_filter :authenticate_deporte_usuario!
  filter_access_to :all, :context => :deporte_usuarios

  # GET /deporte_usuarios
  # GET /deporte_usuarios.json
  def index
    @deporte_usuarios = DeporteUsuario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deporte_usuarios }
    end
  end

  # GET /deporte_usuarios/new
  # GET /deporte_usuarios/new.json
  def new
    @deporte_usuario = DeporteUsuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deporte_usuario }
    end
  end

  # GET /deporte_usuarios/1/edit
  def edit
    @deporte_usuario = DeporteUsuario.find(params[:id])
  end

  # POST /deporte_usuarios
  # POST /deporte_usuarios.json
  def create
    @deporte_usuario = DeporteUsuario.new(params[:deporte_usuario])

    respond_to do |format|
      if @deporte_usuario.save
        format.html { redirect_to deporte_usuarios_path, notice: 'El Usuario ha sido creado exitosamente.' }
        format.json { render json: @deporte_usuario, status: :created, location: @deporte_usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @deporte_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deporte_usuarios/1
  # PUT /deporte_usuarios/1.json
  def update
    @deporte_usuario = DeporteUsuario.find(params[:id])

    respond_to do |format|
      if @deporte_usuario.update_attributes(params[:deporte_usuario])
        format.html { redirect_to deporte_usuarios_path, notice: 'El Usuario ha sido actializado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deporte_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deporte_usuarios/1
  # DELETE /deporte_usuarios/1.json
  def destroy
    @deporte_usuario = DeporteUsuario.find(params[:id])
    @deporte_usuario.destroy

    respond_to do |format|
      format.html { redirect_to deporte_usuarios_url }
      format.json { head :no_content }
    end
  end
end
