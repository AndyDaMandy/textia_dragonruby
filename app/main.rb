require '/data/button_module.rb'
require '/data/elements.rb'
require '/data/items.rb'
require '/data/skills.rb'
require '/data/enemies.rb'
require '/data/weapons.rb'
require '/systems/battle.rb'
require '/systems/theme.rb'
require '/data/characters.rb'
require '/data/story_script.rb'
require '/systems/story.rb'


def init_args(args)
  include Elements
  include Skills
  include Enemies
  include Game_Script
  include Button_types
  include Weapons
  include Items
  # initial setup
  if args.state.tick_count == 0
    args.state.dark_mode = true
    args.state.enemy_party ||= []
    args.state.screen ||= 0
    args.state.location ||= 1
    args.state.weapon_inventory ||= []
    args.state.inventory ||= [POTION, POTION, POTION]
    args.state.key_items ||= []
    args.state.post_battle_screen ||= 0
    # args.state.ando ||= Character.new('Ando', 1, 15, 15, 5, 5, 10, 4, 1, 2, 1, 0,[{type: "atk", pow: 0, on: false},{type: "def", pow: 0, on: false}], [BASHER, ICE_SLASH], [], WOOD_SWORD)
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
      skills: [BASHER, ICE_SLASH],
      weapon: WOOD_SWORD,
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
      skills: [FIRE],
      weapon: WOOD_STAFF,
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
      weapon: WOOD_BOW,
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
      weapon: IRON_DAGGERS,
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
      weapon: FIRE_TOME,
    }
    # rest of my setup/default state
    args.state.player_party ||= [args.state.ando, args.state.marie, args.state.julie]
  end
  # loads theme
  theme(args)
  puts "Screen State: #{args.state.screen}, Story Location #{args.state.location}, post-battle state: #{args.state.post_battle_screen}"
  # puts "Player Party: #{args.state.player_party}"
  puts "Enemy Party: #{args.state.enemy_party}"
end

def game_screen(args)
  # this is controls the screen of the game
  # args.state.screen controls the screen and is passed into this
  # We access different menus by flipping args.state.screen
  case args.state.dark_mode
  when false
    r = 0
    g = 0
    b = 0
  else
    r = 255
    g = 255
    b = 255
  end
  case args.state.screen
  when 0
    start_menu(args)
  when 1
    battle_flow(args)
    # battle screen initializes the battle, sets enemies, etc.
    # It also shows the battle and any updates via the battle_flow function
  when 2
    story_mode(args)
  when 3
    # game menu
    # game menu contains functions to show inventory, skills, etc.
  when 4
    # Notification?
    # this will show the treasure and give the player the item
    # Perhaps treasure too
  else
    args.outputs.labels << [640, 540, 'Something went wrong!', 5, 1, r, g, b]
    button_creator("Main Menu", SCREEN, 0, 2, args)
  end
end

def pause_game(args)
  # this will pause the game when not focused
  if !args.inputs.keyboard.has_focus && args.gtk.production && args.state.tick_count != 0
    args.outputs.background_color = [0, 0, 0]
    args.outputs.labels << { x: 640,
                             y: 360,
                             text: "Game Paused (click to resume).",
                             alignment_enum: 1,
                             r: 255, g: 255, b: 255 }
    # consider setting all audio volume to 0.0
  end
end

def tick(args)
  init_args(args)
  game_screen(args)
  pause_game(args)
end