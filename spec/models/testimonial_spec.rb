require "rails_helper"

RSpec.describe Testimonial, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:content) }
  end

  describe "associations" do
    it { should belong_to(:case_study) }
    it { should have_many(:categories_testimonials).class_name("Categories::Testimonial") }
    it { should have_many(:categories).through(:categories_testimonials) }
    it { should have_many(:pages_testimonials).class_name("Pages::Testimonial") }
    it { should have_many(:pages).through(:pages_testimonials) }
  end
end
