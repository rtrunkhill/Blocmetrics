class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  after_create :send_admin_mail
  
  def send_admin_mail
    FavoriteMailer.new_user(self).deliver
  end
  
  has_many :register_apps
end
