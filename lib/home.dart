import 'package:flutter/material.dart';
import 'package:invitationaplicationbirthdayparty/invitationlist.dart';
import 'qr.dart';
import 'menu.dart';
import 'package:invitationaplicationbirthdayparty/model/Undangan.dart';
import 'package:invitationaplicationbirthdayparty/webservice/apiUndangan.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiUndangan? apiUndangan;
  @override
  void initState() {
    super.initState();
    apiUndangan = ApiUndangan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('Birthday Invitation'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_on,
              color: Colors.redAccent[700],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ), // IconButton
        ], // <Widget>[]
        backgroundColor: Colors.purpleAccent[700],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UndanganList()));
                },
                style:
                    ElevatedButton.styleFrom(primary: Colors.purpleAccent[700]),
                child: Text(
                  "Participant List",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QRViewExample()));
                },
                style:
                    ElevatedButton.styleFrom(primary: Colors.purpleAccent[700]),
                child: Text(
                  "Find QR",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    child: FutureBuilder<List<Undangan>?>(
                        future: apiUndangan!.getUndanganAll(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Undangan>?> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error.toString());
                            return Center(
                              child: Text("Error ${snapshot.error.toString()}"),
                            );
                          } else if (snapshot.hasData) {
                            List<Undangan>? _undangan = snapshot.data;
                            if (_undangan != null) {
                              return ListTile(
                                  leading: Icon(Icons.people),
                                  title: Text(
                                      "Participant : ${_undangan.length}"));
                            } else {
                              return Text("0");
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  ),
                  Card(
                    child: FutureBuilder<List<Undangan>?>(
                        future: apiUndangan!.getUndanganHadir(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Undangan>?> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error.toString());
                            return Center(
                              child: Text("Error ${snapshot.error.toString()}"),
                            );
                          } else if (snapshot.hasData) {
                            List<Undangan>? _undangan = snapshot.data;
                            if (_undangan != null) {
                              return ListTile(
                                  leading:
                                      Icon(Icons.star, color: Colors.black),
                                  title:
                                      Text("Available : ${_undangan.length}"));
                            } else {
                              return Text("0");
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  ),
                  Card(
                    child: FutureBuilder<List<Undangan>?>(
                        future: apiUndangan!.getUndanganTidakHadir(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Undangan>?> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error.toString());
                            return Center(
                              child: Text("Error ${snapshot.error.toString()}"),
                            );
                          } else if (snapshot.hasData) {
                            List<Undangan>? _undangan = snapshot.data;
                            if (_undangan != null) {
                              return ListTile(
                                  leading: Icon(Icons.star),
                                  title: Text(
                                      "Not Available : ${_undangan.length}"));
                            } else {
                              return Text("0");
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.0),
              image: DecorationImage(
                image: NetworkImage(
                    'https://lh3.googleusercontent.com/-BDSXasEOJq0/YGKjO3Pe9CI/AAAAAAAAIiY/IUzA7GO1FlgT-nra7GwvDCTanbgml__uwCNcBGAsYHQ/pexels-daria-obymaha-1684149.jpg'),
                fit: BoxFit.cover,
              ),
              color: Colors.deepPurpleAccent[400],
            ),
          ),
          ListTile(
            leading: Icon(Icons.adjust_outlined),
            title: Text('Birthday Party Participant'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
