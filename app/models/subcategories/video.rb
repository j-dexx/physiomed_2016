class Subcategories::Video < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order :position }

  belongs_to :subcategory, class_name: '::Subcategory'
  belongs_to :video, class_name: '::Video'
end
