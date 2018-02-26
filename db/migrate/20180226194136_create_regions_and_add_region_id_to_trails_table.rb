class CreateRegionsAndAddRegionIdToTrailsTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:regions) do |t|
      t.column(:name, :string)

      t.timestamps()
    end

    add_column(:trails, :region_id, :integer)
  end
end
