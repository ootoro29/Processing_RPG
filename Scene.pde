abstract class Scene {
  Scene next;
  Scene() {
    next = this;
  }
  Scene do_scene() {
    display();
    process();
    return next;
  }
  abstract void display();
  abstract void process();
}
class Title extends Scene {
  Button_list blist = new Buttons();
  Title() {
    Button_Material bd = new button1();
    blist.addButton(new list_button("最初から始める", 1200, 500, 70, bd));
    blist.addButton(new list_button("続きから始める", 1200, 620, 70, bd));
    blist.addButton(new list_button("設定", 1200, 740, 70, bd));
    blist.addButton(new list_button("ゲームをやめる", 1200, 860, 70, bd));
    blist.setW();
  }
  void display() {
    background(120,200,255);
    blist.Button_list_display();
  }
  void process() {
    blist.Button_list_process();
    if (blist.isButtonFlag(0)) {
      next = new Game();
    }
    if (blist.isButtonFlag(1)) {
      next = new Game();
    }
    if (blist.isButtonFlag(2)) {
      next = new option_scene();
    }
    if (blist.isButtonFlag(3)) {
      exit();
    }
  }
}
class option_scene extends Scene {
  Button_list blist = new Buttons();
  option_scene() {
    colorMode(RGB);
    Button_Material bd = new button1();
    blist.addButton(new list_button("BACK", 1550, 850, 70, bd));
    blist.setW();
  }
  void process() {
    blist.Button_list_process();
    if (blist.isButtonFlag(0)) {
      next = new Title();
    }
  }
  void display() {
    background(155, 120, 120);
    blist.Button_list_display();
  }
}
class Game extends Scene {
  Button_list blist = new Buttons();
  Game() {
    Button_Material bd = new button1();
    blist.addButton(new list_button("BATTLE", 1300, 650, 70, bd));
  }
  void process() {
    blist.Button_list_process();
    if(blist.isButtonFlag(0)){
      //next = new Battle();
    }
  }
  void display() {
  }
}
