import 'package:flutter/material.dart';

class DatePickerInput extends StatefulWidget {
  final String title;
  final String hint;
  final String? Function(String?)? validator;

  const DatePickerInput({
    super.key,
    required this.title,
    required this.hint,
    this.validator,
  });

  @override
  _DatePickerInputState createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text =
            "${picked.day}/${picked.month}/${picked.year}"; // Formato DD/MM/AAAA
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.title),
        TextFormField(
          controller: _controller,
          readOnly: true, // Evita que el usuario escriba en el campo
          decoration: InputDecoration(
            hintText: widget.hint, // Cambiado de 'hint' a 'hintText'
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () => _selectDate(context),
            ),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
