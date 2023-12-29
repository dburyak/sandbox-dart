import 'package:http/http.dart' as http;

void main() async {
  print("staring main ....");
  var x = 10;
  var y = 20;
  var z = x + y;
  print("z = $z");

  var url1 = 'https://www.gutenberg.org/cache/epub/1513/pg1513.txt'; // Romeo and Juliet
  var url2 = 'https://www.gutenberg.org/cache/epub/2701/pg2701.txt'; // Moby Dick
  var url3 = 'https://www.gutenberg.org/cache/epub/1064/pg1064.txt'; // Edgar Poe
  var url4 = 'https://www.gutenberg.org/cache/epub/67098/pg67098.txt'; // Vinnie the Pooh
  var url5 = 'https://www.gutenberg.org/cache/epub/100/pg100.txt'; // Shakespeare
  var url6 = 'https://www.gutenberg.org/cache/epub/5200/pg5200.txt'; // Kafka Metamorphosis
  var url7 = 'https://www.gutenberg.org/cache/epub/174/pg174.txt'; // Dorian Grey


  // same flow with Future<Response>
  var delay1 = Duration.zero;
  var httpResp1 = await makeHttpGetRequest(url1, delay1);
  print("received url1 response: ${httpResp1.statusCode}, delay=$delay1");
  var b1Len = httpResp1.body.length;
  var b2Delay = Duration(milliseconds: b1Len % 500);
  var req2Future = makeHttpGetRequest(url2, b2Delay);
  print("after req1");
  print("reading Romeo and Juliet ... \n${snippet(httpResp1.body)}");
  print("");

  var httpResp2 = await req2Future;
  print("received url2 response: ${httpResp2.statusCode}, delay=$b2Delay");
  var b2Len = httpResp2.body.length;
  var b3Delay = Duration(milliseconds: b2Len % 500);
  var req3Future = makeHttpGetRequest(url3, b3Delay);
  print("after req2");
  print("reading Moby Dick ... \n${snippet(httpResp2.body)}");
  print("");

  var httpResp3 = await req3Future;
  print("received url3 response: ${httpResp3.statusCode}, delay=$b3Delay");
  var b3Len = httpResp3.body.length;
  var b4Delay = Duration(milliseconds: b3Len % 500);
  var req4Future = makeHttpGetRequest(url4, b4Delay);
  print("after req3");
  print("reading Edgar Poe ... \n${snippet(httpResp3.body)}");
  print("");

  var httpResp4 = await req4Future;
  print("received url4 response: ${httpResp4.statusCode}, delay=$b4Delay");
  var b4Len = httpResp4.body.length;
  var b5Delay = Duration(milliseconds: b4Len % 500);
  var req5Future = makeHttpGetRequest(url5, b5Delay);
  print("after req4");
  print("reading Vinnie the Pooh ... \n${snippet(httpResp4.body)}");
  print("");

  var httpResp5 = await req5Future;
  print("received url5 response: ${httpResp5.statusCode}, delay=$b5Delay");
  var b5Len = httpResp5.body.length;
  var b6Delay = Duration(milliseconds: b5Len % 500);
  var req6Future = makeHttpGetRequest(url6, b6Delay);
  print("after req5");
  print("reading Shakespeare ... \n${snippet(httpResp5.body)}");
  print("");

  var httpResp6 = await req6Future;
  print("received url6 response: ${httpResp6.statusCode}, delay=$b6Delay");
  var b6Len = httpResp6.body.length;
  var b7Delay = Duration(milliseconds: b6Len % 500);
  var req7Future = makeHttpGetRequest(url7, b7Delay);
  print("after req6");
  print("reading Kafka ... \n${snippet(httpResp6.body)}");
  print("");

  var httpResp7 = await req7Future;
  print("received url7 response: ${httpResp7.statusCode}, delay=$b7Delay");
  var b7Len = httpResp7.body.length;
  print("total bytes: ${b1Len + b2Len + b3Len + b4Len + b5Len + b6Len + b7Len}");

  print("after req7");
  print("reading Dorian Grey ... \n${snippet(httpResp7.body)}");
  print("");



  var a = 10;
  var b = 20;
  var c = a + b;
  print("c = $c");
  print("ending main ....");
  print("");
}

// -------------------- somewhere in the library -------------------------------
// void makeHttpGetRequest(String url, Duration delay, Function(http.Response) resultHandler) {
//   http.get(Uri.parse(url)).then((response) {
//     resultHandler(response);
//   });
// }

Future<http.Response> makeHttpGetRequest(String url, Duration delay) {
  return http.get(Uri.parse(url));
}

String snippet(String book) {
  var lines = book.split(RegExp('\n'));
  return lines.skip(500).firstWhere((line) => line.isNotEmpty);
}
