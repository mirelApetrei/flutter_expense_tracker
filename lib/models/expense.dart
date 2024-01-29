import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';


final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Categories {
  food,
  travel,
  leisure,
  work
}

const categoryIcons = {
  Categories.food: Icons.fastfood,
  Categories.travel: Icons.flight,
  Categories.leisure: Icons.beach_access,
  Categories.work: Icons.work,
};


class Expense {
//constructor
  Expense({
    required this.title, 
    required this.amount, 
    required this.date,
    required this.category
    }) : id = uuid.v4(); // third library package, generates a unique id every time constructor is called

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categories category;

 String get formatedDate {
    return formatter.format(date);
 }
}
