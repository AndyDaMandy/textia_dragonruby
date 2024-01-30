def level_up(char)
  char.level += 1
  char.hp += 1
  char.chp += 1
  char.mp += 1
  char.cmp += 1
  char.p_atk += 1
  char.p_def += 1
  char.m_atk += 1
  char.m_def += 1
  char.luck += 1
  learn_skills(char)
end

def learn_skills(char)
  case char.name
  when 'Ando'
    if char.level == 2
      char.skills.push(BASHER)
    elsif char.level == 3
      char.skills.push(ICE_SLASH)
    end
  when 'Marie'
    if char.level == 2
      char.skills.push(FIRE)
    elsif char.level == 3
      char.skills.push(BURN)
    end
  when 'Julie'
    if char.level == 4
      char.skills.push(SLASH_ALL)
    elsif char.level == 5
      char.skills.push(POISON)
    end
  when 'Ari'
    if char.level == 6
      char.skills.push(SLEEP)
    elsif char.level == 7
      char.skills.push(HEAL)
    end
  when 'Gabriel'
    if char.level == 8
      char.skills.push(ICE_SLASH)
    elsif char.level == 9
      char.skills.push(BURN)
    end
  else
    # this shouldn't happen
    puts "error at: learn_skills"
    puts "char.name didn't match any case"
  end
end

# variables
# args.state.turn - handles moving between battle flow
# args.state.choice - handles what choice was picked this turn
# args.state.target - handles what target was picked this turn
# Current party already exists in args.state
# args.state.current_party (in init args)
# args.state.enemy_party is also in init args

def battle_screen(args)
  # TODO consider having rendering logic separated here. Importantly, the state might be an issue right now.
  # this will show, but not calculate the battle
  if args.state.dark_mode == false
    r = 0
    g = 0
    b = 0
  else
    r = 255
    g = 255
    b = 255
  end
  args.outputs.labels << [640, 700, 'Battle', 5, 1, r, g, b]
  args.outputs.labels << [640, 600, 'Enemy Party', 5, 1, r, g, b]
  if args.state.enemy_party.length == 1
    args.outputs.labels << [400, 550, "#{args.state.enemy_party[0].name}", 5, 1, r, g, b]
  elsif args.state.enemy_party.length == 2
    args.outputs.labels << [400, 550, "#{args.state.enemy_party[0].name}", 5, 1, r, g, b]
    args.outputs.labels << [600, 550, "#{args.state.enemy_party[1].name}", 5, 1, r, g, b]
  else
    args.outputs.labels << [400, 550, "#{args.state.enemy_party[0].name}", 5, 1, r, g, b]
    args.outputs.labels << [600, 550, "#{args.state.enemy_party[1].name}", 5, 1, r, g, b]
    args.outputs.labels << [800, 550, "#{args.state.enemy_party[2].name}", 5, 1, r, g, b]
  end
  args.outputs.labels << [640, 460, 'Player Party', 5, 1, r, g, b]
  args.outputs.labels << [400, 400, "#{args.state.player_party[0].name}", 5, 1, r, g, b]
  args.outputs.labels << [400, 360, "HP: #{args.state.player_party[0].chp} / #{args.state.player_party[0].hp}", 5, 1, r, g, b]
  args.outputs.labels << [400, 320, "MP: #{args.state.player_party[0].cmp} / #{args.state.player_party[0].mp}", 5, 1, r, g, b]
  args.outputs.labels << [640, 400, "#{args.state.player_party[1].name}", 5, 1, r, g, b]
  args.outputs.labels << [640, 360, "HP: #{args.state.player_party[1].chp} / #{args.state.player_party[1].hp}", 5, 1, r, g, b]
  args.outputs.labels << [640, 320, "MP: #{args.state.player_party[1].cmp} / #{args.state.player_party[1].mp}", 5, 1, r, g, b]
  if args.state.player_party.length == 3
    args.outputs.labels << [840, 400, "#{args.state.player_party[2].name}", 5, 1, r, g, b]
    args.outputs.labels << [840, 360, "HP: #{args.state.player_party[2].chp} / #{args.state.player_party[2].hp}", 5, 1, r, g, b]
    args.outputs.labels << [840, 320, "MP: #{args.state.player_party[2].cmp} / #{args.state.player_party[2].mp}", 5, 1, r, g, b]
  end
  args.outputs.labels << [640, 280, "Turn: #{args.state.turn}", 5, 1, r, g, b]
end

def battle_setup(enemies, args)
  # battleState controls battle flow and button creation.
  args.state.battle_state ||= 0

  # 0 is the init state
  if args.state.battle_state == 0
    args.state.enemy_party = enemies
    args.state.win_money  ||= 0
    args.state.exp_gain ||= 0
    args.state.enemy_hp ||= []
    args.state.player_hp ||= []
    args.state.player_mp ||= []
    args.state.dead_team ||= []
    args.state.enemy_items ||= []

    enemies.each do |e|
      args.state.exp_gain += e.exp
      args.state.win_money += e.money
      if e.steal_item != nil
        args.state.enemy_items.push(e.steal_item)
      else
        args.state.enemy_items.push(nil)
      end
    end
    args.state.battle_state = 2
  end

  # battle_flow(args.state.battle_state, args)
