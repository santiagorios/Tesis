class ResearchGroup < ActiveRecord::Base
  self.per_page = 5
  has_and_belongs_to_many :users
  has_many :programs
  has_many :projects, :through => :programs
  has_many :results, :through => :projects
  belongs_to :knowledge_area

  attr_accessible :name, :knowledge_area_id

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
