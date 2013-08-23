class Database
  @contacts = []
  @id = 1000

  def initialize 
  end

  def self.add_contact(contact)
    # puts contact.inspect
    contact.id = @id
    @contacts = @contacts.push contact
    @id += 1 
  end

  def self.contacts
    @contacts
  end

  def self.id
    @id
  end

  def self.modify_contact(contact, input_id)
    @contacts = @contacts.push contact
    contact.id = input_id
    contacts.sort_by {|obj| obj.id}
  end 

end