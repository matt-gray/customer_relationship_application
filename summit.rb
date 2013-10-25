class CRM
  def initialize(name)
    @name = name
  end
end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Exit"
    puts "Enter a number:"
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
    exit if user_selected == 6
  end

  def add_new_contact
    print "What is your first name?"
    first_name = gets.chomp
    print "What is your last name?"
    last_name = gets.chomp
    print "What is your email?"
    email = gets.chomp
    print "Please write out any notes."
    notes = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
  end


