
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main()
{
  runApp(ImgPicker());
}
class ImgPicker extends StatefulWidget {
  const ImgPicker({super.key});

  @override
  State<ImgPicker> createState() => _ImgPickerState();
}
ImagePicker imagePicker=ImagePicker();
File? fileImage;

class _ImgPickerState extends State<ImgPicker> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text(
            'Image Picker',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
    body: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Center(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  image: (fileImage != null)
                      ? DecorationImage(
                      fit: BoxFit.cover, image: FileImage(fileImage!))
                      : null,
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () async {
                      XFile? xFileImage = await imagePicker.pickImage(
                          source: ImageSource.camera);
                      setState(() {
                        fileImage = File(xFileImage!.path);
                      });
                    },
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      size: 70,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () async {
                      XFile? xFileImage = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      setState(() {
                        fileImage = File(xFileImage!.path);
                      });
                    },
                    icon: Icon(
                      Icons.photo_rounded,
                      size: 70,
                      color: Colors.black,
                    )),
              ],
            ),
            SizedBox(height: 40),
            Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Text(
                    'Upload Me',
                    style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

