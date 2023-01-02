import 'dart:html';

main() {
  createUi();
}

createUi() {
  final body = document.body!;
  body.children.add(buildHeader());
  final input = buildInput();
  body.children.add(input);
  final addBtn = buildAddBtn();
  body.children.add(addBtn);
  final itemsList = buildItemsList();
  body.children.add(itemsList);
  attachAddListeners(addBtn, input, itemsList);
}

buildHeader() {
  final h2 = new Element.tag('h2');
  h2.text = 'Pack List';
  return h2;
}

buildInput() {
  final input = new InputElement();
  input.id = 'item-input';
  input.placeholder = 'Item name';
  return input;
}

buildAddBtn() {
  final button = new ButtonElement();
  button.id = 'add-btn';
  button.text = 'Add';
  return button;
}

buildItemsList() {
  final itemsDiv = new DivElement();
  itemsDiv.id = 'items-div';
  itemsDiv.style.width = '300px';
  itemsDiv.style.border = '1px solid black';
  // itemsDiv.innerHtml = '&nbsp;';
  return itemsDiv;
}

attachAddListeners(ButtonElement addBtn, InputElement input, DivElement itemsList) {
  final adderFn = (_) {
    final itemStr = input.value?.trim() ?? '';
    if (itemStr.isEmpty) {
      return;
    }
    itemsList.children.add(buildItem(itemStr));
    input.value = '';
  };
  addBtn.onClick.listen(adderFn);
  input.onKeyPress.listen((e) {
    if (e.keyCode == KeyCode.ENTER) {
      adderFn(e);
    }
  });
}

buildItem(String itemStr) {
  final itemDiv = new DivElement();
  itemDiv.text = itemStr;
  itemDiv.className = 'item';
  return itemDiv;
}