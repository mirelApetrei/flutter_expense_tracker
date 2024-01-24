import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';


final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leisure: Icons.beach_access,
  Category.work: Icons.work,
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
  final Category category;

 String get formatedDate {
    return formatter.format(date);
 }
}
