require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.create(name: 'Vlad', email: ' v@G.COM ', password: '123', password_confirmation: '123')  }

  describe 'Validations' do
     describe 'email' do 
      it 'must be lover case and stip white space' do 
        expect(subject).to be_valid
      end
    end

    describe 'password' do 
      it 'must be present' do 
        subject.password = nil
        expect(subject).to_not be_valid
      end
    end

    describe 'password_confirmation' do 
      it 'must be present' do 
        subject.password_confirmation = nil
        expect(subject).to_not be_valid
      end
    end

    describe 'email' do 
      it 'must be unique' do 
        user1 = described_class.create(name: 'Vlad', email: 'v@g.com', password: '123', password_confirmation: '123')
        user2 = described_class.create(name: 'Vlad', email: 'v@G.COM', password: '123', password_confirmation: '123')
        expect(user2).to_not be_valid
      end
    end

    describe 'password length' do 
      it 'must be min 3' do 
        user = described_class.create(name: 'Vlad', email: 'v@g.com', password: '1', password_confirmation: '1')
        expect(user).to_not be_valid
      end
    end
  end

  describe 'authenticate_with_credentials' do
    it 'should be valid' do
      auth_user = User.authenticate_with_credentials(subject.email, subject.password)
      expect(auth_user).to_not be_nil
    end
  end
end
