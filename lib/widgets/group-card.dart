import 'package:flutter/material.dart';
import 'package:monday/models/group.dart';
import 'package:monday/models/item.dart';

class GruopCard extends StatelessWidget {
  final Group group;
  final List<Item> items;
  final Color color;
  GruopCard(
      {@required this.group, @required this.items, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 350.0,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            spreadRadius: 1.0,
            blurRadius: 10.0)
      ], color: color, borderRadius: BorderRadius.circular(30.0)),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Text(
                      group.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Color(0xff07a3b2)),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: items
                  .map((item) => ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.state.toString()),
                        leading: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: hexToColor(group.color)),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
