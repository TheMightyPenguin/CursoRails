class PeopleController < ApplicationController

  before_action :load_person, except: [:index, :new, :create]

  def index
    @people = Person.all
  end

  # Select
  def show
  end

  #Insert
  def new
    @person = Person.new
    @m = "crear persona"
    @person.addresses.build
    #5.times do
      #@person.addresses.build
    #end
  end

  def create
    @person = Person.new(permit_params)

    if @person.save
      redirect_to people_path, notice: "Persona creada correctamente"
    else
      render 'new'
    end
  end

  #Update
  def edit
    @m = "editar-persona"
  end

  def update

    if @person.update(permit_params)
      redirect_to people_path, notice: "#{@person.nombre} Editada Exitosamente"
    else
      render 'edit'
    end
  end
  #Con este metodo podemos agregar varios carros a un objeto.
  def asociar_car
  end

  def add_profile

    render 'formulario_profile'
  end

  def create_profile
    #Metodo para construir cuando es de 1..1
    @person.build_profile(permit_params_profile)
    if @person.profile.save 
      redirect_to person_path(@person)
      else  
      render 'formulario_profile'
    end
  end

  def destroy
    if @person.destroy
      redirect_to people_path, notice: "#{@person.nombre} Borrada Exitosamente"
    end
  end

  private
  def load_person
    @person = Person.find(params[:id])
  end
  def permit_params
    params.require(:person).permit(:nombre, :apellido, :ci, addresses_attributes: [:id,:line1, :line2, :state], car_ids:[])
  end
  def permit_params_profile
    params[:person].require(:profile).permit(:twitter_url, :github_url)
  end
end
