import 'package:flutter/material.dart';

/// Кнопка
/// Имеет имя, колбэк и параметр активностиы
class UIButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final bool isActive;

  const UIButton({
    super.key,
    required this.name,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: isActive ? Colors.lightBlueAccent : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      clipBehavior: Clip.hardEdge,
      child: Material(
        type: MaterialType.transparency,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: isActive ? onTap : null,
          // внутренний контент
          child: Center(
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
