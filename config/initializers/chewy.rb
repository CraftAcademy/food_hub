Chewy.root_strategy = :atomic
if !ENV['CHEWY'] and ENV['RAILS_ENV'] == 'test'
    # we skip setting the port if running tests
elsif ENV['RAILS_ENV'] == 'production'
    Chewy.settings = {host: ENV['BONSAI_URL']}
else
    Chewy.settings = {host: 'localhost:9200'}
end
