class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation, :department_name

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

  has_many :entries

  def header_name
    if profile.present? && profile.name.present?
      profile.name
    else
      email
    end
  end

  belongs_to :department

  def department_name
    department.try(:name)
  end

  def department_name=(name)
    self.department = Department.find_or_create_by_name(name) if name.present?
  end
end
