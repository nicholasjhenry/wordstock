## About Wordstock

Wordstock is spell checking service.

This service accepts a word and returns a response indicating whether the word
is spelled correctly, with suggestions if it is mis-spelled.

You can access this service at: http://wordstock.herokuapp.com/

## Setup

Install system dependencies:

    brew install aspell

Setup the application:

    git clone git@github.com:nicholasjhenry/wordstock.git
    cd wordstock
    # note target Ruby version is 2.0, but should run on 1.9.3
    bundle
    cp .env.example .env

Start server:

     rails s

Hit the API:

     http://localhost:3000/spell.json?q=scintillating
     http://localhost:3000/spell.json?q=scintillatingZ

## Test Suite

Run the test suite with:

     rspec spec

## Deployment

Wordstock is deployed on Heroku. If you would like to deploy the application yourself,
update line 2 of `config/heroku.yml` with `<your-app-name>`.

### Setup

    rake heroku:create
    rake heroku:config
    rake secret # generate secret token and copy
    heroku config:add RAILS_SECRET_KEY_BASE=<paste secret token> -a <your-app-name>

### Deploy

    rake production deploy
