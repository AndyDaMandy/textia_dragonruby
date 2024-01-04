class Enemy
  attr_accessor :name, :level, :hp, :mp, :p_atk, :p_def, :m_atk, :m_def, :weakness, :exp, :money, :eSkills, :type, :steal

  def initialize(name, level, hp, mp, p_atk, p_def, m_atk, m_def, weakness, exp, money, e_skills, type, steal)
    @name = name
    @level = level
    @hp = hp
    @mp = mp
    @p_atk = pAtk
    @p_def = pDef
    @m_atk = mAtk
    @m_def = mDef
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
  args.state.iceman ||= Enemy.new('Ice Man', 1, 8, 5, 5, 2, 1, 1, Elements::FIRE, 1, 1, [], 'Frost', nil)
  args.state.bat ||= Enemy.new('Bat', 1, 13, 3, 10, 3, 1, 1, Elements::NEUTRAL, 1, 1, [], 'Flying', nil)
end