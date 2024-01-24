import 'package:expanse_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expanse_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
// the constructor of this class- simple one
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {

final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Groceries',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'New shoes',
      amount: 100.00,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'New phone',
      amount: 500.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'New laptop',
      amount: 1000.75,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const Text('Chart widget...'),
          Expanded (child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
