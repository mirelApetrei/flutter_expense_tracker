import 'package:expanse_tracker/models/expense.dart';
import 'package:expanse_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

//we use the statelessswidget, because we are only rendering those list, not alterate them
class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.65),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) { 
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
            expenses[index]), //here we are using the ExpenseItem widget
      ),
    );
  }
}
