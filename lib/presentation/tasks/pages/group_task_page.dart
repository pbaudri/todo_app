import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/presentation/tasks/widgets/card_group_task_widget.dart';
import 'package:todo_app/utils/colors/colors.dart';

class GroupTaskPage extends StatefulWidget {
  const GroupTaskPage({
    super.key,
    required this.taskGroup,
  });
  final TaskGroup taskGroup;

  @override
  State<GroupTaskPage> createState() => _GroupTaskPageState();
}

class _GroupTaskPageState extends State<GroupTaskPage> {
  @override
  Widget build(BuildContext context) {
    final tasks = widget.taskGroup.tasks;
    DateTime? currentDate;
    DateTime? oldTaskDate;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.maybePop(context),
                    child: const Icon(
                      Icons.arrow_back_outlined,
                      color: ColorConstants.darkGrey,
                    ),
                  ),
                  const Icon(
                    Icons.more_vert_outlined,
                    color: ColorConstants.darkGrey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardGroupTaskWidget(
                      taskGroup: widget.taskGroup,
                      isFullScreen: true,
                    ),
                    const SizedBox(height: 24.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          oldTaskDate = currentDate;
                          final task = tasks.elementAt(index);
                          currentDate = task.date;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (oldTaskDate?.day != currentDate?.day) ...[
                                Text(
                                  DateFormat('EEEE').format(currentDate!),
                                  style: TextStyle(
                                    color:
                                        ColorConstants.darkGrey.withOpacity(.5),
                                    fontSize: 14.0,
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                              ],
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: task.isDone,
                                      onChanged: (value) {
                                        setState(() {
                                          task.isDone = !task.isDone;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      fillColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                          if (states.contains(
                                            MaterialState.disabled,
                                          )) {
                                            return widget.taskGroup.color
                                                .withOpacity(.32);
                                          }

                                          return widget.taskGroup.color;
                                        },
                                      ),
                                    ),
                                    Text(
                                      task.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        decoration: task.isDone
                                            ? TextDecoration.lineThrough
                                            : null,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 1,
                                color: ColorConstants.lightGrey,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
