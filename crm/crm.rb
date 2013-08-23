require ("./contacts")

class CRM
	@@exit = false

	def initialize(crm_name)
		@crm_name = crm_name
	end

	def is_a_number?(s)
  		s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true 
	end

	def main_menu
		while @@exit != true
	  print_main_menu
	  user_selected = gets.chomp.to_i
	  call_option(user_selected)
	  	end
	end

	def print_main_menu
	  puts "\nWhat would you like to do?\n\n"
	  puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Delete a contact"
	  puts "[4] Display all the contacts"
	  puts "[5] Display an attribute" 
	  puts "[6] Exit\n\n"
	  print "Enter a number: "	
	end

	def call_option(user_selected)
	  add_new_contact if user_selected == 1
	  modify_existing_contact if user_selected == 2
	  delete_contact if user_selected == 3
	  display_contacts if user_selected == 4
	  display_attribute if user_selected == 5
	  exit if user_selected == 6
	end

	def display_selected_contact(a)
		puts "\n"
		puts "ID: " + a.id.to_s
		puts "Name: " + a.first_name + " " + a.last_name
		puts "Email: " + a.email
		puts "Note: " + a.note
	end

	def add_new_contact()
		puts "\e[H\e[2J"
		puts "\nAdd a New Contact with ID #{Database.id} \n"
		print "Enter First Name: "
		first_name = gets.chomp.downcase.capitalize
		print "Enter Last Name: "
		last_name = gets.chomp.downcase.capitalize
		print "Enter Email Address: "
		email = gets.chomp
		print "Enter a Note: "
		note = gets.chomp
		contact = Contact.new(first_name, last_name, email, note)
		Database.add_contact(contact)
		puts "\n#{first_name} #{last_name} successfully added!"
		# puts "\e[H\e[2J"
  	end

	def modify_existing_contact()
		puts "\e[H\e[2J"
		match = false
		id_integer = false
		puts "Enter the ID of the contact to modify: "
		modify_id = gets.chomp
		Database.contacts.each do |a|
			if a.id == modify_id.to_i
				match = true
				display_selected_contact(a)
				puts "Is this the contact you wish to modify? (Y/N)"
				confirm_modify = gets.chomp.upcase
				if confirm_modify == "Y"
				 	while id_integer==false
  							print "Enter new ID: "
  							input_id = gets.chomp
  							if is_a_number?(input_id) == true
  							id_integer=true
  							else
  							print "\nInput is not a number. Make sure ID is an integer.\n"
  							end
  					end
						print "Enter First Name: "
						first_name = gets.chomp.downcase.capitalize
						print "Enter Last Name: "
						last_name = gets.chomp.downcase.capitalize
						print "Enter Email Address: "
						email = gets.chomp
						print "Enter a Note: "
						note = gets.chomp
						contact = Contact.new(first_name, last_name, email, note)
						Database.modify_contact(contact, input_id.to_i)
						Database.contacts.delete(a)	
					end
			else 
  			puts "\e[H\e[2J"
  			puts "Contact was not modifed. Select another option\n\n" 
			end
			if match == false
				puts "\nID #{a.id} not found, please choose another option."
			end
		end


	end

	def delete_contact()
		puts "\e[H\e[2J"
		print "Specify ID of contact you wish to delete: "
		match = false
		delete_id = gets.chomp
		Database.contacts.each do |a|
			if a.id == delete_id.to_i
				match = true
				display_selected_contact(a)
				puts "\nWill be permanently deleted. Confirm? (Y/N)"
				confirm_delete = gets.chomp.upcase
					if confirm_delete == "Y"
						Database.contacts.delete(a)
						puts "#{a.first_name} #{a.last_name} successfully deleted!"
					end
			end
			if match == false
				puts "\nID #{a.id} not found, please choose another option."
			end
		end
	end

	def display_contacts()
		puts "\e[H\e[2J"
		Database.contacts.each do |a|
			display_selected_contact(a)
		end
	end

	def display_attribute()
		puts "\e[H\e[2J"
		puts "Options: \n[1] ID\n[2] first name\n[3] last name\n[4] email\n[5]note"
		puts "\nWhich attribute would you like to review?"
		attribute_id = gets.chomp.to_i
		puts "\n"
		Database.contacts.each do |a|
			if  attribute_id == 1
				puts a.id
			elsif attribute_id == 2
				puts a.first_name
			elsif attribute_id == 3
				puts a.first_name
			elsif attribute_id == 4
				puts a.email
			elsif attribute_id == 5
				puts a.note
			else
				"The attribute specified does not exist..."
			end
		end
	end

	def exit
		puts "\e[H\e[2J"
		@@exit = true
	end

end

crm = CRM.new("Adam's CRM")
crm.main_menu

