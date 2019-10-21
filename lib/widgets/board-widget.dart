import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:monday/models/board.dart';
import 'package:monday/widgets/group-card.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  BoardWidget({@required this.board});
  @override
  Widget build(BuildContext context) {
    return Column(
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 200.0,
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.symmetric(vertical: 40.0),
                    width: MediaQuery.of(context).size.width - 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 250.0,
                          constraints: BoxConstraints(maxHeight: 200.0),
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            board.name,
                            style: Theme.of(context).textTheme.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 30.0,
                              height: 30.0,
                              margin: EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          board.owner.photoOriginal)),
                                  borderRadius: BorderRadius.circular(50.0)),
                            ),
                            Text(
                              board.owner.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(fontSize: 12.0),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  // Container(
                  //   height: 100.0,
                  //   width: 100.0,
                  // ),
                  Container(
                    height: 400.0,
                    width: MediaQuery.of(context).size.width,
                    child: Swiper(
                      itemCount: board.groups.length,
                      scale: 0.8,
                      itemWidth: 200.0,
                      itemHeight: 300.0,
                      loop: false,
                      viewportFraction: .8,
                      itemBuilder: (BuildContext context, int index) {
                        return GruopCard(
                          items: board.items,
                          group: board.groups[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
