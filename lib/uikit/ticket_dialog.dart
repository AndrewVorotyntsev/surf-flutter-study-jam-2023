import 'package:flutter/material.dart';

import 'button.dart';

/// Виджет диалога для добавления билета
class NewTicketDialog extends StatelessWidget {
  final TextEditingController urlController;
  final TextEditingController nameController;
  final VoidCallback onAddTapped;

  const NewTicketDialog({
    super.key,
    required this.urlController,
    required this.nameController,
    required this.onAddTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            height: 3,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  90,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Добавить билет',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.newspaper),
                hintText: 'Введите название билета',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: urlController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.link),
                hintText: 'Введите ссылку на билет',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: UIButton(
              name: 'Добавить',
              onTap: onAddTapped,
            ),
          )
        ],
      ),
    );
  }
}
