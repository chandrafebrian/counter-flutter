import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Aplikasi extends StatefulWidget {
  @override
  _AplikasiState createState() => _AplikasiState();
}

class _AplikasiState extends State<Aplikasi> {
  int angka = 0;
//nama tekan tombol adalah sebuah fungsi menjalankan increment / penambahan saat di klik

  void tekanTombol() {
    setState(() {
      angka++;
    });
  }

//nama reset adalah sebuah fungsi yg akan ditugaskan untuk menjalankan perintah reset.
  void reset() {
    setState(() {
      if (angka >= 0) {
        angka = 0;
      }
    });
  }

  void simpanData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('nilai', angka);
  }

  Future<int> getNama() async {
    setState(() {});
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('nilai') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(
            child: Text(
          'Counter Aplication',
          style: TextStyle(fontSize: 25, color: Colors.white),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              angka.toString(),
              style: TextStyle(fontSize: 90, color: Colors.redAccent),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(80, 80),
                  primary: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                child: Text(
                  'Back',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  reset();
                }),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(80, 80),
                  primary: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                child: Text(
                  'Load',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  getNama().then((hasil) => angka = hasil);
                }),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(80, 80),
                  primary: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  simpanData();
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 35,
        ),
        backgroundColor: Colors.redAccent,
        onPressed: () {
          tekanTombol();
        },
      ),
    );
  }
}
