import 'package:flutter/material.dart';

const inputDecorationForm = InputDecoration(
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                                fillColor: Colors.grey,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0)
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2.0
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0)
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2.0
                                  ),
                                ),
                              );