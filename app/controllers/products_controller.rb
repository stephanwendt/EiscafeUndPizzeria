class ProductsController < ApplicationController
	before_action :authenticate_admin!, except: [:index, :show]
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	#http_basic_authenticate_with name: "dhh", password: "secret",
		#except: [:index, :show]

	# GET /products
	def index
		@products = Product.all
	end

	# GET /products/1
	def show
	end

	# GET /products/new
	def new
		#session[:newProductImages] = nil
		@product = Product.new
	end

	# GET /products/1/edit
	def edit
	end

	# POST /products
	def create
		@product = Product.new(product_params)


		if @product.save
			if session[:newProductImages] then
				session[:newProductImages].each do |id,quantity|
					picture = Picture.find_by_id(id)
					@product.pictures << picture
				end
				@product.save
				session[:newProductImages] = nil
			end
			redirect_to @product, notice: 'Product was successfully created.'
		else
			render 'new'
		end
	end

	# PATCH/PUT /products/1
	def update
		session[:newProductImages] = nil
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
