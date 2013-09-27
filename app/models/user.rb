class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys
   
  def password
    @password ||= Password.new(password_hash)
  end
   
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(username, password)
    user = User.where(username: username).first
    return user if user && user.password == password
    return nil
    end
  end
end
