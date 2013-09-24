class Pick
  include DataMapper::Resource
  include DataMapper::Validate
  belongs_to :account

  property :id, Serial
  property :week, Integer
  property :team, String
  property :wager, Integer
  property :winner, Boolean, :default => false

  validates_presence_of :week, :team, :wager
end
