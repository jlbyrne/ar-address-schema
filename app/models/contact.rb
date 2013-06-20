require_relative '../../db/config'

# implement your Contact model here

class Contact < ActiveRecord::Base

	validates :email, :format => { :with => /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/,
    :message => "that is not a valid email address" }

    validates :phone, :format => { :with => /\d{3}.?\d{3}.?\d{4}/, 
    :message => "That is not a valid phone number" }

    validates :company, :presence => true

	def name
		"#{first_name} #{last_name}"
	end

	def area_code
		"#{phone}"[0..2]
	end
end

me = Contact.create

me.first_name = "Jenny"
me.last_name = "Byrne"
me.company = "DBC"
me.phone = "8033175518"
me.email = "jennifer.byrne@outlook.com"

p me

p me.name

p me.phone

p me.area_code