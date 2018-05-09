require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Database table' do
    it {is_expected.to have_db_column :title}
    it {is_expected.to have_db_column :decsription}
    it {is_expected.to have_db_column :ingredients}
    it {is_expected.to have_db_column :directions}
  end
end
