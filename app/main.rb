def show_status(args, char, slot)
  if slot == 1
    x = 300   
  elsif slot == 2
    x = 500
  elsif slot == 3
    x = 700
  end
  y = 540
  args.outputs.labels  << [x, y, char.name, 5, 1]
  args.outputs.labels  << [x, y - 30, "Lvl: #{char.level}", 5, 1]
  args.outputs.labels  << [x, y - 60, "HP: #{char.hp}", 5, 1]
  args.outputs.labels  << [x, y - 90, "MP: #{char.mp}", 5, 1]
  args.outputs.labels  << [x, y - 120, "pAtk: #{char.pAtk}", 5, 1]
  args.outputs.labels  << [x, y - 150, "pdef: #{char.pDef}", 5, 1]
  args.outputs.labels  << [x, y - 180, "mAtk: #{char.mAtk}", 5, 1]
  args.outputs.labels  << [x, y - 210, "mDef: #{char.mDef}", 5, 1]
  args.outputs.labels  << [x, y - 240, "Luck: #{char.luck}", 5, 1]
  args.outputs.labels  << [x, y - 270, "exp: #{char.exp}", 5, 1]
end
def level_up(char)
  char.level += 1
  char.hp += 1
  char.chp += 1
  char.mp += 1
  char.cmp += 1
  char.pAtk += 1
  char.pDef += 1
  char.mAtk += 1
  char.mDef += 1
  char.luck += 1
  char.exp += 1
end

def tick args
  args.state.ando ||= {
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
  args.state.marie ||= {
    name: 'Marie',
    level: 1,
    hp: 10,
    chp: 10,
    mp: 13,
    cmp: 13,
    pAtk: 3,
    pDef: 2,
    mAtk: 10,
    mDef: 5,
    luck: 3,
    exp: 0,
    ##buff: [{type: "atk", pow: 0, on: false},{type: "def", pow: 0, on: false}],
    skills: [],
    support: [],
    weapon: 'Text',
    type: 'Player'
  }
  args.state.julie ||= {
    name: 'Julie',
    level: 3,
    hp: 14,
    chp: 14,
    mp: 8,
    cmp: 8,
    pAtk: 12,
    pDef: 5,
    mAtk: 3,
    mDef: 6,
    luck: 5,
    exp: 30,
    #buff: [{type: "atk", pow: 0, on: false},{type: "def", pow: 0, on: false}],
    skills: [],
    support: [],
    weapon: 'Text',
    type: 'Player'
  }
  args.state.ari ||= {
    name: 'Ari',
    level: 5,
    hp: 14,
    chp: 14,
    mp: 6,
    cmp: 6,
    pAtk: 12,
    pDef: 8,
    mAtk: 3,
    mDef: 9,
    luck: 8,
    exp: 50,
    #buff: [{type: "atk", pow: 0, on: false},{type: "def", pow: 0, on: false}],
    skills: [],
    support: [],
    weapon: 'Text',
    type: 'Player'
  }
  show_status(args, args.state.ando, 1)
  show_status(args, args.state.marie, 2)
  show_status(args, args.state.julie, 3)
  if args.inputs.keyboard.key_down.z
    level_up(args.state.ando)
  end
 # args.outputs.labels  << [640, 540, args.state.ando.name, 5, 1]
 # args.outputs.labels  << [640, 500, "hp: #{args.state.ando.hp}", 5, 1]
  
end
