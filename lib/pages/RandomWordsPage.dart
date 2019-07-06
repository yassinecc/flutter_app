import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordsPage extends StatefulWidget {
  @override
  RandomWordsPageState createState() => new RandomWordsPageState();
}

class RandomWordsPageState extends State<RandomWordsPage> {
  final _suggestions = <WordPair>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    return ListTile(title: Text(pair.asPascalCase, style: _biggerFont));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildSuggestions());
  }
}
