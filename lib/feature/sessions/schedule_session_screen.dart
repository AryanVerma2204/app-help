import 'package:flutter/material.dart';
import 'package:mental_health_app/feature/join_now/join_now.dart';
import 'package:mental_health_app/utils/colors.dart';

class ScheduleSessionScreen extends StatefulWidget {
  const ScheduleSessionScreen({super.key});

  @override
  _ScheduleSessionScreenState createState() => _ScheduleSessionScreenState();
}

class _ScheduleSessionScreenState extends State<ScheduleSessionScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedDuration;
  String? selectedMood;

  final List<String> durations = ['30 min', '45 min', '60 min'];
  final List<String> moods = ['Happy 😊', 'Neutral 😐', 'Sad 😔'];

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _confirmSchedule() {
    if (selectedDate != null &&
        selectedTime != null &&
        selectedDuration != null &&
        selectedMood != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Session Scheduled Successfully!')),
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DoctorProfileScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please complete all fields!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalettes.darkOrangeColor,
        title: Text('Schedule Session'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              label: 'Select Date',
              value: selectedDate != null
                  ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                  : 'Pick Date',
              onTap: _selectDate,
            ),
            _buildTextField(
              label: 'Select Time',
              value: selectedTime != null
                  ? selectedTime!.format(context)
                  : 'Pick Time',
              onTap: _selectTime,
            ),
            _buildDropdownField(
              label: 'Select Duration',
              value: selectedDuration,
              items: durations,
              onChanged: (value) => setState(() => selectedDuration = value),
            ),
            _buildDropdownField(
              label: 'Select Mood',
              value: selectedMood,
              items: moods,
              onChanged: (value) => setState(() => selectedMood = value),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _confirmSchedule,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: ColorPalettes.darkOrangeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('SUBMIT',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.calendar_today),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: value == 'Pick Date' || value == 'Pick Time'
                  ? Colors.grey
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        value: value,
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
