class AddAdDimensionsToCreations < ActiveRecord::Migration
  def change
    add_column :creations, :ad_dimensions, :string
  end
end
