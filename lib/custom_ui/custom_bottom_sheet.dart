import 'package:contact_list/custom_ui/custom_button.dart';
import 'package:contact_list/custom_ui/custom_header.dart';
import 'package:contact_list/custom_ui/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  late double _height;
  late double _width;
  bool _autoValidate = false;
  final _bottomSheetFormGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(25.0),
      width: _width,
      child: Wrap(
        children: [
          _formField(),
          Center(child: _addButton()),
        ],
      ),
    );
  }

  Widget _formField() {
    return Form(
        key: _bottomSheetFormGlobalKey,
        autovalidateMode:
            _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: Column(
          children: [
            CustomHeader(
              headerName: 'Add New Contact',
              marginBottom: _height * 0.03,
              fontSize: 18,
            ),
            CustomTextFormField(
              label: 'Name',
              inputType: TextInputType.name,
              //onSaved: _onNameSaved,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'Can not be Empty';
                }
              },
              prefixIcon: Icon(
                Icons.people_outline_outlined,
                color: Colors.purple.shade400,
              ),
            ),
            SizedBox(
              height: _height * .02,
            ),
            CustomTextFormField(
              label: 'Mobile Number',
              prefixText: '+880 ',
              inputType: TextInputType.phone,
              //onSaved: _onMobileNumberSaved,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'Can not be Empty';
                } else if (value.length != 10) {
                  return 'Please input 10 digit mobile number';
                }
              },
              prefixIcon: Icon(
                Icons.smartphone_outlined,
                color: Colors.purple.shade400,
              ),
            ),
            SizedBox(
              height: _height * .03,
            ),
          ],
        ));
  }

  Widget _addButton() {
    return CustomButton(onButtonPressed: _addButtonClicked, buttonName: 'Add');
  }

  _addButtonClicked() {
    FocusScope.of(context).unfocus();
    if (_bottomSheetFormGlobalKey.currentState!.validate()) {
      _bottomSheetFormGlobalKey.currentState?.save();
    }

    setState(() {
      _autoValidate = true;
    });
  }
}
