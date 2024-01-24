import 'package:expanse_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expanse_tracker/widgets/new_expense.dart';
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
      title: 'Fly ticket',
      amount: 120.99,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'New laptop',
      amount: 1000.75,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

//the function used internally appbar, to open an "add sheet"
void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.5,
        title: const Text('Expenses'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart widget...'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
