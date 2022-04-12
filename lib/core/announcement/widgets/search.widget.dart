import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';

commonSearchBarWidget({
  required BuildContext context,
  FocusNode? focusNode,
  EdgeInsetsGeometry? padding: const EdgeInsets.all(10),
  void Function()? onTap,
  // void Function(String)? onSubmitted,
  void Function(String)? onChanged,
}) {
  return Container(
    constraints: BoxConstraints(
      // minHeight: getProportionateScreenHeight(context, 40),
      maxHeight: getProportionateScreenHeight(context, 56),
    ),
    padding: padding,
    child: TextField(
      focusNode: focusNode,
      style: TextStyle(
        fontSize: getProportionateScreenWidth(
          context,
          getProportionateScreenHeight(context, 16),
        ),
        color: Colors.black,
      ),
      decoration: InputDecoration(
        isDense: true,
        hintText: "Search...",
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade600,
          size: 20,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey.shade100,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey.shade100,
          ),
        ),
      ),
      onChanged: onChanged,
      onTap: onTap,
      // onSubmitted: onSubmitted,
    ),
  );
}
