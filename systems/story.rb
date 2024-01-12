# Story system
# This system handles the story mode of the game.
# It loads the story, and the buttons that are associated with the story.

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
    else
      button_creator(button[:text], SCENE, button[:state], position, args)
    end
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