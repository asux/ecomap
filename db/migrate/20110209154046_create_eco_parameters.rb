class CreateEcoParameters < ActiveRecord::Migration
  def self.up
    create_table :eco_parameters do |t|
      t.string :name
      t.text :description
      t.string :unit
      t.string :kind

      t.timestamps
    end
  end

  def self.down
    drop_table :eco_parameters
  end
end
