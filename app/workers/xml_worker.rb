class XmlWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :xml_import

  def perform(hash_data, user_id)
    user = User.find(user_id)
    create_contacts(hash_data, user)
  end

  def create_contacts(hash, user)
    errors = []
    hash.each do |data|
      c = Contact.new(user_id: user.id)
      c.name, c.last_name, c.phone = data["name"], data["lastName"], data["phone"]
      errors << "#{data['name']} - #{c.errors.full_messages.to_sentence}" if !c.save
    end
    user.r_set("xml_import_errors", errors) if errors.length > 0
  end

end