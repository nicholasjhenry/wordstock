require 'heroku_san'

module Wordstock
  # Custom strategy as the default does a db:migrate. Since we don't require
  # persistence then this is unnecessary.
  class Strategy < HerokuSan::Deploy::Base
    def deploy
      # Deploy without migration
      super
    end
  end
end

HerokuSan.project = HerokuSan::Project.new(
  Rails.root.join("config","heroku.yml"),
  :deploy => Wordstock::Strategy
)
