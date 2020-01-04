import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/data/example/providers.dart' as prex;
import 'package:hackaton_pyme_2019/ui/pages/voice_chat/voice_chat.dart';
import 'package:url_launcher/url_launcher.dart';

class Providers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePageVoice(title: 'Asistente'))),
        child: Icon(Icons.mic),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(CupertinoIcons.search, color: Colors.black, size: 24.0),
            onPressed: () {
              //TODO: search
            },
          ),
          IconButton(
            icon: Icon(CupertinoIcons.person_add_solid,
                color: Colors.black, size: 28.0),
            onPressed: () {
              //TODO: add provider
            },
          )
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back, color: Colors.black),
        ),
        brightness: Brightness.light,
        title:
            Text('Mis proveedores', style: Theme.of(context).textTheme.title),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  Widget _contact(String url, BuildContext context) {
    return InkWell(
      onTap: () {
        if (url != null && url.length > 5) {
          launch(url);
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('No hay un número asociado a este contacto'),
          ));
        }
      },
      child: SizedBox(
        height: 20.0,
        width: 20.0,
        child: Image.asset('assets/whatsapp.png'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Encuentra a tus proveedores y contactate con ellos',
                  style: TextStyle(color: Colors.grey)),
              SizedBox(height: 16.0),
              for (int i = 0; i < 7; i++)
                Column(
                  children: <Widget>[
                    ListTile(
                        title: Text(
                            '${prex.providers[i % 6].nombre[0].toUpperCase()}${prex.providers[i % 6].nombre.substring(1)}'),
                        subtitle: Text('${prex.providers[i % 6].description}'),
                        leading: CircleAvatar(
                            child: Text(
                                '${prex.providers[i % 6].nombre[0].toUpperCase()}')),
                        trailing: _contact(
                            '${prex.providers[i % 6].urlContact}', context)),
                    Divider()
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
