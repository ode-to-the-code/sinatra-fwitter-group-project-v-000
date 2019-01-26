class User < ActiveRecord::Base
# this part is part of the bcrupt complex including this line, adding password_digest. The bcrypt gem and the password_digest option in the database gives you options for 2 columns, one a password and one a password confirmation. but its not required. 

  has_secure_password 
  has_many :tweets 
  
  
  def slug
    # word.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    self.username.downcase.split(" ").join("-")
  end 
  
  def self.find_by_slug(slug)
    # binding.pry
    User.find_by(username: slug.split("-").join(" "))
  end 
end 

