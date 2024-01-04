module Game_Script
  SCRIPT = {
    1 => {
      scene: "Amaryllis Town\n
      Shaman: \"Hello Ando and Marie, today is the day of your pilgrimage.\n
      Our town needs a new crystal and you both are going to the Crystal Lake to gather one for us\n
      Without it we cannot protect ourselves from monsters much longer.\n
      To access the menu, click the \"Menu\" button above. You can check your items, party, skills, etc.\n
      If you click the tutorial button you can learn a lot about how to survive.\n
      Dont go into the wilderness unprepared!\n
      You can access it at any time, so if you're ever confused you can open it again.\n
      If you'd like to move on, click below, or click the shop button above",
      buttons: [{state: 2, text: "Enter Forest"}]
    },
    2 => {
      scene: "The Forest\n
            You've found yourself in a mysterious forest. It's full of danger at every turn.\n
            You're worried the danger might be too high, maybe you should head back to town?",
      buttons: []
    },
    three: "testing testing"
}
end

# the game world should be a hash instead with key value pairs as numbers. Then we just directly link each screen accordingly. Much better than iterating over an array