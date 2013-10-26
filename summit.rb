require_relative "contact" #use require relative because you have Ruby 1.8. In Ruby 2.0 you can use 'require'
require_relative "rolodex"

class CRM #use camel case for class names

attr_accessor :name #GETTER and SETTER methods

#attr_reader :name  --> sets GETTER method automatically
#attr_writer :name  --> sets SETTER method automatically

=begin
  attr_accessor accomplishes this:
  def name  --> allows you to access name outside of the class GETTER method
    @name
  end

  def name=(str) --> SETTER method - allows you to set the name of the CRM
    @name = str
  end
end
=end

  def initialize(name)
    self.name = name 
  end

  def print_main_menu
    puts "Welcome to #{@name} the pinncale of customer relationship management."
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Display particular contact"
    puts "[7] Exit"
    puts "Enter a number: "
  end

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end

  def call_option(user_selected)
    add_new_contact if user_selected == 1
    modify_existing_contact if user_selected == 2
    delete_contact if user_selected == 3
    display_all_contacts if user_selected == 4
    display_an_attribute if user_selected == 5
    display_particular_contact if user_selected == 6
    Kernel.exit if user_selected == 7
  end

  def modify_contact_list
    Rolodex.display_all_contacts
    puts "Please select a contact."
    contact_select = gets.chomp.to_i
    contact_selected = get_contact(contact_select)

    puts "Select 1 to 4 to modify:"
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] Note"
    puts "[5] ID"
    modify_select = gets.chomp.to_i

    case modify_select
    when 1
      puts "Enter a new first name: "
      contact_selected.first_name = gets.chomp
    when 2
      puts "Enter a new last name: "
      contact_selected.last_name = gets.chomp
    when 3
      puts "Enter a new email: "
      contact_selected.email = gets.chomp
    when 4
      puts "Enter a new note: "
      contact_selected.note = gets.chomp
    when 5
      puts "Eneter a new ID: "
      contact_selected.id = gets.chomp
    end
    main_menu
  end

  def get_contact (contact_selected)
    Rolodex.contacts(contact_selected)
  end

  def display_particular_contact #need to finish this

  def add_new_contact
    print "What is your first name?"
    first_name = gets.chomp
    print "What is your last name?"
    last_name = gets.chomp
    print "What is your email?"
    email = gets.chomp
    print "Please write out any notes."
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
  end

  def delete_contact(id)
    puts "What contact would you like to delete?"
    id = gets.chomp
  end

  def display_all_contacts
    puts Rolodex.contacts
  end

  def display_an_attribute
    puts "What attribute would you like to see?"
    puts "[1] ID"
    puts "[2] First Name"
    puts "[3] Last Name"
    puts "[4] Email"
    puts "[5] Note"
    puts "[6] Cancel"
    puts "Enter a number: "
    user_selected = gets.to_i
    print_attribute_submenu(user_selected)
  end

  def print_attribute_submenu(user_selected)
    puts Rolodex.display_info_by_attribute("id") if user_selected == 1
    puts Rolodex.display_info_by_attribute("first_name") if user_selected == 2
    puts Rolodex.display_info_by_attribute("last_name") if user_selected == 3
    puts Rolodex.display_info_by_attribute("email") if user_selected == 4
    puts Rolodex.display_info_by_attribute("note") if user_selected == 5
    puts main_menu if user_selected == 6
    puts "Please type a number from 1 through 6" if user_selected > 6
  end  

  def exit
    
  end
end

summit = CRM.new("Welcome to summit")
summit.main_menu
