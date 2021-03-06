require "rails_helper"

RSpec.describe Practice, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:post_code) }
  end
end
