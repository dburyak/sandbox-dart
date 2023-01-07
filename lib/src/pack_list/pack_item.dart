import 'dart:html';

class PackItem {
  final String name;
  bool _isChecked = false;
  final DivElement _div = DivElement();

  PackItem(this.name) {
    _div.text = name;
    _div.className = 'item';
    _div.onClick.listen((_) => toggle());
    _div.onMouseEnter.listen((_) => _div.classes.add('highlight'));
    _div.onMouseLeave.listen((_) => _div.classes.remove('highlight'));
  }

  DivElement get ui => _div;

  bool get isChecked => _isChecked;

  set isChecked(bool isChecked) {
    _isChecked = isChecked;
    if (isChecked) {
      _div.classes.add('checked');
    } else {
      _div.classes.remove('checked');
    }
  }

  void toggle() {
    isChecked = !isChecked;
  }
}
