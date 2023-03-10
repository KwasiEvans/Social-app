// Logged In route

// Logged Out route

import 'package:circles/features/auth/screens/login_screen.dart';
import 'package:circles/features/circles/screens/add_mods_screen.dart';
import 'package:circles/features/circles/screens/circles_screen.dart';
import 'package:circles/features/circles/screens/create_circles_screen.dart';
import 'package:circles/features/circles/screens/edit_circles.dart';
import 'package:circles/features/circles/screens/mod_tools_screen.dart';
import 'package:circles/features/home/screens/home_screen.dart';
import 'package:circles/features/user_profile/screen/edit_profile_screen.dart';
import 'package:circles/features/user_profile/screen/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/create-circle': (_) => const MaterialPage(child: CreateCirclesScreen()),
  '/c/:name': (route) => MaterialPage(
        child: CirclesScreen(
          name: route.pathParameters['name']!,
        ),
      ),
  '/mod-tools/:name': (routeData) => MaterialPage(
        child: ModToolsScreen(
          name: routeData.pathParameters['name']!,
        ),
      ),
  '/edit-circle/:name': (routeData) => MaterialPage(
        child: EditCirclesScreen(
          name: routeData.pathParameters['name']!,
        ),
      ),
  '/add-mods/:name': (routeData) => MaterialPage(
        child: AddModsScreen(
          name: routeData.pathParameters['name']!,
        ),
      ),
  '/u/:uid': (routeData) => MaterialPage(
        child: UserProfileScreen(
          uid: routeData.pathParameters['uid']!,
        ),
      ),
     '/edit-profile/:uid': (routeData) => MaterialPage(
          child: EditProfileScreen(
            uid: routeData.pathParameters['uid']!,
          ),
        ),
});
