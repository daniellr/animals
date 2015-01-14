class Post < ActiveRecord::Base

	attr_accessor :image
	belongs_to :user

	before_validation :set_defaults, on: :create

	validates :title, :state, :contact, :description, presence: true
	validates :image, presence: true if Rails.env.production?

	after_validation :geocode, :if => :location_changed?

	mount_uploader :image, ImageUploader
	geocoded_by :location

	scope :found, 		-> { where(state: 'found') }
	scope :lost,			-> { where(state: 'lost') }
	scope :adoption,	-> { where(state: 'adoption') }

	def active?
		self.status == 'active'
	end

	def closed?
		self.status == 'closed'
	end

	private

	def set_defaults
      self.status = 'active'
    end
end
