import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //this aproach is used to keep the data in the textfield in Flutter, instead of input test field and a var and function
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();

// this method is used to clear the input TextField of _titleController, provided by Flutter
  @override
  void dispose() {
    _titleControler.dispose();
    _amountControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          controller: _titleControler,
          maxLength: 50,
          decoration: const InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: _amountControler,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            prefixText: '\$ ',
            labelText: 'Amount',
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                print(_titleControler.text);
                print(_amountControler.text);
              },
              child: const Text('Save Expense'),
            )
          ],
        ),
      ]),
    );
  }
}
