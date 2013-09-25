class Team
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :abbr, String
  property :bye_week, Integer
  property :wins, Integer, :default => 0
  property :losses, Integer, :default => 0
end
