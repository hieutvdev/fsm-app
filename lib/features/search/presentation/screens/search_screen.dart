import 'package:flutter/material.dart';
import 'package:fsm_app/common/widgets/appbar/app_bar_base_wg.dart';
import 'package:fsm_app/common/widgets/input/text_field_input.dart';
import 'package:fsm_app/config/theme/colors/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBaseWg(
        title: Container(
          height: 66,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextFieldInput(
            controller: _searchController,
            hintText: "Search...",
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic,
                  size: 20,
                )),
            prefixIcon: const Icon(
              Icons.search,
              size: 20,
            ),
            fillColor: AppColors.darkGrey,
          ),
        ),
        isLogo: false,
        leadingIcon: Icons.arrow_back,
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Search",
                style: TextStyle(color: Colors.pink, fontSize: 15),
              ))
        ],
        centerTitle: false,
      ),
      body: const Center(
        child: Text(
          "Search Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
