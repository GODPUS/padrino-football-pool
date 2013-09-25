module PadrinoFootballPool
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    #enable auto migrate so we dont have to worry about db:migrate
    DataMapper.auto_migrate!

    #create admin account
    Account.create(:email => "admin@admin.com", :name => "admin", :surname => "admin", :password => "admin", :password_confirmation => "admin", :role => "admin")

    #create teams
    Team.create(:abbr => "ARI", :name => "Arizona Cardinals")
    Team.create(:abbr => "ATL", :name => "Atlanta Falcons")
    Team.create(:abbr => "BAL", :name => "Baltimore Ravens")
    Team.create(:abbr => "BUF", :name => "Buffalo Bills")
    Team.create(:abbr => "CAR", :name => "Carolina Panthers")
    Team.create(:abbr => "CHI", :name => "Chicago Bears")
    Team.create(:abbr => "CIN", :name => "Cincinnati Bengals")
    Team.create(:abbr => "CLE", :name => "Cleveland Browns")
    Team.create(:abbr => "DAL", :name => "Dallas Cowboys")
    Team.create(:abbr => "DEN", :name => "Denver Broncos")
    Team.create(:abbr => "DET", :name => "Detroit Lions")
    Team.create(:abbr => "GB", :name => "Green Bay Packers")
    Team.create(:abbr => "HOU", :name => "Houston Texans")
    Team.create(:abbr => "IND", :name => "Indianapolis Colts")
    Team.create(:abbr => "JAX", :name => "Jacksonville Jaguars")
    Team.create(:abbr => "KC", :name => "Kansas City Chiefs")
    Team.create(:abbr => "MIA", :name => "Miami Dolphins")
    Team.create(:abbr => "MIN", :name => "Minnesota Vikings")
    Team.create(:abbr => "NE", :name => "New England Patriots")
    Team.create(:abbr => "NO", :name => "New Orleans Saints")
    Team.create(:abbr => "NYG", :name => "New York Giants")
    Team.create(:abbr => "NYJ", :name => "New York Jets")
    Team.create(:abbr => "OAK", :name => "Oakland Raiders")
    Team.create(:abbr => "PHI", :name => "Philadelphia Eagles")
    Team.create(:abbr => "PIT", :name => "Pittsburgh Steelers")
    Team.create(:abbr => "SD", :name => "San Diego Chargers")
    Team.create(:abbr => "SEA", :name => "Seattle Seahawks")
    Team.create(:abbr => "SF", :name => "San Francisco 49ers")
    Team.create(:abbr => "STL", :name => "Saint Louis Rams")
    Team.create(:abbr => "TB", :name => "Tampa Bay Buccaneers")
    Team.create(:abbr => "TEN", :name => "Tennessee Titans")
    Team.create(:abbr => "WAS", :name => "Washington Redskins")

    #create data
    w = Week.create(:num => 1, :start_at => Time.new(2013, 9, 10), :end_at => Time.new(2013, 9, 14))
    m = Matchup.create(:week => w, :start_at => Time.new(2013, 9, 12, 16, 30))
    m.teams.create(:abbr => "WAS", :name => "Washington Redskins")
    m.teams.create(:abbr => "WAS", :name => "Washington Redskins")

    DataMapper.finalize
    DataMapper.auto_upgrade!

    ##
    # Caching support
    #
    # register Padrino::Cache
    # enable :caching
    #
    # You can customize caching store engines:
    #
    # set :cache, Padrino::Cache::Store::Memcache.new(::Memcached.new('127.0.0.1:11211', :exception_retry_limit => 1))
    # set :cache, Padrino::Cache::Store::Memcache.new(::Dalli::Client.new('127.0.0.1:11211', :exception_retry_limit => 1))
    # set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => '127.0.0.1', :port => 6379, :db => 0))
    # set :cache, Padrino::Cache::Store::Memory.new(50)
    # set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache')) # default choice
    #

    ##
    # Application configuration options
    #
    # set :raise_errors, true       # Raise exceptions (will stop application) (default for test)
    # set :dump_errors, true        # Exception backtraces are written to STDERR (default for production/development)
    # set :show_exceptions, true    # Shows a stack trace in browser (default for development)
    # set :logging, true            # Logging in STDOUT for development and file for production (default only for development)
    # set :public_folder, 'foo/bar' # Location for static assets (default root/public)
    # set :reload, false            # Reload application files (default in development)
    # set :default_builder, 'foo'   # Set a custom form builder (default 'StandardFormBuilder')
    # set :locale_path, 'bar'       # Set path for I18n translations (default your_apps_root_path/locale)
    # disable :sessions             # Disabled sessions by default (enable if needed)
    # disable :flash                # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
    # layout  :my_layout            # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
    #

    ##
    # You can configure for a specified environment like:
    #
    #   configure :development do
    #     set :foo, :bar
    #     disable :asset_stamp # no asset timestamping for dev
    #   end
    #

    ##
    # You can manage errors like:
    #
    #   error 404 do
    #     render 'errors/404'
    #   end
    #
    #   error 505 do
    #     render 'errors/505'
    #   end
    #
  end
end
