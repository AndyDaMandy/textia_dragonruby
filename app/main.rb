require '/app/data/characters.rb'
require '/app/data/skills.rb'
require '/app/data/enemies.rb'
require '/app/data/game_world.rb'
require '/app/data/items.rb'
require '/app/data/skills.rb'
require '/app/data/elements.rb'

def init_args(args)
  include Elements
  include Game_Script

  args.state.screen ||= 0
  args.state.ando ||= {
    name: 'Ando',
    level: 1,
    hp: 15,
    chp: 15,
    mp: 5,
    cmp: 5,
    p_atk: 10,
    p_def: 4,
    m_atk: 1,
    m_def: 2,
    luck: 1,
    exp: 0,
    buff: [{type: "atk", pow: 0, on: false},{type: "def", pow: 0, on: false}],
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
      p_atk: 3,
      p_def: 2,
      m_atk: 10,
      m_def: 5,
      luck: 3,
      exp: 0,
      buff: [{type: "atk", pow: 0, on: false},{type: "def", pow: 0, on: false}],
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
    p_atk: 12,
    p_def: 5,
    m_atk: 3,
    m_def: 6,
    luck: 5,
    exp: 30,
    buff: [{type: "atk", pow: 0, on: false},{type: "def", pow: 0, on: false}],
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
    p_atk: 12,
    p_def: 8,
    m_atk: 3,
    m_def: 9,
    luck: 8,
    exp: 50,
    buff: [{type: "atk", pow: 0, on: false},{type: "def", pow: 0, on: false}],
    skills: [],
    support: [],
    weapon: 'Text',
    type: 'Player'
  }
  args.state.gabriel ||= {
    name: 'Gabriel',
    level: 10,
    hp: 17,
    chp: 17,
    mp: 24,
    cmp: 24,
    p_atk: 12,
    p_def: 17,
    m_atk: 19,
    m_def: 20,
    luck: 12,
    exp: 650,
    buff: [{type: "atk", pow: 0, on: false},{type: "def", pow: 0, on: false}],
    skills: [],
    support: [],
    weapon: 'Text',
    type: 'Player'
  }
  wood_sword = {
    name: "Wooden Sword",
    category: "Weapon",
    type: "Sword",
    des: "A basic wooden sword",
    atr: "Physical",
    element: Elements::NEUTRAL,
    pow: 1
  }
  wood_staff = {
    name: "Wooden Staff",
    category: "Weapon",
    type: "Staff",
    des: "A basic Staff",
    atr: "Magical",
    element: Elements::NEUTRAL,
    pow: 1
  }

  puts wood_sword
end

def game(args)
  case args.state.screen
  when 1
    args.outputs.labels << [640, 540, Game_Script::SCRIPT[:one][:scene], 5, 1]
    # we could create buttons here... this will allow us to pick where we go
    # We set buttons here as well.
    button_creator("Forward", 2, 2, args)
    button_creator("Backward", 0, 1, args)
  else
    args.outputs.labels << [640, 540, 'Testing!', 5, 1]
    button_creator("Forward", 2, 2, args)
    button_creator("Backward", 0, 1, args)
  end
end

def game_state(args)
  case args.state.screen
  when 0
    main_menu(args)
  else
    game(args)
  end
end

def main_menu(args)
  args.outputs.labels << [640, 540, 'Textia Dragonruby!', 5, 1]
  args.outputs.borders << [450, 410, 120, 50]
  args.outputs.labels << [500, 450, "Forward", 4, 1]
  args.outputs.borders << [100, 100, 1000, 80]
  button_creator("Start Game", 1, 2, args)
end

def button_creator(text, state, position, args)
  case position
  when 0
    x = 10
    y = 10
  when 1
    x = 80
    y = 80
  when 2
    x = 150
    y = 150
  else
    # type code here
    x = 100
    y = 100
  end
  label = {
    x:                       x,
    y:                       y,
    text:                    text,
    size_enum:               2,
    alignment_enum:          1, # 0 = left, 1 = center, 2 = right
    r:                       155,
    g:                       50,
    b:                       50,
    a:                       255,
    # font:                    "fonts/manaspc.ttf",
    vertical_alignment_enum: 0  # 0 = bottom, 1 = center, 2 = top
  }
  border = {
    x: x,
    y: y,
    w: 100,
    h: 50,
    r: 255,
    g: 255,
    b: 255,
    a: 255,
    vertical_alignment_enum: 0
  }
  args.outputs.labels << label
  args.outputs.borders << border

  if (args.inputs.mouse.click) &&
    (args.inputs.mouse.point.inside_rect? border)
    args.gtk.notify! "button was clicked"
    args.state.screen = state
  end

end

def tick(args)
  init_args(args)
  game_state(args)
  args.outputs.labels << [100, 100, "#{args.state.screen}", 5, 1]


end