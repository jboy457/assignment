import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CTextInput extends StatelessWidget {
  final String? hint;
  final String? label;
  final String? description;
  final String? type;
  final String? value;
  final String? errorText;
  final String? counter;
  final int? maxLines;
  final int? maxLength;
  final TextStyle? counterStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enabled;
  final bool? bottomPadding;
  final Color? labelColor;
  final Color? hintColor;
  final Color? fillColor;
  final InputBorder? inputBorder;
  final FontWeight? fontWeight;
  final bool? obsecure;
  final bool? readOnly;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;

  const CTextInput(
      {Key? key,
      this.hint,
      this.label,
      this.description,
      this.value,
      this.maxLines = 1,
      this.maxLength = 100,
      this.counterStyle,
      this.counter = '',
      this.suffixIcon,
      this.prefixIcon,
      this.enabled = true,
      this.bottomPadding = true,
      this.labelColor,
      this.hintColor,
      this.fillColor,
      this.inputBorder,
      this.fontWeight,
      this.obsecure = false,
      required this.onSaved,
      this.onChanged,
      this.validator,
      this.controller,
      this.type,
      this.onTap,
      this.readOnly,
      this.errorText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label!,
                style: theme.textTheme.labelMedium,
              ),
              if (counter != '')
                Text(counter!,
                    style: counterStyle ??
                        theme.textTheme.bodySmall!.copyWith(
                          color: theme.primaryColor,
                          fontSize: 12,
                        ))
            ],
          ),
        if (inputBorder == null) const SizedBox(height: 5),
        TextFormField(
          textCapitalization: TextCapitalization.sentences,
          controller: controller,
          readOnly: readOnly ?? false,
          keyboardType: type == 'number'
              ? const TextInputType.numberWithOptions(
                  signed: true, decimal: true)
              : TextInputType.text,
          inputFormatters: type == 'number' ? <TextInputFormatter>[] : [],
          maxLength: type == 'number' ? 15 : maxLength,
          style: theme.textTheme.bodySmall,
          initialValue: value,
          maxLines: maxLines,
          cursorColor: theme.colorScheme.onTertiary,
          cursorRadius: const Radius.circular(20),
          cursorWidth: 1,
          // cursorHeight: 30,
          enabled: enabled,
          onTap: onTap,
          obscureText: obsecure!,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
            errorMaxLines: 1,
            hintText: hint,
            filled: true,
            fillColor: fillColor ?? theme.colorScheme.onSecondary,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefix: const Padding(padding: EdgeInsets.only(left: 15.0)),
            hintStyle: theme.textTheme.bodySmall?.copyWith(
              color: theme.hintColor,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
              borderSide: BorderSide(color: theme.errorColor),
            ),
            errorStyle: theme.textTheme.bodySmall
                ?.copyWith(color: theme.errorColor, fontSize: 12),
            errorText: errorText,
            counterText: '',
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                borderSide: BorderSide(
                  color: theme.primaryColor,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                borderSide: BorderSide(
                  color: theme.primaryColor,
                )),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                borderSide: BorderSide.none),
          ),
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
        ),
        if (description != null)
          const SizedBox(
            height: 6,
          ),
        if (description != null)
          Text(
            description!,
            style: theme.textTheme.bodySmall,
          ),
        if (bottomPadding!)
          const SizedBox(
            height: 10,
          )
      ],
    );
  }
}

class ThousandsFormatter {}
