// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class MainEvent {}

class LoadApi extends MainEvent {
  final BuildContext context;
   LoadApi({
    required this.context,
  });
 }