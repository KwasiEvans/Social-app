import 'package:circles/core/constants/constant.dart';
import 'package:circles/features/auth/controller/auth_controller.dart';
import 'package:circles/features/home/delegates/search_circles_deligate.dart';
import 'package:circles/features/home/drawers/circles_list_drawer.dart';
import 'package:circles/features/home/drawers/profile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _page = 0;

  void dispalyDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void dispalyEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  void onPageChanged(int page) {
    _page = page;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => dispalyDrawer(context),
          );
        }),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: SearchCommunityDelegate(ref));
            },
            icon: const Icon(Icons.search),
          ),
          Builder(builder: (context) {
            return IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(user.profilePic),
              ),
              onPressed: () => dispalyEndDrawer(context),
            );
          })
        ],
      ),
      body: Constants.tabWidgets[_page],
      drawer: const CircleListDrawer(),
      endDrawer: const ProfileDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.home, size: 30, color: Colors.blue),
          Icon(Icons.edit, size: 30, color: Colors.blue),
        ],
        // index: 1,
        onTap: onPageChanged,
        height: 70,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
    );
  }
}
