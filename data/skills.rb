class Skill
  attr_accessor :name, :type, :element, :des, :pow, :cost, :target, :effect

  def initialize(name, type, element, des, pow, cost, target, effect)
    @name = name
    @type = type
    @element = element
    @des = des
    @pow = pow
    @cost = cost
    @target = target
    @effect = effect
  end
end

module Skill_types
  PHYSICAL = {
    type: 'Physical',
    description: 'Deals physical damage'
  }
  MAGICAL = {
    type: 'Magical',
    description: 'Deals magical damage'
  }
end

module Skill_targets
  SINGLE = {
    target: 'Single',
    description: 'Can only target one enemy'
  }
  ALL = {
    target: 'All',
    description: 'Can target all enemies'
  }
end

module Skill_effects
  NONE = {
    effect: 'None',
    description: 'No effect'
  }
  STUN = {
    effect: 'Stun',
    description: 'Stuns the enemy'
  }
  BURN = {
    effect: 'Burn',
    description: 'Burns the enemy'
  }
  POISON = {
    effect: 'Poison',
    description: 'Poisons the enemy'
  }
  SLEEP = {
    effect: 'Sleep',
    description: 'Puts the enemy to sleep'
  }
  FREEZE = {
    effect: 'Freeze',
    description: 'Freezes the enemy'
  }
  CONFUSE = {
    effect: 'Confuse',
    description: 'Confuses the enemy'
  }
  SLOW = {
    effect: 'Slow',
    description: 'Slows the enemy'
  }
  BLIND = {
    effect: 'Blind',
    description: 'Blinds the enemy'
  }
  SILENCE = {
    effect: 'Silence',
    description: 'Silences the enemy'
  }
  DEATH = {
    effect: 'Death',
    description: 'Instantly kills the enemy'
  }
  REVIVE = {
    effect: 'Revive',
    description: 'Revives a fallen ally'
  }
  HEAL = {
    effect: 'Heal',
    description: 'Heals HP'
  }
  BUFF = {
    effect: 'Buff',
    description: 'Increases stats'
  }
  DEBUFF = {
    effect: 'Debuff',
    description: 'Decreases stats'
  }
  DRAIN = {
    effect: 'Drain',
    description: 'Drains HP'
  }
  STEAL = {
    effect: 'Steal',
    description: 'Steals items'
  }
  MUG = {
    effect: 'Mug',
    description: 'Steals money'
  }
end


module Skills
  include Elements
  include Skill_types
  include Skill_targets
  include Skill_effects
  FIRE = Skill.new('Fire', PHYSICAL, FIRE, 'Hits enemy with magic-based fire damage', 2, 3, SINGLE, NONE)
  BASHER = Skill.new('Basher', PHYSICAL, NEUTRAL, 'Deals physical damage to 1 enemy', 5, 3, SINGLE, NONE)
  BURN = Skill.new('Burn', MAGICAL, FIRE, 'Burns the enemy', 2, 3, SINGLE, BURN)
  POISON = Skill.new('Poison', MAGICAL, NEUTRAL, 'Poisons the enemy', 2, 3, SINGLE, POISON)
  SLEEP = Skill.new('Sleep', MAGICAL, NEUTRAL, 'Puts the enemy to sleep', 2, 3, SINGLE, SLEEP)
  SLASH_ALL = Skill.new('Slash All', PHYSICAL, NEUTRAL, 'Deals physical damage to all enemies', 4, 6, ALL, NONE)
  ICE_SLASH = Skill.new('Ice Slash', PHYSICAL, ICE, 'Deals physical damage to 1 enemy', 5, 3, SINGLE, NONE)
  HEAL = Skill.new('Heal', MAGICAL, NEUTRAL, 'Heals HP', 5, 3, SINGLE, HEAL)

end