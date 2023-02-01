import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({
    Key? key,
    required this.title,
    this.emoji,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  final bool selected;
  final String title;
  final String? emoji;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: CalculateSize.getHeight(6),
        ),
        padding: EdgeInsets.symmetric(
          vertical: CalculateSize.getHeight(12),
          horizontal: CalculateSize.getHeight(12),
        ),
        decoration: BoxDecoration(
          color: (selected == false) ? Colors.white : ColorFamily.tealSecondary,
          border: Border.all(
            width: 1,
            color: (selected == false)
                ? ColorFamily.greyPrimary
                : ColorFamily.tealPrimary,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            (selected == false)
                ? const Icon(
                    Icons.radio_button_off,
                    color: ColorFamily.greyPrimary,
                  )
                : const Icon(
                    Icons.radio_button_checked,
                    color: ColorFamily.tealPrimary,
                  ),
            SizedBox(
              width: CalculateSize.getWidth(8),
            ),
            Text(title),
            const Spacer(),
            emoji != null ? Text(emoji!) : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
