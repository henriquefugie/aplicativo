import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'Screens/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visita Técnica',
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<File> _images = [];
  List<String> _texts = [];
  bool _isChecked1 = false;
  bool _isChecked2 = false;

  void _addImage() async {
    final imagePicker = ImagePicker();
    final pickedFile =
        await imagePicker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      final file = File('${path}/${DateTime.now().toString()}.jpg');

      setState(() {
        _images.add(file);
      });

      await file.writeAsBytes(await pickedFile.readAsBytes());
    }
  }

  void _addText(String text) {
    setState(() {
      _texts.add(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visita Técnica'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Text Field 1'),
            TextField(
              onChanged: (text) {
                _addText(text);
              },
            ),
            SizedBox(height: 16.0),
            Text('Text Field 2'),
            TextField(
              onChanged: (text) {
                _addText(text);
              },
            ),
            SizedBox(height: 16.0),
            Text('Text Field 3'),
            TextField(
              onChanged: (text) {
                _addText(text);
              },
            ),
            SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('Check Box 1'),
              value: _isChecked1,
              onChanged: (newValue) {
                setState(() {
                  _isChecked1 = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Check Box 2'),
              value: _isChecked2,
              onChanged: (newValue) {
                setState(() {
                  _isChecked2 = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _addImage();
              },
              child: Text('Add Image'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: List.generate(_images.length, (index) {
                  return Image.file(
                    _images[index],
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _texts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_texts[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      );
  }
}

class MyFormWidget extends StatefulWidget {
  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Group 1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Field 1'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Field 2'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text('Group 2', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Field 3'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Field 4'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text('Group 3', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Field 5'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Field 6'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Submit form
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
