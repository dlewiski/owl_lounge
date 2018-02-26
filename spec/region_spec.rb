require("spec_helper")

describe(Region) do

  describe("#trails") do
    it("tells which trails are in it") do
      test_region = Region.create({:name => "bend area"})
      test_trail1 = Trail.create({:name => "smith rock loop", :region_id => test_region.id})
      test_trail2 = Trail.create({:name => "jefferson trail", :region_id => test_region.id})
      expect(test_region.trails()).to(eq([test_trail1, test_trail2]))
    end
  end
end
