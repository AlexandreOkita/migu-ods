import 'package:flutter/material.dart';
import 'package:migu/components/employee_tile_list.dart';

class MentorMentorshipRelation extends StatelessWidget {
  const MentorMentorshipRelation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Flexible(
          flex: 1,
          child: EmployeeListTile(),
        ),
        Flexible(
          flex: 1,
          child: Icon(
            Icons.compare_arrows,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const Flexible(
          flex: 1,
          child: EmployeeListTile(),
        ),
      ],
    );
  }
}