end

def battle_flow(args)
  battle_setup(args.state.enemy_party, args)
  # case 0 is not used here, as it's used to initialize the battle
  # case 1 is the win screen
  # case 2 is the first player turn
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
  case args.state.battle_state
  when 1
    # win screen
    # TODO: Consider copying the player_party and enemy_party arrays to a new array and then using that to calculate the win screen rather than mutating the original arrays
    if args.state.dead_team.length > 0
      args.state.dead_team.each do |char|
        args.state.current_party.push(char)
      end
      args.state.dead_team ||= 0
      args.outputs.labels << [640, 220, "all enemies Defeated!", 5, 1, r, g, b]

    end
    # Todo: money, exp, and level up
    # TODO: as well as a button to clear the battle screen and return to the story screen
  when 2
    battle_screen(args)
    # player 1 turn
    args.outputs.labels << [640, 220, "#{args.state.player_party[0].name}'s Turn. Please select a command:", 5, 1, r, g, b]
    battle_options(0, 0, 0, 3, args)
    battle_options(1, 1, 1, 3, args)
    battle_options(2, 2, 2, 3, args)
  when 3
    battle_screen(args)
    # player 1 select target
    case args.state.choice
    when 0
      # attack
      args.outputs.labels << [640, 220, "Attack Selected! Please select a target:", 5, 1, r, g, b]
      # TODO: Button creator method that will create buttons for each enemy and include a back button to go back to case 2
      # Those buttons will contain targets for the enemies
      # TODO: create a method that will generate the target button
      args.state.enemy_party.each_with_index do |enemy, i|
        target_buttons(enemy, i, 4, args)
      end
    when 1
      # skills
      skill_button_generator(args.state.player_party[0].skills, 0, 4, args)
    when 2
      # items
    else
      # this shouldn't happen
    end
  when 4
    battle_screen(args)
    # damage calculation and show information
    args.outputs.labels << [640, 220, 'You did it! You made it to step 4! Yay!', 5, 1, r, g, b]

  else
    args.outputs.labels << [640, 220, 'Something went wrong! Whoopsies', 5, 1, r, g, b]
  end
end

def battle_options(type, position, choice, state, args)
  args.state.choice ||= 0
  case position
  when 0
    x = 100
    y = 50
  when 1
    x = 340
    y = 50
  when 2
    x = 560
    y = 50
  else
    x = 800
    y = 50
  end

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

  w = 180
  h = 50
  case type
  when 0
    # attack
    text = "Attack"
    # TODO: create a method that will generate the target button

  when 1
    # skills
    text = "Skills"
    # TODO: create a method that will generate the skill buttons
  when 2
    text = "Items"
  else
    text = "this button shouldn't exist!"
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
    w = 200
    h = 60
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
    args.outputs.borders << border
  else
    args.outputs.borders << border
  end
  if (args.inputs.mouse.click) &&
    (args.inputs.mouse.point.inside_rect? border)
    args.gtk.notify! "button was clicked"
    args.state.battle_state = state
    case choice
    when 0
      # attack
      args.state.choice = 0
    when 1
      # skills
      args.state.choice = 1
    when 2
      # items
      args.state.choice = 2
    else
      # this shouldn't happen
      args.state.choice = 0
    end
  end
end

def target_buttons(enemy, position, state, args)
  # we iterate over the enemy party and create a button for each enemy, so this is just the individual button
  w = 170
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
  else
    x = 800
    y = 50
  end
  text = "#{enemy.name}"
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
    w = 190
    h = 70
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
    args.outputs.borders << border
  else
    args.outputs.borders << border
  end
  if (args.inputs.mouse.click) &&
    (args.inputs.mouse.point.inside_rect? border)
    args.gtk.notify! "button was clicked"
    # this should pull up enemy names...why doesn't it?
    args.state.battle_state = state
    args.state.target ||= enemy
  end

end

def skill_button_generator(player, position, state, args)
  # this will create a button for each skill
  # TODO: create a method that will generate the skill buttons
  # two branches based on skill type
  # one does enemy target,
  # other does ally target

end

def item_button_generator(position, state, args)
  # we use the global args.state.inventory for this
  # this will create a button for each item
end

def attack_calculation(player, enemy, enemy_hp, args)
  # this will calculate the damage done to the enemy
  #TODO create a method that will calculate the damage done to the enemy
  args.state.elemental_advantage ||= 1
  case args.state.choice
  when 0
    # attack
    if player.weapon.element == enemy.weakness
      args.state.elemental_advantage = 1.5
    else
      args.state.elemental_advantage = 1
    end
    damage = player.p_atk * args.state.element_advantage - enemy.p_def
    damage = damage.round
    if damage <= 0
      # minimum damage is 1
      damage = 1
    end
    # this calculation is incorrect, enemy hp is copied to a mutable array... so it's not actually changing the enemy hp
    # Idea, replace array with an array of hashes? No, that doesn't work.
    enemy_hp -= damage
    if enemy_hp <= 0
      enemy.chp = 0
      args.state.enemy_party.delete(enemy)
      a
      # we need to show that this happened
    end
  when 1
    # skills calc
  when 2
    # Damage items calc
  else
    # this shouldn't happen
  end

end