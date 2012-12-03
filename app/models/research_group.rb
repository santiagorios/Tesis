class ResearchGroup < ActiveRecord::Base
  self.per_page = 5
  has_many :users_groups_associations
  has_many :users, :through => :users_groups_associations
  has_many :programs
  has_many :projects, :through => :programs
  has_many :results, :through => :projects
  belongs_to :knowledge_area

  accepts_nested_attributes_for :users_groups_associations, :reject_if => lambda { |a| a[:user_id].blank? }, :allow_destroy => true

  attr_accessible :name, :knowledge_area_id, :users_groups_associations_attributes

  def user_emails=(emails)
    users = Array.new
    for email in emails
      user = User.find_by_email(email)
      unless user.nil?
        users.push(user)
      end
    end
    self.users = users
  end

  def add_current_user(user)
    self.users << user
  end

  attr_reader :user_emails
  attr_accessible :user_emails

  def owned_by?(owner)
    return false unless owner.is_a? User
    self.users.include?(owner)
  end
end
