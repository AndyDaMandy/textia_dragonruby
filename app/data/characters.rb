# shows character status
class Character
  attr_accessor :name, :level, :hp, :chp, :mp, :cmp, :pAtk, :pDef, :mAtk, :mDef, :luck, :exp, :buff, :skills, :support, :weapon, :type
  def initialize(name, level, hp, chp, mp, cmp, pAtk, pDef, mAtk, mDef, luck, exp, buff, skills, support, weapon, type)
    @name = name
    @level = level
    @hp = hp
    @chp = chp
    @mp = mp
    @cmp = cmp
    @pAtk = pAtk
    @pDef = pDef
    @mAtk = mAtk
    @mDef = mDef
    @luck = luck
    @exp = exp
    @buff = buff
    @skills = skills
    @support = support
    @weapon = weapon
    @type = type
  end
end

ando = {
  name: 'Ando',
  level: 1,
  hp: 15,
  chp: 15,
  mp: 5,
  cmp: 5,
  pAtk: 10,
  pDef: 4,
  mAtk: 1,
  mDef: 2,
  luck: 1,
  exp: 0,
  #buff: [{type: "atk", pow: 0, on: false},{type: "def", pow: 0, on: false}],
  skills: [],
  support: [],
  weapon: 'Text',
  type: 'Player'
}
