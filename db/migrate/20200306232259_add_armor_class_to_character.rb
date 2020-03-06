class AddArmorClassToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :armor_class, :integer
  end
end
