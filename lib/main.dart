import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Stuff',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Lets Go')),
        body: Builder(
          builder: (context) => SafeArea(
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text('Welcome to My App'),
                      ),
                      Container(
                        child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      ),
                      Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: 'Name',
                                ),
                                validator: (String? val) {
                                  if (val == null) return "Name is required";
                                },
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: 'Email',
                                ),
                                validator: (String? val) {
                                  if (val == null) return "Email is required";
                                },
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: 'Password',
                                ),
                                validator: (String? val) {
                                  if (val == null)
                                    return "Password is required";
                                },
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content:
                                          Text('Signed Up and Ready to Go'),
                                      action: SnackBarAction(
                                        label: 'OK',
                                        onPressed: () {},
                                      ),
                                    ));
                                  }
                                },
                                child: Text('Submit'),
                              )
                            ],
                          ))
                    ],
                  ))),
        ),
      ),
    );
  }
}
