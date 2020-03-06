class Character < ApplicationRecord
  before_save :calculate_modifiers

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
    self.str_modifier = MOD_TABLE[self.strength]
    self.dex_modifier = MOD_TABLE[self.dexterity]
    self.con_modifier = MOD_TABLE[self.constitution]
    self.int_modifier = MOD_TABLE[self.intelligence]
    self.wis_modifier = MOD_TABLE[self.wisdom]
    self.cha_modifier = MOD_TABLE[self.charisma]
  end
end
