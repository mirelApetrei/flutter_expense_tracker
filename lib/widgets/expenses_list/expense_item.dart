import 'package:expanse_tracker/models/expense.dart';
import 'package:flutter/material.dart';


//ExpenseItem class
class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        child: Column(
          children: [
            Text(
              expense.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                 Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                   const SizedBox(width: 8),
                    Text(expense.formatedDate),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }



}
