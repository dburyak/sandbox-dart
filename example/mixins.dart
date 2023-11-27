void main() {
  var performer = Musician();
  performer.canPlayPiano = true;
  performer.perform();
  print("is musical? ${performer is Musical}");
  print("is entertainer? ${performer is Entertainer}");
}

// -------------------- simple ------------------------
abstract interface class Entertainer {
  void entertainMe();
}

mixin Musical implements Entertainer {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  @override
  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

mixin Acting implements Entertainer {
  bool canAct = false;

  @override
  void entertainMe() {
    if (canAct) {
      print('Acting');
    } else {
      print('Humming to self');
    }
  }
}

abstract interface class Dressed {
  String get clothing;
}

mixin Formal implements Dressed {
  @override
  String get clothing => 'tuxedo';
}

mixin Casual implements Dressed {
  @override
  String get clothing => 't-shirt and shorts';
}

class Musician with Musical implements Entertainer {
  void perform() {
    entertainMe();
  }
}

class Actor with Acting implements Entertainer {
  void perform() {
    entertainMe();
  }
}

class FormalDressedPerson with Formal {
  void showClothing() {
    print('I am wearing $clothing');
  }
}

class CasualDressedPerson with Casual {
  void showClothing() {
    print('I am wearing $clothing');
  }
}

class FormalDressedMusician with Formal, Musical {
  void perform() {
    print('I am wearing $clothing');
    entertainMe();
  }
}

class CasualDressedMusician with Casual, Musical {
  void perform() {
    print('I am wearing $clothing');
    entertainMe();
  }
}

class FormalDressedActor with Formal, Acting {
  void perform() {
    print('I am wearing $clothing');
    entertainMe();
  }
}

class CasualDressedActor with Casual, Acting {
  void perform() {
    print('I am wearing $clothing');
    entertainMe();
  }
}

// --------------------- abstract -----------------------
abstract interface class Drawable {
  void draw();
}

mixin DrawableOnCanvas implements Drawable {
  String get canvasType;

  @override
  void draw() {
    print('preparing canvas of type $canvasType and paints');
    print('Drawing on $canvasType canvas');
  }
}

mixin DrawableOnTablet implements Drawable {
  String get usbPort;

  @override
  void draw() {
    print('connecting to $usbPort port');
    print('Drawing on tablet');
  }
}

class CanvasPainter with DrawableOnCanvas implements Drawable {
  @override
  String get canvasType => 'oil';

  void paint() {
    draw();
  }
}

class TabletPainter with DrawableOnTablet implements Drawable {
  @override
  String get usbPort => 'USB-C';

  void paint() {
    draw();
  }
}

// ---------------------  -----------------------
abstract interface class Speaking {
  void speak();
}

abstract interface class NativeSpeaker {
  String get language;
}

mixin CivilizedHuman on NativeSpeaker implements Speaking {
  @override
  void speak() {
    print('Speaking in $language');
  }
}

mixin British implements NativeSpeaker {
  @override
  String get language => 'English';
}

class BritishPerson with British, CivilizedHuman {
}

// ----------------------------------------------
mixin Moving {
  String get movementType;

  void move() {
    print('Moving with $movementType');
  }
}
