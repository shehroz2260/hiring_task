import 'package:flutter/material.dart';
import '../src/app_colors.dart';


class CustomTextField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final String hintText;
  final bool isPasswordField;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? enabled;
  final bool isSowPrefixcon;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final String? labelText;
  final int? maxLength;
  final int? errorMaxLines;
  final bool autofocus;
  final int maxLines;
  final TextInputType? keyboardType;
  const CustomTextField(
      {super.key,
      this.errorMaxLines,
      this.autofocus = false,
      this.prefixIcon,
      this.keyboardType,
      this.sufixIcon,
      this.maxLength,
      this.enabled,
      this.maxLines = 1,
      this.textEditingController,
      this.onChange,
      required this.hintText,
      this.validator,
      this.isPasswordField = false,
      this.floatingLabelBehavior,
      this.labelText,
      this.isSowPrefixcon = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  void visiblePassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      autofocus: widget.autofocus,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      onChanged: widget.onChange,
      enabled: widget.enabled,
      validator: widget.validator,
      controller: widget.textEditingController,
      cursorColor: AppColors.black,
      obscureText: isVisible,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        errorMaxLines: widget.errorMaxLines,
        prefixIcon: widget.prefixIcon ??
            (widget.isSowPrefixcon
                ? const Icon(Icons.search, color: Colors.grey)
                : null),
        labelText: widget.labelText,
        floatingLabelBehavior: widget.floatingLabelBehavior,
        suffixIcon: widget.sufixIcon ??
            (widget.isPasswordField
                ? Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                        onTap: visiblePassword,
                        child: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        )),
                  )
                : null),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.white, width: 1)),
        hintText: widget.hintText,
       
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.white, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.white, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.white, width: 1)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.white, width: 1)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.white, width: 1)),
      ),
    );
  }
}

