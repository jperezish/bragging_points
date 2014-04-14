class AddBraggingPointsToPools < ActiveRecord::Migration
  def change
    add_column :pools, :bragging_points, :decimal
  end
end
