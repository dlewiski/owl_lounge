ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("trail")
require("region")

RSpec.configure do |config| # clear db between spec runs
  config.after(:each) do
    Trail.all.each do |trail|
      trail.destroy
    end
    Region.all.each do |region|
      region.destroy
    end
  end
end
