class OrderMailer < ApplicationMailer
	default to: Proc.new { Admin.pluck(:email) },
		from: 'notification@example.com'

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#   en.order_mailer.confirmation_mail_to_customer.subject
	#
	def confirmation_mail_to_customer(customer, order)
		@customer = customer
		customer_email_with_name = %("#{@customer.forename} #{@customer.surname}" <#{@customer.email}>)
		@greeting = "Hi"

		mail to: customer_email_with_name
	end

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#   en.order_mailer.confirmation_mail_to_admins.subject
	#
	def confirmation_mail_to_admins(customer, order)
		@customer = customer
		customer_email_with_name = %("#{@customer.forename} #{@customer.surname}" <#{@customer.email}>)
		@greeting = "Hi"

		mail(subject: "New User Signup: #{customer_email_with_name}")
	end
end
