import 'package:flutter/material.dart';
import 'package:migu/components/employee_tile_list.dart';
import 'package:migu/models/employee.dart';

class MentorMentorshipRelation extends StatelessWidget {
  final Employee mentor;
  final Employee mentee;
  const MentorMentorshipRelation({Key? key, required this.mentor, required this.mentee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 1,
          child: EmployeeListTile(
            area: mentor.area,
            email: mentor.email,
            name: mentor.name,
            surname: mentor.surname,
          ),
        ),
        Flexible(
          flex: 1,
          child: Icon(
            Icons.compare_arrows,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Flexible(
          flex: 1,
          child: EmployeeListTile(
            area: mentee.area,
            email: mentee.email,
            name: mentee.name,
            surname: mentee.surname,
          ),
        ),
      ],
    );
  }
}
