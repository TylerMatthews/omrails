class Pin < ActiveRecord::Base
  attr_accessible :Description, :new, :image, :image_remote_url, :description

  validates :Description, presence: true
	validates :user_id, presence: true
	validates_attachment :image, presence: true, 
															 content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] },
															 size: { less_than: 5.megabytes }


  belongs_to :user
  has_attached_file :image, styles: { medium: "320x240>" }

  def image_remote_url=(url_value)
  	self.image = URI.parse(url_value) unless url_value.blank?
  	super
  end
end
