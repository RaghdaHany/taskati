import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/home/widgets/home_header.dart';
import 'package:taskati/features/home/widgets/task_list_builder.dart';
import 'package:taskati/features/home/widgets/today_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
String selectedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              HomeHeader(),
              Gap(15),
              TodayHeader(),
              Gap(15),
              DatePicker(
                height: 100,
                width: 70,
                DateTime.now(),
                dayTextStyle: TextStyles.getBodyTextStyle(context,fontSize: 14),
                dateTextStyle: TextStyles.getBodyTextStyle(context,fontSize: 14, fontWeight: FontWeight.bold),
                monthTextStyle: TextStyles.getBodyTextStyle(context,fontSize: 14),

                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  setState(() {
                    selectedDate = DateFormat("yyyy-MM-dd").format(date);
                  });
                },
              ),
              const Gap(15),
              TaskListBuilder(
                selectedDate: selectedDate,
              )
            ],
          ),
        ),
      ),
    );
  }
}