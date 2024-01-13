class Enemy
  attr_accessor :name, :level, :hp, :mp, :p_atk, :p_def, :m_atk, :m_def, :weakness, :exp, :money, :eSkills, :type, :steal_item

  def initialize(name, level, hp, mp, p_atk, p_def, m_atk, m_def, weakness, exp, money, e_skills, type, steal_item)
    @name = name
    @level = level
    @hp = hp
    @mp = mp
    @p_atk = p_atk
    @p_def = p_def
    @m_atk = m_atk
    @m_def = m_def
    @weakness = weakness
    @exp = exp
    @money = money
    @e_skills = e_skills
    @type = type
    @steal_item = steal_item
  end
end

module Enemy_types
  GOBLIN = {
    type: 'Goblin',
    description: 'A small creature that likes to steal potatoes'
  }
  FROST = {
    type: 'Frost',
    description: 'A creature made of ice'
  }
  FLYING = {
    type: 'Flying',
    description: 'A creature that can fly'
  }
end

module Enemies
  include Elements
  include Enemy_types
  include Items
  GOBLIN = Enemy.new('Goblin', 1, 10, 0, 5, 2, 1, 1, ICE, 1, 10, [], GOBLIN, nil)
  POTATO_THIEF = Enemy.new('Potato Thief', 1, 10, 0, 5, 2, 1, 1, NEUTRAL, 1, 20, [], GOBLIN, nil)
end