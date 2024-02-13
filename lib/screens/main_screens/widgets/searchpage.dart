import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/font_styles.dart';
import '../../../constant/widgets/custom_textfield.dart';
import '../../../core/providers/services_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final servicesProvider =
        Provider.of<ServicesProvider>(context, listen: false);
    servicesProvider.getCatalogs();
    List? catalogs = servicesProvider.catalogs;

    TextEditingController searchController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: CustomTextField(
            hintText: 'Search catalog',
            controller: searchController,
          ),
        ),
        body: ListView.builder(
          itemCount: catalogs?.length,
          itemBuilder: (BuildContext context, int index) {
            var item = catalogs?[index];
            return ListTile(
              leading: CircleAvatar(
                  radius: 24, backgroundImage: NetworkImage(item['image'])),
              title: Text(
                item['name'],
                style: WriteStyles.cardSubtitle(context).copyWith(),
              ),
              subtitle: Text(
                item['price'].toString(),
                style: WriteStyles.cardSubtitle(context).copyWith(),
              ),
            );
          },
        ));
  }
}
