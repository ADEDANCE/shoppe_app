import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool obscureText = true;

class PasswordBox extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final int pinLength;
  const PasswordBox({
    super.key,
    required this.controllers,
    required this.focusNodes,
    this.pinLength = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(pinLength, (index) {
              return Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF8F8F8),

                  // border: Border.all(color: Colors.blue),
                ),
                //   alignment: Alignment.center,
                child: TextFormField(
                  showCursor: true,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  controller: controllers[index],
                  //  passwordControllers[index],
                  focusNode: focusNodes[index],
                  // passwordfocuNode[index],
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  obscureText: obscureText,
                  onChanged: (value) {
                    if (value.isNotEmpty && index < pinLength - 1) {
                      // Automatically moves focus to next PIN box when a digit is entered,
                      FocusScope.of(
                        context,
                      ).requestFocus(focusNodes[index + 1]);
                    } else if (value.isEmpty && index > 0) {
                      // and moves focus back when the digit is deleted.
                      FocusScope.of(
                        context,
                      ).requestFocus(focusNodes[index - 1]);
                    }
                  },
                  decoration: InputDecoration(
                    counterText: '',
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //  borderSide: BorderSide.none
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        // TextField(
        //   keyboardType: TextInputType.number,
        //   maxLength: 6,
        //   onChanged: (value) {
        //     setState(() {
        //       pin = value;
        //     });
        //   },
        //   decoration: InputDecoration(
        //     counterText: '',
        //     border: InputBorder.none,
        //   ),
        // ),
      ],
    );
  }
}
