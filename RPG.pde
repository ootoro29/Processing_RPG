PFont font_load;
void setup(){
  font_load = loadFont("MicrosoftYaHeiUI-Bold-48.vlw");
  textFont(font_load);
  size(1760,990);
  KeyState.initialize();
  main = new Title();
}
Scene main;
void draw(){
  main = main.do_scene();
  KeyState.Rini();
  KeyState.mRini();
}
