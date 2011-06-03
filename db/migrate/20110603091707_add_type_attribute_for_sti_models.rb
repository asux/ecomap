class AddTypeAttributeForStiModels < ActiveRecord::Migration
  STI_TABLES = [:samples, :eco_parameters]

  def self.up
    STI_TABLES.each do |table|
      add_column table, :type, :string, :length => 40
    end

    Sample.reset_column_information
    say_with_time "Updating water samples" do
      Sample.where(:kind => 'water').update_all(:type => 'WaterSample')
    end
    say_with_time "Updating soil samples" do
      Sample.where(:kind => 'soil').update_all(:type => 'SoilSample')
    end

    EcoParameter.reset_column_information
    say_with_time "Updating water eco_parameters" do
      EcoParameter.where(:kind => 'water').update_all(:type => 'WaterEcoParameter')
    end
    say_with_time "Updating soil eco_parameters" do
      EcoParameter.where(:kind => 'soil').update_all(:type => 'SoilEcoParameter')
    end

    STI_TABLES.each do |table|
      remove_column table, :kind
    end

    announce "The tables #{STI_TABLES.join(', ')} use STI"
  end

  def self.down
    STI_TABLES.each do |table|
      add_column table, :kind, :string
    end

    Sample.reset_column_information
    say_with_time "Updating water samples" do
      Sample.where(:type => 'WaterSample').update_all(:kind => 'water')
    end
    say_with_time "Updating soil samples" do
      Sample.where(:type => 'SoilSample').update_all(:kind => 'soil')
    end

    EcoParameter.reset_column_information
    say_with_time "Updating water eco_parameters" do
      EcoParameter.where(:type => 'WaterEcoParameter').update_all(:kind => 'water')
    end
    say_with_time "Updating soil eco_parameters" do
      EcoParameter.where(:type => 'SoilEcoParameter').update_all(:kind => 'soil')
    end

    STI_TABLES.each do |table|
      remove_column table, :type
    end

    announce "The tables #{STI_TABLES.join(', ')} no longer use STI"
  end
end
