class AddCharacteristicsAndLevelToCharacter < ActiveRecord::Migration[5.2]
  def change
    change_table :characters do |t|
      t.integer  :level, default: 1, null: false

      t.integer  :strength, default: 8, null: false
      t.integer  :str_modifier
      
      t.integer  :dexterity, default: 8, null: false
      t.integer  :dex_modifier

      t.integer  :constitution, default: 8, null: false
      t.integer  :con_modifier

      t.integer  :intelligence, default: 8, null: false
      t.integer  :int_modifier

      t.integer  :wisdom, default: 8, null: false
      t.integer  :wis_modifier

      t.integer  :charisma, default: 8, null: false
      t.integer  :cha_modifier
    end
  end
end
