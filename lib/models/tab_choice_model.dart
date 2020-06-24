import 'package:flutter/material.dart';

const int TabLibrary = 0;
const int TabProfile = 1;

class TabChoiceModel {
  const TabChoiceModel({this.title, this.icon, this.id});
  final int id;
  final String title;
  final IconData icon;
}