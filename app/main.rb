require 'mygame/app/data/characters.rb'
require 'mygame/app/data/character_skills.rb'
require 'mygame/app/data/monsters.rb'

def show_status(args, char, slot)
  if slot == 1
    x = 200   
  elsif slot == 2
    x = 400
  elsif slot == 3
    x = 600
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
#levels up a character
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
#this moves through the mains screen and renders battle buttons
def main_screen(args, state)
  x = 500
  y = 540
  if state == 0
    args.outputs.labels << [x, y, 'Amaryllis Town\n
      Shaman: "Hello Ando and Marie, today is the day of your pilgrimage."\n
      Our town needs a new crystal and you both are going to the Crystal Lake to gather one for us
      Without it we cannot protect ourselves from monsters much longer.\n
      To access the menu, click the "Menu" button above. You can check your items, party, skills, etc.\n
      "If you click the tutorial button you can learn a lot about how to survive. Dont go into the wilderness unprepared! You can access it at any time, so if youre ever confused you can open it again."\n
      "If youd like to move on, click below, or click the shop button above"', 5, 1]
  elsif state == 1
    args.outputs.labels << [x, y, "testing this!", 5, 1]
  end
end
def battle(args, state)
end

def output_world(args, string)

  args.outputs.labels << string.map_with_index do |s, i|
    line_height = 25
    {
      x: 60,
      y: 60.from_top - (i * line_height),
      text: s
    }
  end
end
def battle_screen(args)
  x = 500
  y = 540
  args.outputs.labels << [x, y, "Battle!", 5, 1]
end

def small_label args, x, row, message
  { x: x, y: row_to_px(args, row), text: message, size_enum: -2 }
end

def row_to_px args, row_number
  args.grid.top.shift_down(5).shift_down(20 * row_number)
end

def tick_instructions args, text, y = 715
  return if args.state.key_event_occurred
  if args.inputs.mouse.click ||
     args.inputs.keyboard.directional_vector ||
     args.inputs.keyboard.key_down.enter ||
     args.inputs.keyboard.key_down.escape
    args.state.key_event_occurred = true
  end

  args.outputs.debug << { x: 0,   y: y - 50, w: 1280, h: 60 }.solid!
  args.outputs.debug << { x: 640, y: y, text: text, size_enum: 1, alignment_enum: 1, r: 255, g: 255, b: 255 }.label!
  args.outputs.debug << { x: 640, y: y - 25, text: "(click to dismiss instructions)", size_enum: -2, alignment_enum: 1, r: 255, g: 255, b: 255 }.label!
end


# game
def tick args
  game = [
    #one
    'Amaryllis Town
    Shaman: "Hello Ando and Marie, today is the day of your pilgrimage."
    Our town needs a new crystal and you both are going to the Crystal Lake to gather one for us
    Without it we cannot protect ourselves from monsters much longer.
    To access the menu, click the "Menu" button above. You can check your items, party, skills, etc.
    "If you click the tutorial button you can learn a lot about how to survive. Dont go into the wilderness unprepared! You can access it at any time, so if youre ever confused you can open it again."
    "If youd like to move on, click below, or click the shop button above"',
    #two
    "The Forest
          You've found yourself in a mysterious forest. It's full of danger at every turn.
          You're worried the danger might be too high, maybe you should head back to town?"
  ]
  #chars states
  #args.state.ando ||= Character.new("Ando", 1, 15, 15, 5, 5, 10, 4, 1, 2, 1, 0, [{type: "atk", pow: 0, on: false},{type: "def", pow: 0, on: false}], [], [], "Sword", "Player")
  ando = ando
  args.state.ando ||= ando
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
  #enemies states

  #gamestate
  args.state.game_state ||= 0
  args.state.really_long_string ||= game[args.state.game_state]
  args.state.battle_state ||= false

  #args.state.screen ||= 0
  #main_screen(args, args.state.screen)
  #show_status(args, args.state.ando, 1)
  #show_status(args, args.state.marie, 2)
  #show_status(args, args.state.julie, 3)
  # create a really long string
=begin
  args.state.really_long_string =  {
    one: 'Amaryllis Town
        Shaman: "Hello Ando and Marie, today is the day of your pilgrimage."
        Our town needs a new crystal and you both are going to the Crystal Lake to gather one for us
        Without it we cannot protect ourselves from monsters much longer.
        To access the menu, click the "Menu" button above. You can check your items, party, skills, etc.
        "If you click the tutorial button you can learn a lot about how to survive. Dont go into the wilderness unprepared! You can access it at any time, so if youre ever confused you can open it again."
        "If youd like to move on, click below, or click the shop button above"',
    two: "The Forest
        You've found yourself in a mysterious forest. It's full of danger at every turn.
        You're worried the danger might be too high, maybe you should head back to town?"
  }
=end
#linebreak variables
# length of characters on line
  max_character_length = 80
# line height
  #line_height = 25
  long_string = args.state.really_long_string

  # API: args.string.wrapped_lines string, max_character_length
  long_strings_split = args.string.wrapped_lines long_string, max_character_length

  #checks if in battle mode or not
  if (args.state.battle_state == false)
    output_world(args, long_strings_split)
  else
    battle_screen(args)
  end


  #gameflow is as follows gamestate is equal to a number
  #Next I need buttons to control game flow
  #importantly, I need a way to make sure that the button matches the correct location, similarly to the original textia

  if args.inputs.keyboard.key_down.z
    level_up(args.state.ando)
  end

  if args.inputs.keyboard.key_down.j
    args.state.game_state += 1
    args.state.really_long_string  = game[args.state.game_state]
  end
  if args.inputs.keyboard.key_down.m
    args.state.battle_state = true
  end
  if args.inputs.keyboard.key_down.n
    args.state.battle_state = false
  end

  x = 460

  args.outputs.labels << small_label(args, x, 15, "Click inside the blue box maybe ---->")

  box = { x: 785, y: 370, w: 50, h: 50, r: 0, g: 0, b: 170 }
  args.outputs.borders << box

  # Saves the most recent click into args.state
  # Unlike the other components of args,
  # args.state does not reset every tick.
  if args.inputs.mouse.click
    args.state.last_mouse_click = args.inputs.mouse.click
  end

  if args.state.last_mouse_click
    if args.state.last_mouse_click.point.inside_rect? box
      args.outputs.labels << small_label(args, x, 16, "Mouse click happened *inside* the box.")
    else
      args.outputs.labels << small_label(args, x, 16, "Mouse click happened *outside* the box.")
    end
  else
    args.outputs.labels << small_label(args, x, 16, "Mouse click has not occurred yet.")
  end

 # args.outputs.labels  << [640, 540, args.state.ando.name, 5, 1]
 # args.outputs.labels  << [640, 500, "hp: #{args.state.ando.hp}", 5, 1]
  
end
