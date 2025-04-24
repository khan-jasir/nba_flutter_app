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
  bool _showBackToToday = false;

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

  bool _isSelectedDateToday() {
    if (_selectedDay == null) return true;
    final now = DateTime.now();
    return _focusedDate.year == now.year &&
           _focusedDate.month == now.month &&
           _selectedDay == now.day;
  }

  void _goToToday() {
    setState(() {
      final now = DateTime.now();
      _focusedDate = now;
      _selectedDay = now.day;
      _showBackToToday = false;
    });
    if (widget.onDateSelected != null) {
      widget.onDateSelected!(DateTime.now());
    }
  }

  void _goToPreviousMonth() {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month - 1);
      _selectedDay = null;
      _showBackToToday = true;
    });
  }

  void _goToNextMonth() {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + 1);
      _selectedDay = null;
      _showBackToToday = true;
    });
  }

  List<Widget> _buildDayCircles(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final totalDays = DateTime(month.year, month.month + 1, 0).day;
    final startWeekday = firstDay.weekday % 7; // Sunday as 0

    // Calculate the date range limits
    final now = DateTime.now();
    final minDate = now.subtract(const Duration(days: 15));
    final maxDate = now;

    List<Widget> dayWidgets = [];

    for (int i = 0; i < startWeekday; i++) {
      dayWidgets.add(Container());
    }

    for (int i = 1; i <= totalDays; i++) {
      final currentDate = DateTime(month.year, month.month, i);
      final isSelected = i == _selectedDay;
      // Compare dates by creating new DateTime objects with only year, month, and day
      final isEnabled = currentDate.isAfter(minDate.subtract(const Duration(days: 1))) && 
                       !currentDate.isAfter(maxDate);

      dayWidgets.add(
        GestureDetector(
          onTap: isEnabled ? () {
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
          } : null,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? const Color(0xff0E86A6)
                  : isEnabled
                      ? const Color(0xff1A2A30)
                      : const Color(0xff1A2A30).withOpacity(0.3),
            ),
            alignment: Alignment.center,
            child: Text(
              i.toString(),
              style: TextStyle(
                color: isEnabled ? Colors.white : Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    }

    return dayWidgets;
  }

  @override
  Widget build(BuildContext context) {
    final monthYear = DateFormat.yMMMM().format(_focusedDate);
    final today = DateTime.now();
    final formattedToday = DateFormat('dd-MM-yyyy').format(today);

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
                if (!_isSelectedDateToday()) ...[
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: _goToToday,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xff1B4753),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formattedToday,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "BACK TO TODAY",
                              style: TextStyle(
                                color: const Color(0xff33BADD),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
