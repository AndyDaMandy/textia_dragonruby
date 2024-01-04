module Game_Script
  SCRIPT = {
    1 => {
      scene: 'Amaryllis Town
      Shaman: "Hello Ando and Marie, today is the day of your pilgrimage."
      Our town needs a new crystal and you both are going to the Crystal Lake to gather one for us
      Without it we cannot protect ourselves from monsters much longer.
      To access the menu, click the "Menu" button above. You can check your items, party, skills, etc.
      "If you click the tutorial button you can learn a lot about how to survive. Dont go into the wilderness unprepared! You can access it at any time, so if youre ever confused you can open it again."
      "If you\'d like to move on, click below, or click the shop button above"',
      buttons: [2, 3]
    },
    2 => {
      scene: "The Forest
            You've found yourself in a mysterious forest. It's full of danger at every turn.
            You're worried the danger might be too high, maybe you should head back to town?",
      buttons: []
    },
    three: "testing testing"
}
end

# the game world should be a hash instead with key value pairs as numbers. Then we just directly link each screen accordingly. Much better than iterating over an array