class Entry < ActiveRecord::Base
	belongs_to :user
	validates :title, :presence => true
	self.per_page = 5
	after_initialize :default_values

	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true
	attr_accessible :images_attributes, :title, :body, :date, :published
	
	def owned_by?(owner)
		return false unless owner.is_a? User
		user == owner
	end

	def author
		if user.present? && user.profile.present? && user.profile.name.present?
			user.profile.name
		end
	end

	private
		def default_values
			self.date ||= Time.now.strftime("%Y-%m-%d")
		end
end
