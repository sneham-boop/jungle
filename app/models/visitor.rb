class Visitor < ApplicationRecord
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    formatted_email = email.strip.downcase
    visitor = Visitor.find_by_email(formatted_email)
    if visitor == nil 
      return nil 
    end

    if visitor.authenticate(password) 
      return visitor
    else
      return 
      nil
    end
  end
end
