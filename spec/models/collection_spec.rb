require 'rails_helper'

RSpec.describe Collection, type: :model do
  describe "Database table" do
    it { is_expected.to have_db_column :user_id }
  end

  describe "Associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :recipes }
  end

  describe "Factory" do
    it "can create a valid instance" do
      expect(create(:collection)).to be_valid
    end
  end

  describe 'Attachment' do
    it 'is valid  ' do
      subject.pdf.attach(io: File.open(fixture_path + '/tmp-maran.pdf'), filename: 'attachment.pdf', content_type: 'pdf/pdf')
      expect(subject.pdf).to be_attached
    end
  end
end
