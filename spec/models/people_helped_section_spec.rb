require 'rails_helper'

RSpec.describe PeopleHelpedSection, type: :model do
  describe "validations" do
    it { should validate_presence_of(:number) }
    it { should validate_numericality_of(:number).only_integer.is_greater_than(0) }
    it { should validate_presence_of(:category) }
    it do
      category = create(:category)
      section = build(:people_helped_section, category: category)
      
      expect(section).to validate_uniqueness_of(:category_id)
    end
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    it { should belong_to :category }
  end

  it { should delegate_method(:name).to(:category).with_prefix }
end
