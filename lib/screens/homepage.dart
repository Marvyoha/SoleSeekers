import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/db_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DatabaseProvider().getItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var item = snapshot.data?[index];

                  return ListTile(
                    title: Text(item!.name),
                    subtitle: Text(item.description),
                    leading: Image.network(item.image),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
















// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dbProvider = Provider.of<DatabaseProvider>(context, listen: true);

//     return Scaffold(
//         backgroundColor: Theme.of(context).colorScheme.background,
//         body: FutureBuilder(
//           future: dbProvider.shuffleShoes(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return ListView.builder(
//                 itemCount: dbProvider.shuffled.length,
//                 itemBuilder: (context, index) {
//                   var item = dbProvider.shuffled[index];
//                   return ListTile(
//                     leading: Image.network(item.image),
//                     title: Text(item.name),
//                     subtitle: Text('\$${item.price}'),
//                   );
//                 },
//               );
//             }
//             return const Center(
//                 child: Column(
//               children: [
//                 CircularProgressIndicator(),
//                 Text(
//                   'Loading....',
//                   style: TextStyle(fontSize: 30),
//                 ),
//               ],
//             ));
//           },
//         ));
//   }
// }
