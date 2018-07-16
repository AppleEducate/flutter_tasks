import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:native_widgets/native_widgets.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class CustomItem {
  final String title;
  final String subtitle;
  final String id;
  CustomItem({this.title, this.subtitle, this.id});
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  List<CustomItem> _items = [];

  Widget _buildItem(BuildContext context, int index) {
    return ListTile(
      title: Text(_items[index].title),
      subtitle: Text(_items[index].subtitle),
      leading: IconButton(
        icon: Icon(Icons.radio_button_unchecked),
        onPressed: () {
          _removeItem(index);
        },
      ),
    );
  }

  void _addItem(String id, String title, String subtitle) {
    setState(() {
      _items.add(
        CustomItem(id: id, title: title, subtitle: subtitle),
      );
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Tasky'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView.builder(
          itemBuilder: _buildItem,
          itemCount: _items.length == null ? 0 : _items.length,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Add a new task'),
        onPressed: () {
          _addItem('${_items.length}', 'Test', 'Sub Title');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          hasNotch: false,
          child: SafeArea(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }
}
