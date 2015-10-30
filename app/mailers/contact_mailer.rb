class ContactMailer < ApplicationMailer
	default to: Proc.new { Admin.pluck(:email) },
		from: 'notification@example.com'

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#   en.contact_mailer.confirmation_mail_to_customer.subject
	#
	def confirmation_mail_to_customer(customer, contact_message)
		@greeting = "Hi"
		@customer = customer
		customer_email_with_name = %("#{@customer.forename} #{@customer.surname}" <#{@customer.email}>)

		mail to: customer_email_with_name
	end

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#   en.contact_mailer.contact_mail_to_responsible.subject
	#
	def contact_mail_to_responsible(customer, contact_message)
		@customer = customer
		customer_email_with_name = %("#{@customer.forename} #{@customer.surname}" <#{@customer.email}>)
		@greeting = "Hi"

		mail(subject: "New contact message: #{customer_email_with_name}")
	end
end
