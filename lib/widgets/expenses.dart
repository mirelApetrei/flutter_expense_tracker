import 'package:expanse_tracker/widgets/chart/chart.dart';
import 'package:expanse_tracker/widgets/chart/chart_bar.dart';
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
      category: Categories.food,
    ),
    Expense(
      title: 'New shoes',
      amount: 100.00,
      date: DateTime.now(),
      category: Categories.leisure,
    ),
    Expense(
      title: 'Fly ticket',
      amount: 120.99,
      date: DateTime.now(),
      category: Categories.travel,
    ),
    Expense(
      title: 'New laptop',
      amount: 1000.75,
      date: DateTime.now(),
      category: Categories.work,
    ),
  ];

//the function used internally appbar, to open an "add sheet"
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addOnExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text('Expense deleted!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found.Start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
          Chart(expenses: _registeredExpenses,),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
