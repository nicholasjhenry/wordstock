## Setup

Install system dependencies:

    brew install aspell

Set up environment:

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