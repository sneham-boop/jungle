require 'rails_helper'

RSpec.describe Visitor, type: :model do
  describe 'Validations for Visitor' do
    # validation tests/examples here
    it "should have 'password' of minimum length 5" do
      visitor = Visitor.new({
        firstname: "Billy",
        lastname: "Bob",
        password: "password"
      })
      expect(visitor.password).to be_present
      expect(visitor.password.length).to be >=5
    end

    it "should have 'password confirmation'" do
      visitor = Visitor.new({
        firstname: "Billy",
        lastname: "Bob",
        password: "password",
        password_confirmation: "password"
      })
      visitor.save
      expect(visitor.password_confirmation).to be_present
    end

    it "should have 'password confirmation' equal to 'password'" do
      visitor = Visitor.new({
        firstname: "Billy",
        lastname: "Bob",
        password: "password",
        password_confirmation: "password"
      })
      visitor.save
      expect(visitor.password).to eq(visitor.password_confirmation)
    end

    it "should have email, firstname and lastname" do
      visitor = Visitor.new({
        firstname: "Billy",
        lastname: "Bob",
        email: "bob@bob.com",
        password: "password",
        password_confirmation: "password"
      })
      visitor.save
      expect(visitor.firstname).to be_present
      expect(visitor.lastname).to be_present
      expect(visitor.email).to be_present
    end

    it "should only allow for one unique email" do
      visitor1 = Visitor.new({
        firstname: "Billy",
        lastname: "Bob",
        email: "bob@bob.com",
        password: "password",
        password_confirmation: "password"
      })
      visitor1.save

      visitor2 = Visitor.new({
        firstname: "Lilly",
        lastname: "Gob",
        email: "gob@bob.com",
        password: "password",
        password_confirmation: "password"
      })
      new_email = visitor2.email.downcase
      find_visitor = Visitor.find_by email: new_email

      expect(find_visitor).not_to be_present
    end
  end

  describe '.authenticate_with_credentials' do
    it "should authenticate users with matching passwords" do
      visitor = Visitor.new({
        firstname: "Billy",
        lastname: "Bob",
        email: "bob@bob.com",
        password: "password",
        password_confirmation: "password"
      })
      visitor.save
      matched = Visitor.authenticate_with_credentials("bob@bob.com","password")
      expect(matched).not_to be_nil
    end

    it "should not authenticate users with mismatch in passwords" do
      visitor = Visitor.new({
        firstname: "Billy",
        lastname: "Bob",
        email: "bob@bob.com",
        password: "password",
        password_confirmation: "password"
      })
      visitor.save
      matched = Visitor.authenticate_with_credentials("bob@bob.com","passwod")
      expect(matched).to be_nil
    end

    it "should authenticate users with whitespaces around emails" do
      visitor = Visitor.new({
        firstname: "Lilly",
        lastname: "Gob",
        email: "gob@gob.com",
        password: "password",
        password_confirmation: "password"
      })
      visitor.save
      matched = Visitor.authenticate_with_credentials("   gob@gob.com   ","password")
      expect(matched).not_to be_nil
    end

    it "should authenticate users with case differences in emails" do
      visitor = Visitor.new({
        firstname: "Lilly",
        lastname: "Gob",
        email: "gob@gob.com",
        password: "password",
        password_confirmation: "password"
      })
      visitor.save
      matched = Visitor.authenticate_with_credentials("GoB@gob.com","password")
      expect(matched).not_to be_nil
    end
  end
end
 