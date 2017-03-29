 class User < ActiveRecord::Base
   before_save {
    self.email = email.downcase if email.present? 
    self.name = fix_name(self.name) if name.present?
   }
   
   validates :name, length: { minimum: 1, maximum: 100 }, presence: true
   validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
   validates :password, length: { minimum: 6 }, allow_blank: true
   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }
   has_secure_password
   
   def fix_name(name1)
     retval = []
     names = name1.split
     names.each do |name|
      name = name[0].upcase + name[1..-1]
      retval << name
     end
     return retval.join(" ")
   end
 end