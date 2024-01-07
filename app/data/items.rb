module Item_types
  WEAPON = {
    type: 'Weapon',
    description: 'Deals damage'
  }
  ARMOR = {
    type: 'Armor',
    description: 'Increases defense'
  }
  CONSUMABLE = {
    type: 'Consumable',
    description: 'Can be used in battle'
  }
  KEY_ITEM = {
    type: 'Key Item',
    description: 'Used to progress the story'
  }
end

module Item_rarity
  COMMON = {
    rarity: 'Common',
    description: 'Common item'
  }
  RARE = {
    rarity: 'Rare',
    description: 'Rare item'
  }
  LEGENDARY = {
    rarity: 'Legendary',
    description: 'Legendary item'
  }
end

module Item_effect
  HEAL = {
    effect: 'Heal',
    description: 'Heals HP'
  }
  DAMAGE = {
    effect: 'Damage',
    description: 'Deals damage'
  }
  BUFF = {
    effect: 'Buff',
    description: 'Increases stats'
  }
  DEBUFF = {
    effect: 'Debuff',
    description: 'Decreases stats'
  }
  REVIVE = {
    effect: 'Revive',
    description: 'Revives a fallen ally'
  }
end

module Item_target
  ONE = {
    target: 'One',
    description: 'Can only target one ally or enemy'
  }
  ALL = {
    target: 'All',
    description: 'Can target all allies or enemies'
  }
end

class Item
  attr_accessor :name, :category, :type, :des, :effect, :rarity, :cost, :target

  def initialize(name, category, type, des, power, rarity, cost, target)
    @name = name
    @category = category
    @type = type
    @des = des
    @power = power
    @rarity = rarity
    @cost = cost
    @target = target
  end
end

module Items
  include Item_types
  include Item_rarity
  include Item_effect
  POTION = Item.new('Potion', CONSUMABLE, HEAL, 'Heals 50 HP', 10, COMMON, 50, ONE)
end