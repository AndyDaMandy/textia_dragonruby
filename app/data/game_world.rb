module Game_Script
  include Elements
  include Enemies
  include Items
  SCENE = "Scene"
  BATTLE = "Battle"
  TREASURE = "Treasure"
  SCRIPT = {
    1 => {
      title: "Amaryllis Town",
      scene: "Shaman: \"Hello Ando and Marie, today is the day of your pilgrimage.\n
              Our town needs a new crystal and you both are going to the Crystal Lake to gather one for us\n
              Without it we cannot protect ourselves from monsters much longer.\n
              To access the menu, click the \"Menu\" button above. You can check your items, party, skills, etc.\n
              If you click the tutorial button you can learn a lot about how to survive.\n
              Dont go into the wilderness unprepared!\n
              You can access it at any time, so if you're ever confused you can open it again.\n
              If you'd like to move on, click below, or click the shop button above",
      buttons: [{type: SCENE, state: 2, text: "Enter Forest", effect: nil}]
    },
    2 => {
      title: "The Forest",
      scene: "You've found yourself in a mysterious forest. It's full of danger at every turn.\n
              You're worried the danger might be too high, maybe you should head back to town?",
      buttons: [{buttons: SCENE, state: 1, text: "Back to Town", effect: nil}, {type: "scene", state: 3, text: "To the Large Tree", effect: nil}]
    },
    3 => {
      title: "The Large Tree",
      scene: "You've found a large tree!\n
              There are enemies near it!\n
              Will you fight?",
      buttons: [{type: BATTLE, state: 4 , text: "Fight", effect: [GOBLIN, POTATO_THIEF, GOBLIN]}, {type: SCENE, state: 2, text: "Run"}]
    },
  4 => {
    title:  "The Large Tree - 2",
    scene: "After defeating the enemies you can now approach the tree\n
          there you find a treasure chest\n
          Will you open it?\n",
    buttons: [{type: TREASURE, state: 5, text: "Open Chest", effect: [POTION]}, {type: SCENE, state: 5, text: "Go Forward"}]
  },
}
end

# the game world should be a hash instead with key value pairs as numbers. Then we just directly link each screen accordingly. Much better than iterating over an array