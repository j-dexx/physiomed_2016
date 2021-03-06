class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :youtube_identifier, presence: true

  scope :displayed, -> { where(display: true) }
  scope :for_category, ->(category) { joins(:categories_videos).where(categories_videos: { category_id: category }) }
  scope :without_guide, -> {
    joins('LEFT OUTER JOIN guides on guides.video_id = videos.id')
      .where(guides: { id: nil })
  }

  has_one :guide
  has_many :categories_videos, class_name: 'Categories::Video'
  has_many :categories, through: :categories_videos

  has_many :subcategories_videos, class_name: 'Subcategories::Video'
  has_many :subcategories, through: :subcategories_videos
end
