class Work < ActiveRecord::Base
  has_many :images
  validates :name, presence: true
  attr_accessible :id, :name, :category, :detail, :order_work_by, :images_attributes, as: [:default, :admin] 
  accepts_nested_attributes_for :images, allow_destroy: true

# Previous and Next record
  def previous
  	Work.first(:conditions => ['id < ?', id], :order => "id desc")
	end

	def next
		Work.first(:conditions => ["id > ?", id], :order => "id asc")
	end

end
