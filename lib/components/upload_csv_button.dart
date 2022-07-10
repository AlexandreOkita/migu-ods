import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadCSVButton extends StatelessWidget {
  const UploadCSVButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();
          if (result != null) {
            String s = String.fromCharCodes(result.files.first.bytes!).trim();
            final l = s.split("\n").map((row) {
              if (row != ",") {
                return row.split(",");
              }
            }).toList();
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Usuário Cancelou!")));
          }
        },
        child: const Text("Upload File"));
  }
}
