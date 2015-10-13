class PicturesController < ApplicationController
	protect_from_forgery with: :null_session

	def index
		@pictures = Picture.all
	end

	def show
		@picture = Picture.find(params[:id])
	end

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(picture_params)
		if @picture.save
			redirect_to @picture
		else
			render 'new'
		end
	end

	def addToProduct
		newProductImages = session[:newProductImages]
		newProductImages ||= {}
		newProductImages[params[:id]]=1
		session[:newProductImages] = newProductImages

		redirect_to :action => :index
	end

	private
	def picture_params
		params.require(:picture).permit(:image)
	end
end
