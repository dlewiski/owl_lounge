class CreateTrails < ActiveRecord::Migration[5.1]
  def change
    create_table(:trails) do |t|
      t.column(:name, :string)
      t.column(:length, :decimal)

      t.timestamps
    end
  end
end # CreateTrails
