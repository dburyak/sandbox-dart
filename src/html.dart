import 'dart:html';

main() {
  var button = new Element.tag('button');
  button.text = 'Click me!';
  print("button = ${button}");
  var numClicks = 0;
  var status = querySelector("#status")!;
  status.text = "Click the button!";
  var history = querySelector("#history")!;
  button.onClick.listen((e) {
    var buttons = querySelectorAll('button');
    print('button click');
    var test = 123 + 245;
    print('test = ${test}');
    window.alert('You clicked button ${++numClicks} times!');
    status.text = "Num clicks: ${numClicks}";
    final now = DateTime.now();
    final newHistoryEntry = new Element.html('<div>[${now}] - ${numClicks}</div>');
    history.children.add(newHistoryEntry);
  });
  print("body is null: ${document.body == null}");
  document.body!.children.add(button);
  print("button added");
}
