require 'rails_helper'

RSpec.describe Product, type: :model do  

  describe 'Validations' do
    describe 'name' do 
      it 'must be present' do 
        @category = Category.create(name: "Food")
        product = described_class.new(name: nil, price: 10, quantity: 2, category_id: @category.id) 

        expect(product).to_not be_valid
      end
    end

  describe 'price' do 
    it 'must be present' do 
      @category = Category.create(name: "Food")
      product = described_class.new(name: "Bananas", price: nil, quantity: 2, category_id: @category.id) 

      expect(product).to_not be_valid
    end
  end

  describe 'quantity' do 
    it 'must be present' do 
      @category = Category.create(name: "Food")
      product = described_class.new(name: "Bananas", price: 10, quantity: nil, category_id: @category.id) 

      expect(product).to_not be_valid
    end
  end

  describe 'category' do 
    it 'must be present' do 
      @category = Category.create(name: "Food")
      product = described_class.new(name: "Bananas", price: 10, quantity: 2, category_id: nil) 

      expect(product).to_not be_valid
    end
  end

  describe 'category' do 
    it 'must be present' do 
      @category = Category.create(name: "Food")
      product = described_class.new(name: "Bananas", price: 10, quantity: 2, category_id: @category.id) 

      expect(product).to be_valid
    end
  end
  
  end
end
