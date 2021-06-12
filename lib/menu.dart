import 'package:flutter/material.dart';
import 'home.dart';

class SelectFigure extends StatelessWidget {
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
            onPressed: () {},
          ), // IconButton
        ], // <Widget>[]

        backgroundColor: Colors.purpleAccent[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100),
            Picture(),
            SizedBox(height: 50),
            FigureOne(),
          ],
        ),
      ),
    );
  }
}

class FigureOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.greenAccent[50]!,
                blurRadius: 8.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          width: 150,
          margin: const EdgeInsets.only(top: 20.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.assignment_sharp,
                      size: 70,
                      color: Colors.purpleAccent[700],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.greenAccent[50]!,
                blurRadius: 8.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          width: 150,
          margin: const EdgeInsets.only(top: 20.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.bubble_chart_sharp,
                      size: 70,
                      color: Colors.purpleAccent[700],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.greenAccent[50]!,
                blurRadius: 8.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          width: 150,
          margin: const EdgeInsets.only(top: 20.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.auto_awesome_mosaic,
                      size: 70,
                      color: Colors.purpleAccent[700],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.greenAccent[50]!,
                blurRadius: 8.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          width: 150,
          margin: const EdgeInsets.only(top: 20.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.attach_email_sharp,
                      size: 70,
                      color: Colors.purpleAccent[700],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Picture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/home.jpg", width: 250.0, fit: BoxFit.cover),
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
