import 'package:flutter/material.dart';

class MainMenuModel {
  int index;
  String name;
  bool notification;
  IconData icon;
  Widget page;

  MainMenuModel({
    this.index,
    this.name,
    this.notification = false,
    this.icon,
    this.page,
  });

  MainMenuModel copyWith({
    int index,
    String name,
    bool notification,
    IconData icon,
    Widget page,
  }) =>
      MainMenuModel(
        index: index ?? this.index,
        name: name ?? this.name,
        notification: notification ?? this.notification,
        icon: icon ?? this.icon,
        page: page ?? this.page,
      );
}
