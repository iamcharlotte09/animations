import 'package:animation/const/colors.dart';
import 'package:flutter/material.dart';

class MyAnimatedList extends StatefulWidget {
  @override
  _MyAnimatedListState createState() => _MyAnimatedListState();
}

class _MyAnimatedListState extends State<MyAnimatedList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = ['아이템 1', '아이템 2', '아이템 3'];
  int _nextItemIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated List'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: PINK),
            onPressed: _addItem,
            child: const Text(
              '아이템 추가',
              style: TextStyle(
                color: BLUE,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _items.length,
              itemBuilder: (context, index, animation) {
                return _buildItem(_items[index], animation);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Text(item),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              int index = _items.indexOf(item);
              _removeItem(index);
            },
          ),
        ),
      ),
    );
  }

  void _removeItem(int index) {
    final removedItem = _items.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildItem(removedItem, animation),
      duration: Duration(milliseconds: 500),
    );
  }

  void _addItem() {
    final newItem = '아이템 $_nextItemIndex';
    _items.insert(0, newItem); // Add item to the top of the list
    _nextItemIndex++;
    _listKey.currentState?.insertItem(0, duration: Duration(milliseconds: 500));
  }
}
