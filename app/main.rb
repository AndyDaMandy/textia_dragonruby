require '/app/data/button_module.rb'
require '/app/data/elements.rb'
require '/app/data/items.rb'
require '/app/data/skills.rb'
require '/app/data/enemies.rb'
require '/app/data/characters.rb'
require '/app/data/game_world.rb'
require '/app/data/skills.rb'


def init_args(args)
  include Elements
  include Enemies
  include Game_Script
  include Button_types
  include Items
  # initial setup
  if args.state.tick_count == 0
    args.state.dark_mode = true
    args.state.enemy_party ||= []
    args.state.screen ||= 0
    args.state.location ||= 1
    args.state.post_battle_screen ||= 0
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
    # rest of my setup/default state
  end
  # loads theme
  theme(args)

end

def script_and_buttons_load(scene, args)
  # loads the title, script, and buttons
  load_title(scene[:title], args)
  split_script(scene[:scene], args)
  iterate_buttons(scene[:buttons], args)
end

def load_title(scene, args)
  if args.state.dark_mode == false
    args.outputs.labels << [640, 600, scene, 5, 1, 0, 0, 0]
  else
    args.outputs.labels << [640, 600, scene, 5, 1, 255, 255, 255]
  end
end

def split_script(scene, args)
  split_script = scene.split("\n")
  split_script.each_with_index do |line, i|
    if args.state.dark_mode == false
      args.outputs.labels << [640, 540 - (i * 20), line.strip, 1, 1, 0, 0, 0]
    else
      args.outputs.labels << [640, 540 - (i * 20), line.strip, 1, 1, 255, 255, 255]
    end
  end
end

def iterate_buttons(buttons, args)
  position = 0
  buttons.each do |button|
    if button[:type] == BATTLE
      button_creator(button[:text], BATTLE, 1, position, args)
      # activates battle screen and launches battle
      args.state.post_battle_screen = button[:state]
      args.state.enemy_party = button[:effect]
      position += 1
      next
    end
    button_creator(button[:text], SCENE, button[:state], position, args)
    position += 1
  end
end

def story_mode(args)
  case args.state.location
  when 1
    script_and_buttons_load(SCRIPT[1], args)
  when 2
    script_and_buttons_load(SCRIPT[2], args)
  when 3
    script_and_buttons_load(SCRIPT[3], args)
  when 4
    script_and_buttons_load(SCRIPT[4], args)
  else
    args.outputs.labels << [640, 540, 'Something went wrong!', 5, 1]
    button_creator("Main Menu", SCREEN, 0, 2, args)
  end
end

def game_state(args)
  case args.state.screen
  when 0
    main_menu(args)
  when 1
    battle_screen(args)
  when 2
    story_mode(args)
  when 3
    #game menu
    # game menu contains functions to show inventory, skills, etc.
  when 4
    # treasure screen
    # this will show the treasure and give the player the item
  else
    args.outputs.labels << [640, 540, 'Something went wrong!', 5, 1]
    button_creator("Main Menu", SCREEN, 0, 2, args)
  end
end

def battle_screen(args)
  #this will show, but not calculate the battle
end

def battle(enemies, args)
  #this will go through the turns and calculate the battle
  #
end

def main_menu(args)
  # displays dark mode toggle on start
  dark_mode_button(args)
  if args.state.dark_mode == false
    args.outputs.labels << [640, 540, 'Textia Dragonruby!', 5, 1, 0, 0, 0]
  else
    args.outputs.labels << [640, 540, 'Textia Dragonruby!', 5, 1, 255, 255, 255]
  end
  button_creator("Start Game", SCREEN,2, "start", args)
  # load save is the next button
end

