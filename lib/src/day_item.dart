// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  DayItem({
    Key? key,
    required this.dayNumber,
    required this.shortName,
    required this.onTap,
    this.isSelected = false,
    this.dayColor,
    this.activeDayColor,
    this.activeDayBackgroundColor,
    this.available = true,
    this.dotsColor,
    this.dayNameColor,
    this.shrink = false,
  }) : super(key: key);
  final int dayNumber;
  final String shortName;
  final bool isSelected;
  final Function onTap;
  final Color? dayColor;
  final Color? activeDayColor;
  final Color? activeDayBackgroundColor;
  final bool available;
  final Color? dotsColor;
  final Color? dayNameColor;
  final bool shrink;
  Size? size;

  GestureDetector _buildDay(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    var selectFont = 14.0;
    var dayNameFont = selectFont - 2;

    if (size!.height <= 300) {
      selectFont = 12.0;
      dayNameFont = selectFont - 2;
    } else if (size!.height < 450) {
      selectFont = 16.0;
      dayNameFont = selectFont - 2;
    } else {
      selectFont = 18.0;
      dayNameFont = selectFont - 2;
    }
    final textStyle = Theme.of(context).textTheme.headlineSmall;
    final selectedStyle = Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: activeDayColor ?? Colors.white,
          // fontSize: selectFont,
          fontWeight: FontWeight.bold,
          // height: 0.8,
        );

    return GestureDetector(
      onTap: available ? onTap as void Function()? : null,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: isSelected
            ? BoxDecoration(
                color: activeDayBackgroundColor ??
                    Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(100),
              )
            : const BoxDecoration(color: Colors.transparent),
        child: Column(
          children: [
            Text(
              shortName.substring(0, 1),
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : isLight
                        ? Colors.black
                        : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: dayNameFont,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                dayNumber.toString(),
                style: isSelected ? selectedStyle : textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return _buildDay(context);
  }
}
