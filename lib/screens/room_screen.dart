import 'dart:math';

import 'package:clubhouse_ui/data.dart';
import 'package:clubhouse_ui/models/room.dart';
import 'package:clubhouse_ui/widgets/room_user_profile.dart';
import 'package:clubhouse_ui/widgets/user-profile-image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 150,
        leading: TextButton.icon(
          style: TextButton.styleFrom(primary: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            CupertinoIcons.chevron_down,
            size: 20,
          ),
          label: const Text(
            "Hallway",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.doc,
                color: Colors.black,
                size: 30,
              )),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: UserProfileimage(
                imageUrl: currentUser.imageURL,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "${room.club} 🏠".toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                      ),
                      const Icon(
                        CupertinoIcons.ellipsis,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(18.0),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 14,
                children: room.speakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Followed by Speakers",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 15,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(18.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 14,
                children: room.followedBySpeakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 59,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Others in the room",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 15,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(18.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 14,
                children: room.others
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 59,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 60)),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () =>Navigator.of(context).pop(),
              child: const Text("✌ Leave quietly",
              style:  TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(12),
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20),
                )
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(CupertinoIcons.add,size: 30,),
                  ),
                ),
                const SizedBox(width: 8,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(CupertinoIcons.hand_raised,size: 30,),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
