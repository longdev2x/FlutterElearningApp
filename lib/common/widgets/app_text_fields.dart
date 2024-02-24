import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.controller,
      this.onChanged,
      required this.text,
      required this.hintText,
      this.obscureText = false,
      this.iconPath = ImageRes.home});
  final TextEditingController? controller;
  final String text;
  final String hintText;
  final bool obscureText;
  final String iconPath;
  final void Function(String value)? onChanged;
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text14Normal(text: text),
          const SizedBox(height: 5),
          Container(
            height: 55,
            decoration: appBoxDecorationTextField(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 17),
                  child: AppImage(imagePath: iconPath),
                ),
                appTextFieldOnly(
                  controller: controller,
                  hintText: hintText,
                  obscureText: obscureText,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


Widget appTextFieldOnly({
  double height = 55,
  double width = 280,
  TextEditingController? controller,
  String hintText = 'Type in your info',
  void Function(String value)? onChanged,
  bool obscureText = false,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 7.h, left: 10.w),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      onChanged: onChanged,
      maxLines: 1,
      autocorrect: false,
      obscureText: obscureText,
    ),
  );
}

