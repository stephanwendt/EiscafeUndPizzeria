class Admin < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :timeoutable
	#:recoverable, :rememberable, :trackable, :validatable

	def send_devise_notification(notification, *args)
		devise_mailer.send(notification, self, *args).deliver_later
	end
end
