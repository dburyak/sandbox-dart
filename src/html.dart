import 'dart:html';

main() {
  var button = new Element.tag('button');
  button.text = 'Click me!';
  print("button = ${button}");
  button.onClick.listen((e) {
    var buttons = querySelectorAll('button');
    print('button click');
    var test = 123 + 245;
    print('test = ${test}');
    window.alert('You clicked ${buttons.length} buttons!');
  });
  print("body is null: ${document.body == null}");
  document.body!.children.add(button);
  print("button added");
}
