class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  # Select
  def show
    @person = Person.find(params[:id])
  end

  #Insert
  def new
    @person = Person.new
    @m = "crear persona"
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
    @person = Person.find(params[:id])
    @m = "editar-persona"
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(permit_params)
      redirect_to people_path, notice: "#{@person.nombre} Editada Exitosamente"
    else
      render 'edit'
    end
  end

  private
  def permit_params
    params.require(:person).permit(:nombre, :apellido, :ci)
  end
end
