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
