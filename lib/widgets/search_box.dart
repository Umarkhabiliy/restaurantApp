import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;

  final VoidCallback? onTap;

  SearchBox({this.controller, this.hint, this.onTap});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextFormField(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchBox())),
        controller: widget.controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            fillColor: Colors.grey.shade300.withOpacity(0.4),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)))),
      ),
    );
  }
}
