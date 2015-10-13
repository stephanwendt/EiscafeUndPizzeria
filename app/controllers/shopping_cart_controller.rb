class ShoppingCartController < ApplicationController
	def add
		id = params[:id]

		if session[:cart] then
			cart = session[:cart]
		else
			session[:cart] = {}
			cart = session[:cart]
		end

		if cart[id] then
			cart[id] += 1
		else
			cart[id] = 1
		end

		session[:cart] = cart

		redirect_to :action => :index
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
				current_order.save
			end
		end

		redirect_to :action => :clear
	end

	def clear
		session[:cart] = nil
		redirect_to :action => :index
	end

	def index
		if session[:cart] then
			@cart = session[:cart]
		else
			@cart = {}
		end
	end
end
