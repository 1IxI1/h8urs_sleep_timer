import 'package:h8urs_sleep_timer/lib/ampm.dart';
import 'package:h8urs_sleep_timer/lib/common/action_buttons.dart';
import 'package:h8urs_sleep_timer/lib/common/display_value.dart';
import 'package:h8urs_sleep_timer/lib/common/wrapper_container.dart';
import 'package:h8urs_sleep_timer/lib/common/wrapper_dialog.dart';
import 'package:h8urs_sleep_timer/lib/daynight_banner.dart';
import 'package:h8urs_sleep_timer/lib/common/filter_wrapper.dart';
import 'package:h8urs_sleep_timer/lib/state/state_container.dart';
import 'package:h8urs_sleep_timer/lib/utils.dart';
import 'package:flutter/material.dart';

/// Private class. [StatefulWidget] that renders the content of the picker.
// ignore: must_be_immutable
class DayNightTimePickerAndroid extends StatefulWidget {
  @override
  DayNightTimePickerAndroidState createState() =>
      DayNightTimePickerAndroidState();
}

/// Picker state class
class DayNightTimePickerAndroidState extends State<DayNightTimePickerAndroid> {
  @override
  Widget build(BuildContext context) {
    final timeState = TimeModelBinding.of(context);

    double min = getMinMinute(
        timeState.widget.minMinute, timeState.widget.minuteInterval);
    double max = getMaxMinute(
        timeState.widget.maxMinute, timeState.widget.minuteInterval);

    int minDiff = (max - min).round();
    int divisions =
        getMinuteDivisions(minDiff, timeState.widget.minuteInterval);

    if (timeState.hourIsSelected) {
      min = timeState.widget.minHour!;
      max = timeState.widget.maxHour!;
      divisions = (max - min).round();
    }

    final color =
        timeState.widget.accentColor ?? Theme.of(context).primaryColor;

    final hourValue = timeState.widget.is24HrFormat
        ? timeState.time.hour
        : timeState.time.hourOfPeriod;

    final ltrMode =
        timeState.widget.ltrMode ? TextDirection.ltr : TextDirection.rtl;

    Orientation currentOrientation = MediaQuery.of(context).orientation;

    return Center(
      child: Container(
        width: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DayNightBanner(),
            WrapperContainer(
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AmPm(),
                  SizedBox(height: 20),
                  Row(
                      textDirection: ltrMode,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DisplayValue(
                          onTap: timeState.widget.disableHour!
                              ? null
                              : () {
                                  timeState.onHourIsSelectedChange(true);
                                },
                          value: hourValue.toString().padLeft(2, '0'),
                          isSelected: timeState.hourIsSelected,
                        ),
                        Text(
                          ':',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        DisplayValue(
                          onTap: timeState.widget.disableMinute!
                              ? null
                              : () {
                                  timeState.onHourIsSelectedChange(false);
                                },
                          value:
                              timeState.time.minute.toString().padLeft(2, '0'),
                          isSelected: !timeState.hourIsSelected,
                        ),
                      ],
                    ),
                  SizedBox(height: 10),

                  Slider(

                    value: timeState.hourIsSelected
                        ? timeState.time.hour.roundToDouble()
                        : timeState.time.minute.roundToDouble(),
                    onChanged: timeState.onTimeChange,
                    min: min,
                    max: max,
                    divisions: divisions,
                    activeColor: color,
                    inactiveColor: color.withAlpha(55),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
