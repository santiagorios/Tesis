class Entry < ActiveRecord::Base
	belongs_to :user
	validates :title, :presence => true
	self.per_page = 5
	after_initialize :default_values

	has_many :images
	
	def owned_by?(owner)
		return false unless owner.is_a? User
		user == owner
	end

	private
		def default_values
			self.date ||= Time.now.strftime("%Y-%m-%d")
		end
end
