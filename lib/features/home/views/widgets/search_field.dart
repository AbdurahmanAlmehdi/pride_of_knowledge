import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prideofknowledge/features/authentication/views/generics/text_field.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController _search;
  var focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _search = TextEditingController();
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: focusNode,
      onKeyEvent: (event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.enter) {
          //TODO Do something
        }
      },
      child: GenericTextField(
        obscureText: false,
        controller: _search,
        labelText: 'Search',
        prefixIcon: Icons.search,
      ),
    );
  }
}
