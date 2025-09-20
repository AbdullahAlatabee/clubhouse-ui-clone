import 'package:clubhouse_ui_design/models/room.dart';
import 'package:clubhouse_ui_design/screens/room_screen.dart';
import 'package:clubhouse_ui_design/widgets/userprophileimage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(fullscreenDialog: true, builder: (context) => RoomScreen(room: room)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club}💒'.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 28.0,
                              top: 24.0,
                              child: Userprophileimage(
                                imageURL: room.speakers[0].imageURL,
                                size: 40.0,
                              ),
                            ),
                            Userprophileimage(
                              imageURL: room.speakers[1].imageURL,
                              size: 40.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map(
                              (e) => Text(
                                '${e.firstName} ${e.lastName} 💬',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.copyWith(fontSize: 13.0),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${room.speakers.length + room.followedBySpeakers.length + room.others.length}',
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.person_fill,
                                      size: 10.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextSpan(text: ' / ${room.speakers.length}'),
                                  WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.chat_bubble_fill,
                                      size: 10.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
