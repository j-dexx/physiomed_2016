class Page < ActiveRecord::Base
  include MenuResourceable

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, PageUploader

  has_one :what_we_do_link
  has_many :pages_testimonials, class_name: 'Pages::Testimonial'
  has_many :testimonials, through: :pages_testimonials

  has_many :page_team_members,
           dependent: :destroy,
           class_name: 'Pages::TeamMember'

  has_many :team_members,
           through: :page_team_members

  before_save :store_image, if: proc { |page| page.remote_image_url.blank? }
  # before_save :store_file, if: Proc.new{|page| page.remote_file_url.blank? }

  scope :displayed, -> { where(display: true) }

  validates :title, :content, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }

  def slug_candidates
    [
      :suggested_url,
      :title,
      [:suggested_url, :title]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || title_changed?
  end

  def route
    "{:controller => '/pages', :action => 'show', :id => '#{slug}'}"
  end

  def self.layouts
    %w( application )
  end

  def self.styles
    %w( basic )
  end

  def store_image
    Optimadmin::Image.store_image(self, image) if image.present? && image_changed?
  end

  # def store_file
  #   Optimadmin::Document.store_file(self, file) if file.present? && file_changed?
  # end
end
