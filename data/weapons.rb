class Weapon
  attr_accessor :name, :category, :type, :description, :attribute, :pow, :element, :cost, :rarity

  def initialize(name, category, type, description, attribute, pow, element, cost, rarity)
    @name = name
    @category = category
    @type = type
    @description = description
    @attribute = attribute
    @pow = pow
    @element = element
    @cost = cost
    @rarity = rarity
  end
end


module Weapon_types
  SWORD = {
    type: 'Sword',
    description: 'Deals physical damage'
  }
  STAFF = {
    type: 'Staff',
    description: 'Deals magical damage'
  }
  BOW = {
    type: 'Bow',
    description: 'Deals physical damage'
  }
  TWIN_DAGGERS = {
    type: 'Twin Daggers',
    description: 'Deals physical damage'
  }
  TOME = {
    type: 'Tome',
    description: 'Deals magical damage'
  }
end

module Weapons
  include Elements
  include Weapon_types
  include Item_types
  include Attributes
  include Item_rarity
  WOOD_SWORD = Weapon.new('Wooden Sword', WEAPON, SWORD, 'A basic wooden sword', PHYSICAL, 1, NEUTRAL, 1, COMMON)
  WOOD_STAFF = Weapon.new('Wooden Staff', WEAPON, STAFF, 'A basic wooden staff', MAGICAL, 1, NEUTRAL, 1, COMMON)
  WOOD_BOW = Weapon.new('Wooden Bow', WEAPON, BOW, 'A basic wooden bow', PHYSICAL, 1, NEUTRAL, 1, COMMON)
  IRON_DAGGERS = Weapon.new('Iron Daggers', WEAPON, TWIN_DAGGERS, 'Two daggers made of iron', PHYSICAL, 3, NEUTRAL, 30, COMMON)
  IRON_SWORD = Weapon.new('Iron Sword', WEAPON, SWORD, 'A sword made of iron', PHYSICAL, 3, NEUTRAL, 30, COMMON)
  IRON_STAFF = Weapon.new('Iron Staff', WEAPON, STAFF, 'A staff made of iron', MAGICAL, 3, NEUTRAL, 30, COMMON)
  IRON_BOW = Weapon.new('Iron Bow', WEAPON, BOW, 'A bow made of iron', PHYSICAL, 3, NEUTRAL, 30, COMMON)
  FIRE_TOME = Weapon.new('Fire Tome', WEAPON, TOME, 'A tome that can cast fire spells', MAGICAL, 3, FIRE, 30, COMMON)
  ICE_TOME = Weapon.new('Ice Tome', WEAPON, TOME, 'A tome that can cast ice spells', MAGICAL, 3, ICE, 30, COMMON)
end