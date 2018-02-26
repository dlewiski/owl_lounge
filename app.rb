require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/trail")
require("./lib/region")
require("pg")
require("pry")


get('/') do
  @regions = Region.all
 erb(:index)
end

post('/') do
  region = params[:region]
  new_region = Region.create(:name => region)
  @regions = Region.all
  erb(:index)
end

get('/:name') do
  @region_name = params[:name]
  @trails = Trail.all
  erb(:region)
end

post('/:name') do
  @region_name = params[:name]
  trail_name = params[:trail_name]
  trail_length = params[:length].to_i
  regions = Region.all
  region_id = (regions.where(name: @region_name)).first.id
  new_trail = Trail.create(:name => trail_name, :length => trail_length, :region_id => region_id)
  binding.pry
  @trails = Trail.all
  erb(:region)
end
