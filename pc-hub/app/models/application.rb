class Application < ActiveRecord::Base
	has_many :notifications
	has_attached_file :slider_image, styles: {thumb: "760x546#"}
	has_attached_file :app_image, styles: {thumb: "248x178#"}

	validates :name, presence: true
	validates :name, length: { maximum: 15 }
	validates :description, presence: true
	validates :short_description, presence: true
	validates_attachment :slider_image, presence: true,
  		content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  	validates_attachment :app_image, presence: true,
  		content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  	def self.search(search)
      where("name LIKE ?", "%#{search}%") 
    end
    
end
