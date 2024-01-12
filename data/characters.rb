class Character
  attr_accessor :name, :level, :hp, :chp, :mp, :cmp, :p_atk, :p_def, :m_atk, :m_def, :luck, :exp, :buff, :skills, :support, :weapon

  def initialize(name:, level:, hp:, chp:, mp:, cmp:, p_atk:, p_def:, m_atk:, m_def:, luck:, exp:, buff:, skills:, support:, weapon:)
    @name = name
    @level = level
    @hp = hp
    @chp = chp
    @mp = mp
    @cmp = cmp
    @p_atk = p_atk
    @p_def = p_def
    @m_atk = m_atk
    @m_def = m_def
    @luck = luck
    @exp = exp
    @buff = buff
    @skills = skills
    @support = support
    @weapon = weapon
  end
end