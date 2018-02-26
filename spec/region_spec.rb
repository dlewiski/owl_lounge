require("spec_helper")
require('pry')

describe(Region) do

  describe("#trails") do
    it("tells which trails are in it") do
      test_region = Region.create({:name => "bend area"})
      test_trail1 = Trail.create({:name => "smith rock loop", :region_id => test_region.id})
      test_trail2 = Trail.create({:name => "jefferson trail", :region_id => test_region.id})
      expect(test_region.trails()).to(eq([test_trail1, test_trail2]))
    end
  end

  describe("#finds") do
    it("returns the region that contains the region name") do
      test_region1 = Region.create({:name => "Mount Hood"})
      test_region2 = Region.create({:name => "Painted Hills"})
      regions = Region.all
      expect(regions.where(name: test_region1.name)).to(eq([test_region1]))
    end
  end

end # Region
