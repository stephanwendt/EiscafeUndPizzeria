class CustomDeviseMailer < Devise::Mailer
	helper :application # gives access to all helpers defined within 'application_helper'.
	include Devise::Controllers::UrlHelpers # Optional. eg. 'confirmation_url'
	default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

	def confirmation_instructions(record, token, opts={})
		@resource = record
		mail to: Admin.pluck(:email), subject: "Hallo"
		super
	end
end
