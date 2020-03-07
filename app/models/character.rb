class Character < ApplicationRecord
  before_save :calculate_modifiers
  before_save :calculate_armor_class

  MOD_TABLE = {
    1 => '-5',
    2 => '-4',
    3 => '-4',
    4 => '-3',
    5 => '-3',
    6 => '-2',
    7 => '-2',
    8 => '-1',
    9 => '-1',
    10 => '0',
    11 => '0',
    12 => '+1',
    13 => '+1',
    14 => '+2',
    15 => '+2',
    16 => '+3',
    17 => '+3',
    18 => '+4',
    19 => '+4',
    20 => '+5'
  }.freeze

  belongs_to :user

  validates :name, presence: true

  private

  def calculate_modifiers
    self.str_modifier = MOD_TABLE[strength]
    self.dex_modifier = MOD_TABLE[dexterity]
    self.con_modifier = MOD_TABLE[constitution]
    self.int_modifier = MOD_TABLE[intelligence]
    self.wis_modifier = MOD_TABLE[wisdom]
    self.cha_modifier = MOD_TABLE[charisma]
  end

  def calculate_armor_class
    self.armor_class = 10 + dex_modifier.to_i
  end
end
