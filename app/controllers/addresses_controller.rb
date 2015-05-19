class AddressesController < ApplicationController

	def create
		@person = Person.find(params[:person_id])

		@address = @person.addresses.new(permit_params)
		if  @address.save
			redirect_to person_path(@person)
		else
			render 'new'			
		end
	end

	def new
		@person = Person.find(params[:person_id])
		@address = @person.addresses.new
	end

	def edit
		@address = Address.find(params[:id])
		@person = @address.person
		@m = "editar-direccion"
	end

	def update
		@address = Address.find(params[:id])

		if @address.update(permit_params)
      		redirect_to person_path(@address.person)
    	else
      		render 'edit'
    	end
	end

 	def destroy
    address = Address.find(params[:id])
    if address.destroy
      flash[:notice] = "Fue eliminado exitosamente"
      redirect_to person_path(params[:person_id])
    end
  	end

  	private
  	def permit_params
  		params.require(:address).permit(:line1, :line2, :state)  		
  	end
end
