require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "should have 'name'" do
      cat1 = Category.find_or_create_by! name: 'Gum'
      cat1.products.create!({
        name:  'Giant Tea',
        quantity: 0,
        price: 64.99
      })
      product = Product.find_by name: "Giant Tea"
      expect(product.name).to be_present
    end

    it "should have 'price'" do
      cat1 = Category.find_or_create_by! name: 'Gum'
      cat1.products.create!({
        name:  'Giant Tea',
        quantity: 0,
        price: 64.99
      })
      product = Product.find_by name: "Giant Tea"
      expect(product.price).to be_present
    end

    it "should have 'quantity'" do
      cat1 = Category.find_or_create_by! name: 'Gum'
      cat1.products.create!({
        name:  'Giant Tea',
        quantity: 0,
        price: 64.99
      })
      product = Product.find_by name: "Giant Tea"
      expect(product.quantity).to be_present
    end

    it "should have 'category'" do
      cat1 = Category.find_or_create_by! name: 'Gum'
      cat1.products.create!({
        name:  'Giant Tea',
        quantity: 0,
        price: 64.99
      })
      product = Product.find_by name: "Giant Tea"
      expect(product.category).to be_present
    end

    xit "should have 'quantity'" do
      cat1 = Category.find_or_create_by! name: 'Gum'
      cat1.products.create!({
        name:  'Giant Tea',
        quantity: nil,
        price: 64.99
      })
      product = Product.find_by name: "Giant Tea"
      p "thie is the error #{product.errors.full_messages}"
      expect(product.errors.full_messages).to raise_error("ActiveRecord::RecordInvalid:
      Validation failed: Quantity can't be blank")
    end
 
  end
end
