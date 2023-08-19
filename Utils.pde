public static class KeyState {
  private static final HashMap<Integer, Boolean> states = new HashMap<Integer, Boolean>();
  private static final HashMap<Character, Boolean> Csta = new HashMap<Character, Boolean>();

  private static final HashMap<Integer, Boolean> Rstates = new HashMap<Integer, Boolean>();
  private static final HashMap<Character, Boolean> RCsta = new HashMap<Character, Boolean>();

  private static final HashMap<Integer, Boolean> Rmouse = new HashMap<Integer, Boolean>();
  private static final HashMap<Integer, Boolean> mouse = new HashMap<Integer, Boolean>();
  private KeyState() {
  }

  static void initialize() {
    states.put(LEFT, false);
    states.put(RIGHT, false);
    states.put(UP, false);
    states.put(DOWN, false);
    states.put(SHIFT, false);
    Csta.put('w', false);
    Csta.put('a', false);
    Csta.put('s', false);
    Csta.put('d', false);
    Csta.put(' ', false);
    Rstates.put(LEFT, false);
    Rstates.put(RIGHT, false);
    Rstates.put(UP, false);
    Rstates.put(DOWN, false);
    RCsta.put(ESC, false);
    RCsta.put('z', false);
    RCsta.put('Z', false);
    RCsta.put(' ', false);

    mouse.put(LEFT, false);
    Rmouse.put(LEFT, false);
    mouse.put(RIGHT, false);
    Rmouse.put(RIGHT, false);
  }

  public static boolean mget(int code) {
    return mouse.get(code);
  }
  public static boolean mRget(int code) {
    return Rmouse.get(code);
  }
  public static boolean get(int code) {
    return states.get(code);
  }
  public static boolean get(char code) {
    return Csta.get(code);
  }
  public static boolean Rget(int code) {
    return Rstates.get(code);
  }
  public static boolean Rget(char code) {
    return RCsta.get(code);
  }
  public static void mput(int code, boolean state) {
    mouse.put(code, state);
  }
  public static void put(int code, boolean state) {
    states.put(code, state);
  }
  public static void put(char code, boolean state) {
    Csta.put(code, state);
  }
  public static void Rput(int code, boolean state) {
    Rstates.put(code, state);
  }
  public static void Rput(char code, boolean state) {
    RCsta.put(code, state);
  }
  public static void mRput(int code, boolean state) {
    Rmouse.put(code, state);
  }
  public static void Rini() {
    for (HashMap.Entry m : Rstates.entrySet()) {
      Rstates.put((Integer)m.getKey(), false);
    }
    for (HashMap.Entry m : RCsta.entrySet()) {
      RCsta.put((Character)m.getKey(), false);
    }
  }
  public static void mRini() {
    for (HashMap.Entry m : Rmouse.entrySet()) {
      Rmouse.put((Integer)m.getKey(), false);
    }
  }
}
void keyPressed() {
  KeyState.put(keyCode, true);
  KeyState.put(key, true);
}

void keyReleased() {
  KeyState.put(keyCode, false);
  KeyState.put(key, false);
  KeyState.Rput(keyCode, true);
  KeyState.Rput(key, true);
}
void mousePressed() {
  KeyState.mput(mouseButton, true);
}

void mouseReleased() {
  KeyState.mRput(mouseButton, true);
  KeyState.mput(mouseButton, false);
}
