require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:my_user) { create(:user) }
  let(:my_registered_application) { create(:registered_application) }

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:url) }

  describe "attributes" do
    it "has name and url attributes" do
      expect(my_registered_application).to have_attributes(name: my_registered_application.name, url: my_registered_application.url)
    end
  end
end
