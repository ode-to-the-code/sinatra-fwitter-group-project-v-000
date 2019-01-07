class User < ActiveRecord::Base
  has_secure_password 
  has_many :tweets 
  
  
  def slug
    # word.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    self.username.downcase.split(" ").join("-")
  end 
  
end 

