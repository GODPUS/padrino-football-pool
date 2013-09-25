class Week
  include DataMapper::Resource

  property :id, Serial
  property :num, Integer
  property :complete, Boolean
  property :start_at, DateTime
  property :end_at, DateTime

  has n, :matchups
end
