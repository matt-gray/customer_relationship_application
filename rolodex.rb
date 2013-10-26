class Rolodex
  @contacts = []
  @id = 1000

  def self.add_new_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def self.contacts
    @contacts
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

end