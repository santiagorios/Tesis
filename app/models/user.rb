class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation, :department_name, :knowledge_area_name

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

  belongs_to :knowledge_area

  def knowledge_area_name
    knowledge_area.try(:name)
  end

  def knowledge_area_name=(name)
    self.knowledge_area = KnowledgeArea.find_or_create_by_name(name) if name.present?
  end

  def phone_number
    self.profile.phone
  end
  def phone_number=(phone_number)
    self.profile.phone = phone_number
  end

  scope :top, find(:all, :order => "count(entries.id) desc", :joins => :entries, :group => 'user_id')

  def validate_knowledge_area_and_department
    if !self.knowledge_area.department.nil? and !self.department.nil? and self.knowledge_area.department != self.department
      errors.add(:knowledge_area, I18n.translate('entry.errors.knowledge_area_department', :knowledge_area => self.knowledge_area.name, :department => self.knowledge_area.department.name))
    else
      self.knowledge_area.department = self.department
      self.knowledge_area.save
    end
  end

  validate :validate_knowledge_area_and_department, :on => :update
end
