import 'package:flutter/material.dart';

class UrlTile extends StatelessWidget {
  final String url;
  final Function()? deleteFunction;

  UrlTile({
    super.key,
    required this.url,
    required this.deleteFunction,
  });

  void deleteTile() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // url
            Expanded(child: Text(url)),
            SizedBox(width: 10,),
            GestureDetector(onTap: deleteFunction, child: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
