class ProductsController < ApplicationController
	before_action :authenticate_admin!, except: [:index, :search, :show]
	before_action :set_product, only: [:show, :edit, :update, :destroy]

	# GET /products
	def index
		@products = Product.all
	end

	def search
		@products = Product.where("name LIKE ?", '%' + params[:search_keywords] + '%')
	end

	# GET /products/1
	def show
	end

	# GET /products/new
	def new
		#session[:newProductImages] = nil
		@product = Product.new
		#@pictures = Picture.all
	end

	# GET /products/1/edit
	def edit
		#@pictures = Picture.all
	end

	# POST /products
	def create
		@product = Product.new(product_params)

		#if params["picture_ids"] then
		#	params["picture_ids"].each do |picture_id|
		#		picture = Picture.find_by_id(picture_id)
		#		@product.pictures << picture
		#	end
		#	@product.save
		#end
		if session[:newProductImages] then
			session[:newProductImages].each do |id,quantity|
				picture = Picture.find_by_id(id)
				@product.pictures << picture
			end
			session[:newProductImages] = nil
		end

		if @product.save
			redirect_to @product, notice: 'Product was successfully created.'
		else
			render 'new'
		end
	end

	# PATCH/PUT /products/1
	def update
		if session[:newProductImages] then
			session[:newProductImages].each do |id,quantity|
				picture = Picture.find_by_id(id)
				@product.pictures << picture
			end
			session[:newProductImages] = nil
		end


		if @product.update(product_params)
			redirect_to @product, notice: 'Product was successfully updated.'
		else
			render 'edit'
		end
	end

	# DELETE /products/1
	def destroy
		@product.destroy

		redirect_to products_path, notice: 'Product was successfully destroyed.'
	end

	private
	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :description, :available, :price)
	end
end
