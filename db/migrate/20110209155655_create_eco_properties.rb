class CreateEcoProperties < ActiveRecord::Migration
  def self.up
    create_table :eco_properties do |t|
      t.references :sample
      t.references :eco_parameter
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :eco_properties
  end
end
