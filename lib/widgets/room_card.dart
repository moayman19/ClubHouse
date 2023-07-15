import 'package:clubhouse_ui/models/room.dart';
import 'package:clubhouse_ui/screens/room_screen.dart';
import 'package:clubhouse_ui/widgets/user-profile-image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => RoomScreen(room: room),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 15),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${room.club} 🏠".toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
              ),
              Text(
                room.name,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Stack(
                        children: [
                          UserProfileimage(
                              imageUrl: room.speakers[0].imageURL, size: 50),
                          Positioned(
                              left: 28,
                              top: 24,
                              child: UserProfileimage(
                                  imageUrl: room.speakers[1].imageURL,
                                  size: 50)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...room.speakers.map(
                          (e) => Text(
                            "${e.firstName}" "${e.lastName} ",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 16,
                                    ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text:
                                  "${room.speakers.length + room.followedBySpeakers.length + room.others.length} ",
                            ),
                            const WidgetSpan(
                              child: Icon(
                                CupertinoIcons.person_fill,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ),
                            TextSpan(
                              text: "/  ${room.speakers.length} ",
                            ),
                            const WidgetSpan(
                              child: Icon(
                                CupertinoIcons.chat_bubble,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ),
                          ]),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
