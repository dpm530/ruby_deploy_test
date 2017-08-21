class User < ActiveRecord::Base
   has_many :ideas
   has_many :likes, dependent: :destroy
   has_many :ideas_liked, through: :likes, source: :idea

   has_secure_password

   before_save :downcase_fields

   validates :name, :alias, presence: true, length: 2..30
   validates_format_of :name, with: /\b[A-Za-z]+\s[A-Za-z]+\b/
   validates :email, presence: true, uniqueness: true
   validates_format_of :email,with:  /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
   validates :password, presence: true, length: 8..30
   validates_presence_of :password_confirmation, if: :password_digest_changed?



   def downcase_fields
      self.name.downcase!
      self.alias.downcase!
      self.email.downcase!
   end

end
