import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UrlCopy extends StatelessWidget {
  final String url;
  final bool dark;

  // final String keyWords;

  const UrlCopy({
    super.key,
    required this.dark,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = dark ? Colors.white : Colors.black;
    final Color bgColor =
    dark ? const Color(0xff101F36) : Colors.white.withOpacity(0.7);
    final Color borderColor =
    dark ? const Color(0xff101F36) : const Color(0xffEBDFD7);

    return Container(
      height: 40,
      width: 420,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
        color: bgColor,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              width: 320,
              child: Text(
                url,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: textColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),

          IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: url)).then((_){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Url Copied'),
                ),);
              });
            },
            icon: Icon(Icons.copy_rounded, color: textColor,),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
