import 'package:circles/core/common/error_text.dart';
import 'package:circles/core/common/loader.dart';
import 'package:circles/features/circles/controller/circle_controller.dart';
import 'package:circles/models/community_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../auth/controller/auth_controller.dart';

class CircleListDrawer extends ConsumerWidget {
  const CircleListDrawer({super.key});

  void navigateToCreateCircles(BuildContext context) {
    Routemaster.of(context).push('/create-circle');
  }

  void navigateToCircles(BuildContext context, Community community) {
    Routemaster.of(context).push('/c/${community.name}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('Create a community'),
              leading: const Icon(Icons.add),
              onTap: () => navigateToCreateCircles(context),
            ),
            ref.watch(userCommunityProvider).when(
                  data: (communities) => Expanded(
                    child: ListView.builder(
                      itemCount: communities.length,
                      itemBuilder: (BuildContext context, int index) {
                        final community = communities[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(community.avatar),
                          ),
                          title: Text('👪/${community.name}'),
                          onTap: () {
                            navigateToCircles(context, community);
                          },
                        );
                      },
                    ),
                  ),
                  error: (error, stackTrace) => ErrorText(
                    error: error.toString(),
                  ),
                  loading: () => const Loader(),
                ),
          ],
        ),
      ),
    );
  }
}
