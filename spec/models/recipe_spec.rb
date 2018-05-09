require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it {is_expected.to have_db_column :title}
  it {is_expected.to have_db_column :description}
  it {is_expected.to have_db_column :ingredients}
  it {is_expected.to have_db_column :directions}
end
