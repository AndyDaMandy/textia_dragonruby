def theme(args)
  case args.state.dark_mode
  when false
    args.outputs.solids << [0, 0, 1280, 720, 255, 255, 255]
    args.outputs.labels << [1200, 100, "#{args.state.screen}", 5, 1, 0, 0, 0]
  else
    args.outputs.solids << [0, 0, 1280, 720, 0, 0, 0]
    args.outputs.labels << [1200, 100, "#{args.state.screen}", 5, 1, 255, 255, 255]
  end
end


def dark_mode_button(args)
  x = 940
  y = 540
  w = 170
  h = 50

  if args.state.dark_mode == false
    r = 0
    g = 0
    b = 0
    text = 'Dark Mode'
  else
    r = 255
    g = 255
    b = 255
    text = 'Light Mode'
  end
    dark_mode_label = {
      x:                       x,
      y:                       y,
      text:                    text,
      size_enum:               2,
      alignment_enum:          1, # 0 = left, 1 = center, 2 = right
      r:                       r,
      g:                       g,
      b:                       b,
      a:                       255,
      # font:                    "fonts/manaspc.ttf",
      vertical_alignment_enum: 0  # 0 = bottom, 1 = center, 2 = top
    }
    dark_mode_border = {
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

  args.outputs.labels << dark_mode_label

  if args.inputs.mouse.point.inside_rect?(dark_mode_border)
    dark_mode_border = {
      x: x - 70,
      y: y,
      w: w + 30,
      h: h + 20,
      r: r,
      g: g,
      b: b,
      a: 255,
      vertical_alignment_enum: 0
    }
    args.outputs.borders << dark_mode_border
  else
    args.outputs.borders << dark_mode_border
  end

  if (args.inputs.mouse.click) &&
    (args.inputs.mouse.point.inside_rect? dark_mode_border)
    args.gtk.notify! "button was clicked"
    args.state.dark_mode = !args.state.dark_mode
  end
end