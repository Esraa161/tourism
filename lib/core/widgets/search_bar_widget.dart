import 'package:flutter/material.dart';

import '../IconBroken.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 54,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
            // BoxShadow(
            //     offset: const Offset(5, 5),
            //     blurRadius: 2,
            //     color: KPrimaryColor.withOpacity(0.23)),
          ]),
      child: Row(
        children: [
          const Icon(
            IconBroken.Search,
            size: 26,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.black.withOpacity(.7)),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          const Icon(IconBroken.Filter)
        ],
      ),
    );
  }
}
