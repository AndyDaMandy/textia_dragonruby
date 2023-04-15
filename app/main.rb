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

def main_screen(args, state)
  x = 500
  y = 540
  if state == 0
    args.outputs.labels << [x, y, 'Amaryllis Town\n
      Shaman: "Hello Ando and Marie, today is the day of your pilgrimage."\n
      Our town needs a new crystal and you both are going to the Crystal Lake to gather one for us
      Without it we cannot protect ourselves from monsters much longer.
      To access the menu, click the "Menu" button above. You can check your items, party, skills, etc.
      "If you click the tutorial button you can learn a lot about how to survive. Dont go into the wilderness unprepared! You can access it at any time, so if youre ever confused you can open it again."
      "If youd like to move on, click below, or click the shop button above"', 5, 1]
  elsif state == 1
    args.outputs.labels << [x, y, "testing this!", 5, 1]
  end
end

def tick args
  #chars states
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
  #enemies states
  # length of characters on line
  max_character_length = 80
  # line height
  line_height = 25

  #args.state.screen ||= 0
  #main_screen(args, args.state.screen)
  #show_status(args, args.state.ando, 1)
  #show_status(args, args.state.marie, 2)
  #show_status(args, args.state.julie, 3)
  # create a really long string
  args.state.really_long_string =  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vulputate viverra metus et vehicula. Aenean quis accumsan dolor. Nulla tempus, ex et lacinia elementum, nisi felis ullamcorper sapien, sed sagittis sem justo eu lectus. Etiam ut vehicula lorem, nec placerat ligula. Duis varius ultrices magna non sagittis. Aliquam et sem vel risus viverra hendrerit. Maecenas dapibus congue lorem, a blandit mauris feugiat sit amet."
  args.state.really_long_string += "\n"
  args.state.really_long_string += "Sed quis metus lacinia mi dapibus fermentum nec id nunc. Donec tincidunt ante a sem bibendum, eget ultricies ex mollis. Quisque venenatis erat quis pretium bibendum. Pellentesque vel laoreet nibh. Cras gravida nisi nec elit pulvinar, in feugiat leo blandit. Quisque sodales quam sed congue consequat. Vivamus placerat risus vitae ex feugiat viverra. In lectus arcu, pellentesque vel ipsum ac, dictum finibus enim. Quisque consequat leo in urna dignissim, eu tristique ipsum accumsan. In eros sem, iaculis ac rhoncus eu, laoreet vitae ipsum. In sodales, ante eu tempus vehicula, mi nulla luctus turpis, eu egestas leo sapien et mi."

  

  long_string = args.state.really_long_string

  # API: args.string.wrapped_lines string, max_character_length
  long_strings_split = args.string.wrapped_lines long_string, max_character_length

  # render a label for each line and offset by the line_height
  args.outputs.labels << long_strings_split.map_with_index do |s, i|
    {
      x: 60,
      y: 60.from_top - (i * line_height),
      text: s
    }
  end
  if args.inputs.keyboard.key_down.z
    level_up(args.state.ando)
  end
  if args.inputs.keyboard.key_down.j
    args.state.screen += 1
  end
 # args.outputs.labels  << [640, 540, args.state.ando.name, 5, 1]
 # args.outputs.labels  << [640, 500, "hp: #{args.state.ando.hp}", 5, 1]
  
end
