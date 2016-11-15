class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :posts
  has_many :ntickets
  has_many :reservations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  after_create :set_default_role

  private

  def set_default_role
    add_role :customer
  end
         
  def admin?
    has_role?(:admin)
  end    
  def customer?
    has_role?(:customer)
  end
 


end
