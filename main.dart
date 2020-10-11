import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

//Home Page
class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('SynthWave',
            style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 60.0,
                color: Color(0xFFffdfbe))),
        SizedBox(
          height: 90.0,
          child: Divider(
            thickness: 1.0,
            color: Color(0xFFffdfbe),
            indent: 120,
            endIndent: 120,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(
            color: Color(0xff1D2D54),
            child: Text(
              'Exit',
              style: TextStyle(color: Color(0xFFffdfbe)),
            ),
            onPressed: ()=> Navigator.pop(context),
          ),
          SizedBox(width: 40.0),
          RaisedButton(
            color: Color(0xff1D2D54),
            child:
            Text('Let\'s Go', style: TextStyle(color: Color(0xFFffdfbe))),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SynthWaveApp()),
              );
            },
          )
        ]),
      ]),
      backgroundColor: Color(0xff1D2D54),
    );
  }
}

//Main Page
class SynthWaveApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff1D2D50),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
              backgroundColor: Color(0xff1D2D54),
              leading: BackButton(
                onPressed: () => Navigator.pop(context),
              ),
              title: Text('SYNTH WAVE',
                  style: TextStyle(
                      color: Color(0xFFffdfbe), fontFamily: 'Raleway')),
            )),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Glassy-Guitar",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xFFffdfbe),
                  )),
              Row(children: [
                Expanded(child: AudioPadButton(1)),
                Expanded(child: AudioPadButton(2)),
                Expanded(child: AudioPadButton(3)),
              ]),
              Text("Dope-Drum",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xFFffdfbe),
                  )),
              Row(children: [
                Expanded(child: AudioPadButton(4)),
                Expanded(child: AudioPadButton(5)),
                Expanded(child: AudioPadButton(6)),
              ]),
              Text("Sane-Snare",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xFFffdfbe),
                  )),
              Row(children: [
                Expanded(child: AudioPadButton(7)),
                Expanded(child: AudioPadButton(8)),
                Expanded(child: AudioPadButton(9)),
              ]),
              Text("Bossy-Base",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xFFffdfbe),
                  )),
              Row(children: [
                Expanded(child: AudioPadButton(10)),
                Expanded(child: AudioPadButton(11)),
                Expanded(child: AudioPadButton(12)),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

//Code For Button-Pads
class AudioPadButton extends StatelessWidget {
  AudioPadButton(this.sound);
  final int sound;
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        height: 68.0,
        width: 80.0,
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF1e5f74), width: 2.5),
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xffffdfbe),
              blurRadius: 2.0,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: Center(child: Icon(Icons.audiotrack, color: Color(0xFF1e5f74))),
      ),
      onPressed: () {
        print('Hello$sound');
        final player = AudioCache();
        player.play('$sound.wav');
        },
    );
  }
}