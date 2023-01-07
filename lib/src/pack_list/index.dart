import 'dart:html';
import 'pack_item.dart';

buildUi() {
  final body = document.body!;
  body.children.add(_buildHeader());
  final input = _buildInput();
  body.children.add(input);
  final addBtn = _buildAddBtn();
  body.children.add(addBtn);
  final itemsList = _buildItemsList();
  body.children.add(itemsList);
  _attachAddListeners(addBtn, input, itemsList);
}

_buildHeader() {
  final h2 = Element.tag('h2');
  h2.text = 'Pack List';
  return h2;
}

_buildInput() {
  final input = InputElement();
  input.id = 'item-input';
  input.placeholder = 'Item name';
  return input;
}

_buildAddBtn() {
  final button = ButtonElement();
  button.id = 'add-btn';
  button.text = 'Add';
  return button;
}

_buildItemsList() {
  final itemsDiv = DivElement();
  itemsDiv.id = 'items-div';
  itemsDiv.style.width = '300px';
  itemsDiv.style.border = '1px solid black';
  return itemsDiv;
}

void _attachAddListeners(
    ButtonElement addBtn, InputElement input, DivElement itemsList) {
  addFn(_) {
    final itemStr = input.value?.trim() ?? '';
    if (itemStr.isEmpty) {
      return;
    }
    itemsList.children.add(buildItem(itemStr));
    input.value = '';
  }

  addBtn.onClick.listen(addFn);
  input.onKeyPress.listen((e) {
    if (e.keyCode == KeyCode.ENTER) {
      addFn(e);
    }
  });
}

buildItem(String itemStr) {
  final item = PackItem(itemStr);
  return item.ui;
}
