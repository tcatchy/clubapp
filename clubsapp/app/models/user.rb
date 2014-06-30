class User < ActiveRecord::Base
	belongs_to :uni
	has_and_belongs_to_many :tickets
  has_and_belongs_to_many :events
  has_and_belongs_to_many :clubs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  def full_name
  	"#{self[:first_name]} #{self[:last_name]}"
  end

  def name
    return "#{self[:first_name]} #{self[:last_name]}"
  end

  def forem_name
    "#{self[:first_name]} #{self[:last_name]}"
  end
end