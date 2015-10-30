class Customer < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable, :confirmable
	has_many :orders
	has_many :contact_messages

	def send_devise_notification(notification, *args)
		devise_mailer.send(notification, self, *args).deliver_later
	end
end
