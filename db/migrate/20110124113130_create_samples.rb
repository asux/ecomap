class CreateSamples < ActiveRecord::Migration
  def self.up
    create_table :samples do |t|
      t.string :kind, :default => Sample::KINDS.first
      t.string :object_name
      t.decimal :lng, :precision => 17, :scale => 14
      t.decimal :lat, :precision => 17, :scale => 14
      t.references :owner
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :samples
  end
end
