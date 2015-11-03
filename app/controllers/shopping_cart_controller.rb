class ShoppingCartController < ApplicationController
	before_action :authenticate_user!, only: [:order]
	before_action :set_shopping_cart

	def add
		id = params[:id]

		if @cart[id] then
			@cart[id] += 1
		else
			@cart[id] = 1
		end

		session[:cart] = @cart
		#flash.notice = "Product successfully added to cart!"
	end

	def update
		id = params[:id]

		quantity = params[:quantity].to_i
		if quantity then
			@cart[id] = quantity
			session[:cart] = @cart
			#flash.notice = "Product successfully added to cart!"
		end
	end

	def remove
		id = params[:id]

		session[:cart] = @cart.except!(id)
	end

	def order
		if session[:cart] then
			cart = session[:cart]
			if cart.length > 0 then
				total = 0
				current_order = Order.create(customer: current_customer)
				cart.each do |id,quantity|
					product = Product.find_by_id(id)
					current_order.order_items.create(unit_price: product.price, quantity: quantity, product: product)
					total += product.price * quantity
				end
				current_order.order_date = current_order.created_at
				current_order.total = total
				if current_order.save then
					OrderMailer.confirmation_mail_to_customer(current_customer, current_order).deliver_later
					OrderMailer.confirmation_mail_to_admins(current_customer, current_order).deliver_later
				else
					##TODO
				end
			end
		end

		redirect_to :action => :clear
	end

	def clear
		@cart = {}
		session[:cart] = @cart
		redirect_to :action => :index
	end

	def index
	end


	private
	def set_shopping_cart
		@cart = session[:cart]
		@cart ||= {}
	end
end
