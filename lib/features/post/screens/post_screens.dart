import 'package:circles/core/constants/constant.dart';
import 'package:circles/core/dummy_data/user_data.dart';
import 'package:circles/core/widgets/post_card.dart';
import 'package:circles/core/widgets/user_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicons/unicons.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          spaceWidget(isFullSpace: true, isVerticalSpace: true),
          Container(
            height: .168,
            color: Colors.black,
          ),

          spaceWidget(isFullSpace: true, isVerticalSpace: true),
          Container(
            height: .2,
            color: Colors.black,
          ),
          spaceWidget(isFullSpace: true, isVerticalSpace: true),

          /// get all posts
          ...?userData.posts?.map((post) => PostCard(
                authorName: "${post.authorName}.  ",
                authorAvatar: post.authorAvatar,
                postPhoto: post.postPhoto,
              ))
        ],
      ),
    );
  }
}
