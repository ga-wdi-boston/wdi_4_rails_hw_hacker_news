class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_many :comments

  validates_length_of :password, minimum: 8
  validates_format_of :email, :with => Devise::email_regexp, uniqueness: true
end
