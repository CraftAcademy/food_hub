Chewy.root_strategy = :atomic
if !ENV['CHEWY'] and ENV['RAILS_ENV'] == 'test'
    # we skip setting the port if running tests
else
    Chewy.settings = {host: 'localhost:9200'}
end
