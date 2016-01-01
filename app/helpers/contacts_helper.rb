module ContactsHelper
  def notify_message_class(contact)
    'green-text' unless contact.is_read
  end
end
