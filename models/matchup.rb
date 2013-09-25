class Matchup
  include DataMapper::Resource

  property :id, Serial
  property :start_at, DateTime
  property :homefield_team, String
  property :winning_team, String
  property :losing_team, String
  property :is_tie_breaker, Boolean, :default => false

  belongs_to :week
  has n, :teams
end
