class CalculatorModel {
  String display = '';

  double? _firstNumber;
  String? _operator;

  void buttonClick(String value) {
    // Clear everything
    if (value == 'C') {
      display = '';
      _firstNumber = null;
      _operator = null;
    }
    // Remove last character
    else if (value == '<-') {
      if (display.isNotEmpty) {
        display = display.substring(0, display.length - 1);
      }
    }
    // Operator buttons (+, -, *, /, %)
    else if ('+-*/%'.contains(value)) {
      if (display.isNotEmpty && _operator == null) {
        _firstNumber = double.tryParse(display);
        _operator = value;
        display += value; // Show operator in display (e.g. 5+)
      }
    }
    // Calculate result
    else if (value == '=') {
      if (_firstNumber != null && _operator != null) {
        List<String> parts = display.split(_operator!);

        if (parts.length == 2 && parts[1].isNotEmpty) {
          double secondNumber = double.tryParse(parts[1]) ?? 0;
          double result = 0;

          if (_operator == '+') {
            result = _firstNumber! + secondNumber;
          } else if (_operator == '-') {
            result = _firstNumber! - secondNumber;
          } else if (_operator == '*') {
            result = _firstNumber! * secondNumber;
          } else if (_operator == '/') {
            result = _firstNumber! / secondNumber;
          } else if (_operator == '%') {
            result = _firstNumber! % secondNumber;
          }

          // Remove .0 for whole numbers
          if (result == result.toInt()) {
            display = result.toInt().toString();
          } else {
            display = result.toString();
          }

          _firstNumber = null;
          _operator = null;
        }
      }
    }
    // Numbers and decimal point
    else {
      display += value;
    }
  }
}
