import 'package:flutter/material.dart';

class MySwipeToDismiss extends StatefulWidget {
  const MySwipeToDismiss({Key? key}) : super(key: key);

  @override
  State<MySwipeToDismiss> createState() => _MySwipeToDismissState();
}

class _MySwipeToDismissState extends State<MySwipeToDismiss> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe to Dismiss'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            background: Container(color: Colors.red,),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            key: Key(item),
            child: ListTile(
              title: Text('${items[index]}'),
            ),
          );
        },
      ),
    );
  }
}
