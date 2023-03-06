import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: BlackListContainer(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: must_be_immutable
class BlackList extends StatelessWidget {
  BlackList({super.key});

  List<User> listOfUsers = [
    User(
        name: 'Giacomo',
        reason: 'Identity Thief',
        imageUrl:
            'https://img.freepik.com/premium-vector/illustration-cute-wolf-avatar_79416-112.jpg?w=1380',
        times: 2,
        pass: 0),
    User(
        name: 'Carmine',
        reason: 'Too impartial',
        imageUrl:
            'https://img.freepik.com/free-vector/cute-sheep-head-flat-cartoon-style_1308-112190.jpg?w=1800&t=st=1678021551~exp=1678022151~hmac=c8c27f664f4151d644b786e78f59e5a468a3dfafa1968acb1e1379e151a0b848',
        times: 10,
        pass: 1),
    User(
        name: 'Luca',
        reason: 'Instigator of fights',
        imageUrl:
            'https://img.freepik.com/free-vector/cute-cow-with-stop-hand-sign-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-6547.jpg?w=1380&t=st=1678021599~exp=1678022199~hmac=0802d85032f55ac927373693d982c4490efd560ef7f9cbbc1b91c33fafe6d3c8',
        times: 5,
        pass: 0),
  ];

  Widget _buildList() {
    return Flexible(
      child: ListView.separated(
        itemBuilder: (context, index) => _buildRow(context, index),
        separatorBuilder: (_, index) => const Divider(),
        itemCount: listOfUsers.length,
      ),
    );
  }

  Widget _buildRow(context, index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(listOfUsers[index].imageUrl),
      ),
      title: Row(
        children: [
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(listOfUsers[index].name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500))),
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                child: Text(listOfUsers[index].reason,
                    style: const TextStyle(fontSize: 16)),
              ))
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    UserDetailsView(user: listOfUsers[index])));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }
}

class User {
  String name;
  String reason;
  String imageUrl;
  int times;
  int pass;

  User(
      {required this.name,
      required this.reason,
      required this.imageUrl,
      required this.times,
      required this.pass});
}

// ignore: must_be_immutable
class BlackListContainer extends StatelessWidget {
  BlackListContainer({super.key});

  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  Widget _buildListContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child:
                    Text(formattedDate, style: const TextStyle(fontSize: 16)))
          ]),
          BlackList()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'The Blacklist',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: _buildListContainer());
  }
}

class UserDetailsView extends StatelessWidget {
  final User user;

  const UserDetailsView({
    Key? key,
    required this.user,
  }) : super(key: key);

  Widget _buildUserContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(user.name, style: const TextStyle(fontSize: 25)))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Text('Times in Blacklist',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500))),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(user.times.toString(),
                            style: const TextStyle(fontSize: 16)),
                      ))
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Text('Available Free Passes',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500))),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(user.pass.toString(),
                            style: const TextStyle(fontSize: 16)),
                      ))
                ]),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'The Blacklist',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: _buildUserContainer());
  }
}
