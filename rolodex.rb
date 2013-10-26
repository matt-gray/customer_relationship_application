class Rolodex
  @contacts = []
  @id = 1000

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def self.contacts #self defines it as a class variable
    @contacts
  end

  def modify_contact(modify_contact_id)
    contacts.map
  end

  def self.select_contacts(contact_input)
    contacts.each { |x|
      if x.first_name == contact_input
        puts @contacts
      end
    }
  end

  def self.display_all_contacts
    contacts.each { |contact| puts "#{contact.id} #{contact.first_name} #{contact.last_name} #{contact.email} #{contact.notes}" }
  end

  def self.display_info_by_attribute(user_selected)
    contacts.map do |contact|
      if user_selected == "id"
        contact.id
      elsif user_selected == "first_name"
        contact.first_name
      elsif user_selected  == "last_name"
        contact.last_name
      elsif user_selected == "email"
        contact.email
      elsif user_selected == "note"
        contact.note
      end
  end

  def self.delete_contact
    puts "Here is a list of who you know. Hope they are important"
    display_all_contacts
    puts "Who woud you want to delete? Give me the ID of the person"
    delete_user = gets.to_i
    @contacts.delete_if { |c| c.id == delete_user }
  end
end
end