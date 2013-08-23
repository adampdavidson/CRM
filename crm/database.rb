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

  def self.modify(modify_id)
    
  end 

end