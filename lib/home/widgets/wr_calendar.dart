import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  final ValueChanged<DateTime>? onDateSelected;

  const CustomCalendar({Key? key, this.onDateSelected}) : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar>
    with SingleTickerProviderStateMixin {
  DateTime _focusedDate = DateTime.now();
  int? _selectedDay;
  bool _isCalendarVisible = true;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    // Start the animation in the visible state
    _animationController.value = 1.0;
    
    // Select today's date by default
    _selectedDay = DateTime.now().day;
    if (widget.onDateSelected != null) {
      widget.onDateSelected!(DateTime.now());
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCalendar() {
    setState(() {
      _isCalendarVisible = !_isCalendarVisible;
      if (_isCalendarVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  List<Widget> _buildDayCircles(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final totalDays = DateTime(month.year, month.month + 1, 0).day;
    final startWeekday = firstDay.weekday % 7; // Sunday as 0

    List<Widget> dayWidgets = [];

    for (int i = 0; i < startWeekday; i++) {
      dayWidgets.add(Container());
    }

    for (int i = 1; i <= totalDays; i++) {
      final isSelected = i == _selectedDay;
      dayWidgets.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedDay = i;
            });
            if (widget.onDateSelected != null) {
              final selectedDate = DateTime(
                _focusedDate.year,
                _focusedDate.month,
                i,
              );
              widget.onDateSelected!(selectedDate);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isSelected
                      ? const Color(0xff0E86A6)
                      : const Color(0xff1A2A30),
            ),
            alignment: Alignment.center,
            child: Text(
              i.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    }

    return dayWidgets;
  }

  void _goToPreviousMonth() {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month - 1);
      _selectedDay = null;
    });
  }

  void _goToNextMonth() {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + 1);
      _selectedDay = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final monthYear = DateFormat.yMMMM().format(_focusedDate);

    return Column(
      children: [
        GestureDetector(
          onTap: _toggleCalendar,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            color: const Color(0xff09161C),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.calendar_month, size: 24, color: Colors.white),
                const SizedBox(width: 10),
                const Text(
                  "Today's Activities",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Icon(
                  _isCalendarVisible
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: const Color(0xff33BADD),
                  size: 24,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _animation,
          child: Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xff09161C),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      monthYear,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color(0xff33BADD),
                          ),
                          onPressed: _goToPreviousMonth,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Color(0xff33BADD),
                          ),
                          onPressed: _goToNextMonth,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GridView.count(
                  crossAxisCount: 7,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _buildDayCircles(_focusedDate),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
