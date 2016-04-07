class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :expenses, :class_name => 'Expense'
  has_many :purchases, :through => :expenses
  has_and_belongs_to_many :shopping_trips
  has_many :debts
  accepts_nested_attributes_for :debts, allow_destroy: true

  accepts_nested_attributes_for :purchases, :expenses, :shopping_trips, :allow_destroy => true
         
  # Virtual attribute for authenticating by either username or email
  attr_accessor :login
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def self.all_except(user)
    where.not(id: user)
  end
  
  # Make sure there's no conflict between username and email
  validate :validate_username
  
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
