import 'package:flutter/material.dart';
import 'package:horizon/config/theme/text_styles.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/dashboard_cards.dart';


class CalendarCard extends StatefulWidget {
  const CalendarCard({super.key});

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  DateTime selectedDate = DateTime(2021, 4, 1);
  List<int> highlightedDates = [27, 30];

  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  final List<int> years = List.generate(50, (index) => 2000 + index);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: LargeCard(
          height: 350,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(),
              const SizedBox(height: 12),
              _buildWeekdayHeaders(),
              const SizedBox(height: 8),
              Expanded(child: _buildCalendarGrid()),
            ],
          ),
        ),
      );

  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDropdown(
          value: months[selectedDate.month - 1],
          items: months,
          onChanged: (value) {
            setState(() {
              int monthIndex = months.indexOf(value!) + 1;
              selectedDate = DateTime(selectedDate.year, monthIndex, 1);
            });
          },
        ),
        SizedBox(width: 16,),
        _buildDropdown(
          value: selectedDate.year.toString(),
          items: years.map((year) => year.toString()).toList(),
          onChanged: (value) {
            setState(() {
              selectedDate = DateTime(int.parse(value!), selectedDate.month, 1);
            });
          },
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButton<String>(
        value: value,
        isDense: true,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: bold.copyWith(fontSize: 14),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        underline: Container(),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
          size: 24,
        ),
        dropdownColor: const Color(0xFF2A3B6B),
        style: bold.copyWith(fontSize: 14),
    );
  }

  Widget _buildWeekdayHeaders() {
    const weekdays = ['Mo', 'Tu', 'We', 'Th', 'Fri', 'Sa', 'Su'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: weekdays.map((day) {
        return Expanded(
          child: Center(
            child: Text(
              day,
              style: bold.copyWith(fontSize: 14),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid() {
    return _buildCalendarBody();
  }

  Widget _buildCalendarBody() {
    final firstDayOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);
    final lastDayOfMonth = DateTime(selectedDate.year, selectedDate.month + 1, 0);
    final firstDayWeekday = firstDayOfMonth.weekday;
    final daysInMonth = lastDayOfMonth.day;

    // Previous month days
    final prevMonth = DateTime(selectedDate.year, selectedDate.month - 1, 0);
    final prevMonthDays = prevMonth.day;

    List<Widget> calendarDays = [];

    // Add previous month's trailing days
    for (int i = firstDayWeekday - 1; i > 0; i--) {
      calendarDays.add(_buildCalendarDay(
        day: prevMonthDays - i + 1,
        isCurrentMonth: false,
        isHighlighted: false,
      ));
    }

    // Add current month days
    for (int day = 1; day <= daysInMonth; day++) {
      calendarDays.add(_buildCalendarDay(
        day: day,
        isCurrentMonth: true,
        isHighlighted: highlightedDates.contains(day),
      ));
    }

    // Add next month's leading days
    int remainingCells = 42 - calendarDays.length;
    for (int day = 1; day <= remainingCells; day++) {
      calendarDays.add(_buildCalendarDay(
        day: day,
        isCurrentMonth: false,
        isHighlighted: false,
      ));
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: calendarDays,
    );
  }

  Widget _buildCalendarDay({
    required int day,
    required bool isCurrentMonth,
    required bool isHighlighted,
  }) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFF6366F1) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          day.toString(),
          style: medium.copyWith(fontSize: 12,)
        ),
      ),
    );
  }
}