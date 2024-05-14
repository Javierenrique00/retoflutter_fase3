import 'package:example/ui/modules/home_screen/home_screen.dart';
import 'package:example/ui/navigation/navigation.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
        return {
          Navigation.homeScreen : (context) =>  const HomeScreen(),
        };
      }