require 'coveralls'
Coveralls.wear_merged!('rails')

require 'cucumber/rails'
require 'elasticsearch/extensions/test/cluster'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

World(FactoryBot::Syntax::Methods)

if !ENV['CHEWY']
  Before('@search') do 
    Chewy.strategy(:bypass)
    Elasticsearch::Extensions::Test::Cluster.start(
      port: 9200,
      nodes: 1,
      timeout: 120
    ) unless Elasticsearch::Extensions::Test::Cluster.running?(on: 9200)
    RecipesIndex.create!
    
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_response)
  end


  After('@search') do 
    RecipesIndex.delete!
    Elasticsearch::Extensions::Test::Cluster.stop(port: 9200)
  end
end