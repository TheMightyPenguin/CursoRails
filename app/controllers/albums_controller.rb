class AlbumsController < ApplicationController
	def destroy
    album = Album.find(params[:id])
    if album.destroy
      flash[:notice] = "Fue eliminado exitosamente"
      redirect_to person_path(params[:person_id])
    end
  end
end
