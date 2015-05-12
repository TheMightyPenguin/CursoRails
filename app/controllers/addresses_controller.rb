class AddressesController < ApplicationController

  def destroy
    address = Address.find(params[:id])
    if address.destroy
      flash[:notice] = "Fue eliminado exitosamente"
      redirect_to person_path(params[:person_id])  
    end
  end
end
