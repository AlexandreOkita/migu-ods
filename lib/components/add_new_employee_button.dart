import 'package:flutter/material.dart';
import 'package:migu/components/employee_tile_list.dart';

class AddNewEmployeeButton extends StatelessWidget {
  final void Function()? onPressed;
  const AddNewEmployeeButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        fixedSize: const Size(300, 50),
      ),
      onPressed: onPressed,
      child: Text(
        "+   ADICIONAR NOVO FUNCIONÁRIO",
        style: theme.button,
      ),
    );
  }
}
