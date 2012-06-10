class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[^@][\w.-]+@espe.edu.ec/i

  validates_length_of :password, :minimum => 6, :on => :create
  validates_length_of :password, :minimum => 6, :on => :update, :allow_blank => true


  has_one :profile
  accepts_nested_attributes_for :profile
  attr_accessible :profile_attributes
end
