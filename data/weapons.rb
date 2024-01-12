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
  TWIN_DAGGER = {
    type: 'Twin Dagger',
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
  WOOD_SWORD = {
    name: "Wooden Sword",
    category: WEAPON,
    type: SWORD,
    des: "A basic wooden sword",
    atr: PHYSICAL,
    element: NEUTRAL,
    pow: 1
  }
  WOOD_STAFF = {
    name: "Wooden Staff",
    category: WEAPON,
    type: STAFF,
    des: "A basic Staff",
    atr: MAGICAL,
    element: NEUTRAL,
    pow: 1
  }
  WOOD_BOW = {
    name: "Wooden Bow",
    category: WEAPON,
    type: BOW,
    des: "A basic wooden bow",
    atr: PHYSICAL,
    element: NEUTRAL,
    pow: 1
  }
end