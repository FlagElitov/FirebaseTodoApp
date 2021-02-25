import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TODOList extends StatelessWidget {
  TODOList({Key key}) : super(key: key);

  final collection = Firestore.instance.collection('tasks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO app'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'Open shopping cart',
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
            },
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: collection.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');

            return snapshot.hasData
                ? ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return _ListItem(document: document);
                    }).toList(),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create'),
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final DocumentSnapshot document;

  _ListItem({
    Key key,
    this.document,
  }) : super(key: key);

  final collection = Firestore.instance.collection('tasks');

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(document['name']),
      value: document['completed'],
      onChanged: (newValue) => collection
          .document(document.documentID)
          .updateData({'completed': newValue}),
    );
  }
}
