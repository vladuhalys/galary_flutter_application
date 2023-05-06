import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:galary_flutter_application/domain/models/photo.dart';

class AboutPhoto extends StatelessWidget {
  final Photo photo;
  const AboutPhoto({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(utf8.decode(photo.authorName.toString().runes.toList())),
        ),
        body: Stack(
          children: [
            Image.network(
              photo.urlImage.toString(),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    
                    
                    if (photo.description != null)
                    DefaultTextStyle(
                      style: const TextStyle(color: Colors.white, fontSize: 14.0),
                      child: Text(utf8.decode(photo.description.toString().runes.toList())),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
