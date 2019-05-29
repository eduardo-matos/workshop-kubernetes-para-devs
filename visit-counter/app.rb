require 'redis'
require 'sinatra'

set(:port, 8000)
set(:bind, '0.0.0.0')

redis = Redis.new(
  host: ENV.fetch('REDIS_HOST', 'localhost'),
  port: ENV.fetch('REDIS_PORT', '6379'),
)

get '/' do
  redis.incr('visits')
  "Visits: #{redis.get('visits')}"
end
