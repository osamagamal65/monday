import 'package:flutter/material.dart';
import 'package:monday/widgets/board_query_widget.dart';

class DynamicBoard extends StatefulWidget {
  _DynamicBoardState createState() => _DynamicBoardState();
}

class _DynamicBoardState extends State<DynamicBoard> {
  TextEditingController _controller = TextEditingController(text: '');
  bool getBoard = false;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        if (_controller.value.text.length >= 9) {
          this.getBoard = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return getBoard
        ? BoardQueryWidget(
            boardId: _controller.value.text,
          )
        : SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Positioned(
                      top: -10.0,
                      left: -60.0,
                      child: Container(
                        width: 350.0,
                        height: 350.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              // Where the linear gradient begins and ends
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              // Add one stop for each color. Stops should increase from 0 to 1
                              stops: [0.3, 0.9],
                              colors: [
                                Color(0xff07a3b2),
                                Color(0xffd9ecc7),
                              ],
                            )),
                      ),
                    ),
                    Positioned(
                      right: -30.0,
                      bottom: 10.0,
                      child: Container(
                        width: 180.0,
                        height: 180.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              // Where the linear gradient begins and ends
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              // Add one stop for each color. Stops should increase from 0 to 1
                              stops: [0.3, 0.9],
                              colors: [
                                Color(0xff07a3b2),
                                Color(0xffd9ecc7),
                              ],
                            )),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            width: MediaQuery.of(context).size.width - 60.0,
                            child: Center(
                              child: TextField(
                                controller: _controller,
                                textAlign: TextAlign.start,
                                maxLength: 9,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Board ID',
                                    hintText: 'Hint use: 354761654'),
                              ),
                            ),
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(10.0)),
                                border: Border.all(
                                    width: 1.0,
                                    color: Theme.of(context).primaryColor)),
                            padding:
                                new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width - 60.0,
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            child: FlatButton(
                              color: Theme.of(context).primaryColor,
                              disabledColor: Colors.grey[300],
                              onPressed: _controller.value.text.length >= 9
                                  ? () {
                                      setState(() {
                                        this.getBoard = true;
                                      });
                                    }
                                  : null,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 30.0),
                              child: Text(
                                'Get board',
                                style: Theme.of(context).textTheme.title,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                              ),
                            ),
                            padding:
                                new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
