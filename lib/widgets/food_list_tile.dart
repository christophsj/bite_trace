import 'package:bite_trace/models/Nutrients.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:flutter/material.dart';

class FoodListTile extends StatelessWidget {
  const FoodListTile({
    super.key,
    required this.n,
    required this.onTap,
    required this.name,
    required this.onTapTrailing,
    required this.trailingIcon,
    this.subtitle,
    this.threeLine = false,
    this.brandName,
  });

  final String name;
  final Nutrients n;
  final void Function() onTap;
  final void Function() onTapTrailing;
  final Widget trailingIcon;
  final String? subtitle;
  final bool threeLine;
  final String? brandName;

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ListTile(
        dense: true,
        isThreeLine: threeLine,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
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
        title: Text(
          name,
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        subtitle: subtitle != null
            ? _withBrandName(
                context,
                Text(
                  '$subtitle',
                  maxLines: 1,
                  style: subtitleStyle(context),
                ),
              )
            : _withBrandName(
                context,
                Text(
                  '${n.carbohydrates.toInt()}C ${n.fat.toInt()}F ${n.protein.toInt()}P',
                  maxLines: 1,
                  style: subtitleStyle(context),
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
          showCheckmark: false,
          icon: IconTheme(
            data: IconTheme.of(context).copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            child: trailingIcon,
          ),
        ),
      ),
    );
  }

  Widget _withBrandName(BuildContext context, Widget text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (brandName != null)
          Flexible(
            flex: 2,
            child: Text(
              '$brandName - ',
              maxLines: 1,
              style: subtitleStyle(context),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        Flexible(
          child: text,
        ),
      ],
    );
  }

  TextStyle subtitleStyle(BuildContext context) {
    return TextStyle(
      fontSize: 13,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }
}
