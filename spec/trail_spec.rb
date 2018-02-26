require("spec_helper")

describe(Trail) do
  it('tells us which region the trail belongs to') do
    region = Region.create({:name => "Cascadia"})
    trail = Trail.create({:name => "Tom, Dick, and Harry", :length => "6.9", :region_id => region.id})
    expect(trail.region()).to(eq(region))
  end
end
