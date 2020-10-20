class User < ActiveRecord::Base
   has_secure_password
   before_validation :downcase_email_and_strip
   validates :email, :uniqueness => { :case_sensitive => false }, presence: true
   validates :password, length: {minimum: 3}
   validates :name, :password, :password_confirmation, presence: true

   def self.authenticate_with_credentials(email, password)
      user = User.find_by(email: email)
      if user && user.authenticate(password)
         user
      else
         nil
      end
   end

   private
      def downcase_email_and_strip
         self.email = email.downcase.strip if email.present?
      end
end