def dark_mode_button(args)
  x = 940
  y = 540
  if args.state.dark_mode == false
    dark_mode_label = {
      x:                       x,
      y:                       y,
      text:                    "Dark Mode",
      size_enum:               2,
      alignment_enum:          1, # 0 = left, 1 = center, 2 = right
      r:                       0,
      g:                       0,
      b:                       0,
      a:                       255,
      # font:                    "fonts/manaspc.ttf",
      vertical_alignment_enum: 0  # 0 = bottom, 1 = center, 2 = top
    }
    dark_mode_border = {
      x: x - 70,
      y: y,
      w: 150,
      h: 50,
      r: 0,
      g: 0,
      b: 0,
      a: 255,
      vertical_alignment_enum: 0
    }
  else
    dark_mode_label = {
      x:                       x,
      y:                       y,
      text:                    "Light Mode",
      size_enum:               2,
      alignment_enum:          1, # 0 = left, 1 = center, 2 = right
      r:                       255,
      g:                       255,
      b:                       255,
      a:                       255,
      # font:                    "fonts/manaspc.ttf",
      vertical_alignment_enum: 0  # 0 = bottom, 1 = center, 2 = top
    }
    dark_mode_border = {
      x: x - 70,
      y: y,
      w: 150,
      h: 50,
      r: 255,
      g: 255,
      b: 255,
      a: 255,
      vertical_alignment_enum: 0
    }
  end
  args.outputs.labels << dark_mode_label
  args.outputs.borders << dark_mode_border

  if (args.inputs.mouse.click) &&
    (args.inputs.mouse.point.inside_rect? dark_mode_border)
    args.gtk.notify! "button was clicked"
    args.state.dark_mode = !args.state.dark_mode
  end
end

def button_creator(text, type, state, position, args)
  case position
  when 0
    x = 100
    y = 50
  when 1
    x = 340
    y = 50
  when 2
    x = 450
    y = 50
  when "start"
    x = 600
    y = 400
  else
    x = 800
    y = 50
  end
  if args.state.dark_mode == false
    label = {
      x:                       x,
      y:                       y,
      text:                    text,
      size_enum:               1,
      alignment_enum:          1, # 0 = left, 1 = center, 2 = right
      r:                       0,
      g:                       0,
      b:                       0,
      a:                       255,
      # font:                    "fonts/manaspc.ttf",
      vertical_alignment_enum: 0  # 0 = bottom, 1 = center, 2 = top
    }
    border = {
      x: x - 70,
      y: y,
      w: 170,
      h: 50,
      r: 0,
      g: 0,
      b: 0,
      a: 255,
      vertical_alignment_enum: 0
    }
  else
    label = {
      x:                       x,
      y:                       y,
      text:                    text,
      size_enum:               1,
      alignment_enum:          1, # 0 = left, 1 = center, 2 = right
      r:                       255,
      g:                       255,
      b:                       255,
      a:                       255,
      # font:                    "fonts/manaspc.ttf",
      vertical_alignment_enum: 0  # 0 = bottom, 1 = center, 2 = top
    }
    border = {
      x: x - 70,
      y: y,
      w: 170,
      h: 50,
      r: 255,
      g: 255,
      b: 255,
      a: 255,
      vertical_alignment_enum: 0
    }
  end
  args.outputs.labels << label
  args.outputs.borders << border

  case type
  when SCREEN
    if (args.inputs.mouse.click) &&
      (args.inputs.mouse.point.inside_rect? border)
      args.gtk.notify! "button was clicked"
      args.state.screen = state
    end
  when BATTLE
    if (args.inputs.mouse.click) &&
      (args.inputs.mouse.point.inside_rect? border)
      args.gtk.notify! "button was clicked"
      args.state.screen = 1
    end
  when TREASURE
    if (args.inputs.mouse.click) &&
      (args.inputs.mouse.point.inside_rect? border)
      args.gtk.notify! "button was clicked"
      args.state.screen = 4
    end
  when SCENE
    if (args.inputs.mouse.click) &&
      (args.inputs.mouse.point.inside_rect? border)
      args.gtk.notify! "button was clicked"
      args.state.location = state
      args.state.screen = 2
    end
  else
    args.outputs.labels << [640, 540, 'Something went wrong!!', 5, 1, 255, 255, 255]
    # button_creator("Start Game", SCREEN,1, "start", args)
  end
  # if (args.inputs.mouse.click) &&
  #   (args.inputs.mouse.point.inside_rect? border)
  #   args.gtk.notify! "button was clicked"
  #   args.state.screen = state
  # end

end

def theme(args)
  if args.state.dark_mode == false
    args.outputs.solids << [0, 0, 1280, 720, 255, 255, 255]
    args.outputs.labels << [1200, 100, "#{args.state.screen}", 5, 1, 0, 0, 0]
  else
    args.outputs.solids << [0, 0, 1280, 720, 0, 0, 0]
    args.outputs.labels << [1200, 100, "#{args.state.screen}", 5, 1, 255, 255, 255]
  end
end

def tick(args)
  init_args(args)
  game_state(args)
end