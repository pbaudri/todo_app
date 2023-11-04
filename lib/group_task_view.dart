import 'package:flutter/material.dart';
import 'package:todo_app/card_group_task.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/utils/colors/colors.dart';

class GroupTaskView extends StatelessWidget {
  const GroupTaskView({
    super.key,
    required this.taskGroup,
  });
  final TaskGroup taskGroup;

  @override
  Widget build(BuildContext context) {
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
                    CardGroupTask(
                      taskGroup: taskGroup,
                      isFullScreen: true,
                    ),
                    const SizedBox(height: 24.0),
                    Text(
                      'Today',
                      style: TextStyle(
                        color: ColorConstants.darkGrey.withOpacity(.5),
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: taskGroup.tasks.length,
                        itemBuilder: (context, index) {
                          final task = taskGroup.tasks.elementAt(index);

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: task.isDone,
                                      onChanged: (value) {},
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      fillColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                          if (states.contains(
                                            MaterialState.disabled,
                                          )) {
                                            return taskGroup.color
                                                .withOpacity(.32);
                                          }

                                          return taskGroup.color;
                                        },
                                      ),
                                    ),
                                    Text(
                                      task.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
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
