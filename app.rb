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
  @trails = Trail.all
  @region_name = params[:name]
  regions = Region.all
  @region_id = (regions.where(name: @region_name)).first.id
  erb(:region)
end

post('/:name') do
  @region_name = params[:name]
  trail_name = params[:trail_name]
  trail_length = params[:length].to_i
  regions = Region.all
  @region_id = (regions.where(name: @region_name)).first.id
  new_trail = Trail.create(:name => trail_name, :length => trail_length, :region_id => @region_id)
  @trails = Trail.all
  erb(:region)
end

get('/trail/:id') do
  trails = Trail.all
  id = params[:id].to_i
  @trail = (trails.where(id: id)).first.name
  erb(:trail_edit)
end



# here
