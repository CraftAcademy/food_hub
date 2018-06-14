Chewy.root_strategy = :atomic
if !ENV['CHEWY'] and ENV['RAILS_ENV'] == 'test'
    # Chewy.settings = {host: 'localhost:9250'}
else
    Chewy.settings = {host: 'localhost:9200'}
end