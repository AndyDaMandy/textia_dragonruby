class Enemy
  attr_accessor :name, :level, :hp, :mp, :p_atk, :p_def, :m_atk, :m_def, :weakness, :exp, :money, :eSkills, :type, :steal

  def initialize(name, level, hp, mp, p_atk, p_def, m_atk, m_def, weakness, exp, money, e_skills, type, steal)
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
    @steal = steal
  end
end

def init_enemies(args)
  # Create instances of the Enemy class
  # args.state.goblin ||= Enemy.new('Goblin', 1, 10, 0, 5, 2, 1, 1, Elements::ICE, 1, 1, [], 'Goblin', nil)
  # args.state.potatoThief ||= Enemy.new('Potato Thief', 1, 10, 0, 5, 2, 1, 1, Elements::NEUTRAL, 1, 1, [], 'Goblin', nil)
  # args.state.goblinKing ||= Enemy.new('Goblin King', 1, 10, 0, 5, 2, 1, 1, Elements::NEUTRAL, 1, 1, [], 'Goblin', nil)
  # args.state.iceman ||= Enemy.new('Ice Man', 1, 8, 5, 5, 2, 1, 1, Elements::FIRE, 1, 1, [], 'Frost', nil)
  # args.state.bat ||= Enemy.new('Bat', 1, 13, 3, 10, 3, 1, 1, Elements::NEUTRAL, 1, 1, [], 'Flying', nil)
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
  GOBLIN = Enemy.new('Goblin', 1, 10, 0, 5, 2, 1, 1, ICE, 1, 1, [], GOBLIN, nil)
  POTATO_THIEF = Enemy.new('Potato Thief', 1, 10, 0, 5, 2, 1, 1, NEUTRAL, 1, 1, [], GOBLIN, nil)
end