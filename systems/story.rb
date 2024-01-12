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
      r = 0
      g = 0
      b = 0
    else
      r = 255
      g = 255
      b = 255
    end
    args.outputs.labels << [640, 540 - (i * 20), line.strip, 1, 1, r, g, b]
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


def start_menu(args)
  # displays dark mode toggle on start
  dark_mode_button(args)
  if args.state.dark_mode == false
    args.outputs.labels << [640, 540, 'Textia Dragonruby!', 5, 1, 0, 0, 0]
  else
    args.outputs.labels << [640, 540, 'Textia Dragonruby!', 5, 1, 255, 255, 255]
  end
  button_creator("Start Game", SCREEN,2, 3, args)
  # load save is the next button
end

# important! This handles movement through the game
def button_creator(text, type, state, position, args)
  case position
  when 0
    x = 100
    y = 50
  when 1
    x = 340
    y = 50
  when 2
    x = 550
    y = 50
  when 3
    # used for start menu
    x = 600
    y = 400
  else
    x = 800
    y = 50
  end

  w = 180
  h = 50

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
  label = {
    x:                       x,
    y:                       y,
    text:                    text,
    size_enum:               1,
    alignment_enum:          1, # 0 = left, 1 = center, 2 = right
    r:                       r,
    g:                       g,
    b:                       b,
    a:                       255,
    # font:                    "fonts/manaspc.ttf",
    vertical_alignment_enum: 0  # 0 = bottom, 1 = center, 2 = top
  }
  border = {
    x: x - 70,
    y: y,
    w: w,
    h: h,
    r: r,
    g: g,
    b: b,
    a: 255,
    vertical_alignment_enum: 0
  }
  args.outputs.labels << label
  if args.inputs.mouse.point.inside_rect?(border)
    border = {
      x: x - 70,
      y: y,
      w: w + 20,
      h: h + 10,
      r: r,
      g: g,
      b: b,
      a: 255,
      vertical_alignment_enum: 1
    }
    args.outputs.borders << border
  else
    args.outputs.borders << border
  end

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