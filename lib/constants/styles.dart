import 'package:firebase_auth_app/constants/colors.dart';
import 'package:flutter/material.dart';

const TextStyle descriptionStyle = TextStyle(
  color: textLight,
  fontSize: 12,
  fontWeight: FontWeight.w200,
);

const TextStyle TopicStyle = TextStyle(
  color: textLight,
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

const textStyleInputDecoration = InputDecoration(
  hintText: "Email",
  fillColor: bgBlack,
  hintStyle: TextStyle(color: textLight, fontSize: 15),
  filled: true,
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: mainYellow, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: mainYellow, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
);
