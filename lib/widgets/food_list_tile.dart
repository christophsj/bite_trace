import 'package:bite_trace/models/Nutrients.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:flutter/material.dart';

class FoodListTile extends StatelessWidget {
  const FoodListTile({
    super.key,
    required this.color,
    required this.n,
    required this.onTap,
    required this.name,
    required this.onTapTrailing,
    required this.trailingIcon,
    this.subtitle,
  });

  final String name;
  final Color color;
  final Nutrients n;
  final void Function() onTap;
  final void Function() onTapTrailing;
  final Widget trailingIcon;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ListTile(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        onTap: onTap,
        leading: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.local_fire_department_sharp,
              color: color,
              size: 30,
            ),
            Text(
              '${n.calories.toInt()}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: color,
              ),
            ),
          ],
        ),
        titleAlignment: ListTileTitleAlignment.center,
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        isThreeLine: subtitle != null,
        subtitle: RichText(
          text: TextSpan(
            children: [
              if (subtitle != null)
                TextSpan(
                  text: '$subtitle\n',
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              TextSpan(
                text:
                    '${n.carbohydrates.toInt()}C ${n.fat.toInt()}F ${n.protein.toInt()}P',
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
        ),
        trailing: AnimatedElevatedButton(
          onPressed: onTapTrailing,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: const Size(34, 34),
            padding: EdgeInsets.zero,
          ),
          icon: IconTheme(
            data: IconTheme.of(context).copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: trailingIcon,
          ),
        ),
      ),
    );
  }
}
