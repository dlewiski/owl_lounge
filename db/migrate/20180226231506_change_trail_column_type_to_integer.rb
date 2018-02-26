class ChangeTrailColumnTypeToInteger < ActiveRecord::Migration[5.1]
  def change
    change_table :trails do |t|
      t.change :length, :integer
    end
  end
end
