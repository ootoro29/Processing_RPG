class button1 extends Button_Material {
  void display(float x, float y, float w, float h, int size, String s, float dx, float dy) {
    stroke(0, 0, 30);
    strokeWeight(6);
    fill(180, 30, 60);
    rect(x, y, w, h, 5);
    fill(200);
    textSize(size);
    text(s, x+dx, y+dy);
  }
  void ondisplay(float x, float y, float w, float h, int size, String s, float dx, float dy) {
    stroke(0, 0, 60);
    strokeWeight(6);
    fill(250, 120, 80);
    rect(x, y, w, h, 5);
    fill(255);
    textSize(size);
    text(s, x+dx, y+dy);
  }
}
class list_button extends Button {
  Scene next;
  list_button(String s, float x, float y, int size, Button_Material M, float ... a) {
    super(s, x, y, size, M, a);
  }
  void ButtonProcess() {
    if ((onButton() && KeyState.mRget(LEFT))||((onButton()||select) && (KeyState.Rget('z')))) {
      flag = true;
    } else {
      flag = false;
    }
  }
}
class Buttons extends Button_list {
  Buttons() {
  }
  void Button_process() {
  }
}

abstract class Button_Material {
  abstract void display(float x, float y, float w, float h, int size, String s, float dx, float dy);
  abstract void ondisplay(float x, float y, float w, float h, int size, String s, float dx, float dy);
}
abstract class Button_list {
  ArrayList<Button>set_Button = new ArrayList();
  Button_list() {
  }
  void addButton(Button x) {
    set_Button.add(x);
  }
  int index = -1;
  void Button_list_display() {
    for (int i = 0; i < set_Button.size(); i++) {
      set_Button.get(i).display();
    }
  }
  void setW() {
    float max = 0;
    for (int i = 0; i < set_Button.size(); i++) {
      max = max(max, set_Button.get(i).w);
    }
    for (int i = 0; i < set_Button.size(); i++) {
      float dw = (max - set_Button.get(i).w)/2;
      set_Button.get(i).w = max;
      set_Button.get(i).dx += dw;
    }
  }
  void Button_list_process() {
    if (KeyState.Rget(UP)&&index > 0) {
      index--;
    }
    if (KeyState.Rget(DOWN)&&index<set_Button.size()-1) {
      index++;
    }
    for (int i = 0; i < set_Button.size(); i++) {
      set_Button.get(i).process();
      set_Button.get(i).select = false;
      if (set_Button.get(i).onButton()) {
        index = i;
      }
    }
    if (0<=index&&index <= set_Button.size()-1) {
      set_Button.get(index).select = true;
    }
  }
  boolean isButtonFlag(int index) {
    if (0<=index && index < set_Button.size()) {
      return set_Button.get(index).flag;
    } else {
      return false;
    }
  }
  abstract void Button_process();
}
abstract class Button {
  float x, y, w, h;
  Button_Material M;
  String s;
  float dx = 0, dy = 0;
  int size = 30;
  boolean flag = false;
  Button(String s, float x, float y, int size, Button_Material M, float ... a) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.M = M;
    this.s = s;
    w = (s.length()) * size + 30;
    h = size*1.2+5;
    dy = h-20;
    dx = 20;
    if (a.length >= 2) {
      dx = a[0];
      dy = a[1];
    }
  }
  boolean onButton() {
    boolean ans = false;
    if (x <= mouseX && mouseX <= x + w && y <= mouseY && mouseY <= y+h) {
      ans = true;
    }
    return ans;
  }
  boolean onFlag() {
    return flag;
  }
  boolean select = false;
  void display() {
    if (onButton()||select) {
      M.ondisplay(x, y, w, h, size, s, dx, dy);
    } else {
      M.display(x, y, w, h, size, s, dx, dy);
    }
  }
  void process() {
    ButtonProcess();
  }
  abstract void ButtonProcess();
}
