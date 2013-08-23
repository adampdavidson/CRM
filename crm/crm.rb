require ("./contacts")

class CRM
	@@exit = false

	def initialize(crm_name)
		@crm_name = crm_name
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
		puts "Please enter a Contact ID (ex. 1004):  "
		modify_id = gets.chomp.to_i
		Database.modify(modify_id)
	end

	def delete_contact()
	end

	def display_contacts()
		puts "\e[H\e[2J"
		puts Database.contacts.inspect
	end

	def display_attribute()
	end

	def exit
		puts "\e[H\e[2J"
		@@exit = true
	end

end

crm = CRM.new("Adam's CRM")
crm.main_menu

