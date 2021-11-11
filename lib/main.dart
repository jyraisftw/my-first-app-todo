import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş Listesi Uygulaması"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List alisverisListesi = [];

  yapilacakEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  yapilacakCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: alisverisListesi.length,
            itemBuilder: (context, indexNumber) => ListTile(
              subtitle: const Text("Alisveris Malzemeleri"),
              title: Text(
                alisverisListesi[indexNumber],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 50,
            right: 50,
          ),
          child: TextField(
            controller: t1,
            maxLength: 20,
            decoration: const InputDecoration(
              icon: Icon(Icons.favorite),
              labelText: 'Label text',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: yapilacakEkle, child: const Text("Ekle")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: yapilacakCikar, child: const Text("Çıkar")),
        ),
      ],
    ));
  }
}
