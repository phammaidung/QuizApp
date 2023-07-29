import 'dart:convert';
import 'dart:io';

void main() {
  var contents = File('D:/Personal Project/Flutter/quiz_app/lib/keywords.txt')
      .readAsStringSync();
  var lineLen = contents.split("\n").length;
  List<String> line = [];
  List<Map<String, Object>> keywords = [];
  var result = File('D:/Personal Project/Flutter/quiz_app/lib/keywords.json');

  for (var i = 0; i < lineLen; i++) {
    line.add(contents.split("\n")[i]);
    keywords.add({
      'keyword': line[i].split("/+/")[0],
      'channel': line[i].split("/+/")[1],
      'time': line[i].split("/+/")[2]
    });
    result.writeAsString(jsonEncode(keywords));
  }
}
