# FoodHub

FoodHub is an open-source social platform for sharing recipes, where users can fork recipes in a GitHub manner, edit, and share them.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

In order to get the platform running, you need the following:

* Rails version 5.2.0
* Ruby version 2.4.1
* Bundler

In addition you need to install the following servers:

* Elastic Search, more about setup [here](https://github.com/elastic/elasticsearch)
* Redis, more about setup [here](https://github.com/antirez/redis)

### Installation

In order to run the platform after cloning, you need to run bundler using

```
bundle install
```

Database need to be created, migrated and seed loaded using the following

```
rails db:create db:migrate db:setup
```

## Running the tests

FoodHub uses Cucumber for acceptance test and Rspec for unit test.

To run the tests individually, use the following for acceptance test

```
bundle exec cucumber
```

and for unit test

```
bundle exec rspec
```

Please note that running tests that include search requires running Elastic Search server

To run both  tests in one command, run

```
bundle exec rake
```

## Deployment

The host should be able to run the prerequisted servers.
Deployment has been implemented successfully on Heroku.


## Contributing

Please feel free to fork and submit pull requests to us.

## Authors

See also the list of [contributors](https://github.com/CraftAcademy/food_hub/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* [Thomas Ochman](https://github.com/tochman)
