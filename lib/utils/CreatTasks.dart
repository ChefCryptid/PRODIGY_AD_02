import 'package:flutter/material.dart';

class CreatTasks extends StatelessWidget {
  TextEditingController? controller;
  Function()? OnAdd;
  Function()? OnCancel;

  CreatTasks({
    super.key,
    required this.OnAdd,
    required this.OnCancel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      content: SizedBox(
        height: 150.0,
        width: 300.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Enter Task Name',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,
                  ),
                  focusColor: Theme.of(context).colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary, // Color when the TextField is focused
                      width: 2.0, // Border width when focused
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: OnAdd,
                  child: Text(
                    'A D D',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                SizedBox(
                  width: 25.0,
                ),
                ElevatedButton(
                  onPressed: OnCancel,
                  child: Text(
                    'C A N C E L',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
