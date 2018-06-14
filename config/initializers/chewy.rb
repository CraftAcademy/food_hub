Chewy.root_strategy = :atomic
if ENV['CHEWY']
    Chewy.settings = {host: 'loclahost:9200'}
else
    Chewy.settings = {host: 'localhost:9250'}
end