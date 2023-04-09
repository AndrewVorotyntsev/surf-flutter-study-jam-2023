import 'package:flutter/material.dart';

/// Метод для открытия диалогового окна
void showPopUp<T>(BuildContext context, Widget dialogBody) {
  showModalBottomSheet<T>(
    context: context,
    // Параметр чтобы диалог занимал всю высоту
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.vertical(
        top: Radius.circular(10),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return dialogBody;
    },
  );
}
