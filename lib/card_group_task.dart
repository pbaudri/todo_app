import 'package:flutter/material.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/utils/colors/colors.dart';

class CardGroupTask extends StatelessWidget {
  const CardGroupTask({
    super.key,
    required this.taskGroup,
    this.isFullScreen = false,
  });

  final TaskGroup taskGroup;
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    final percentageDone = taskGroup.tasks.isEmpty
        ? 0.0
        : taskGroup.tasks
                .where(
                  (element) => element.isDone,
                )
                .length /
            taskGroup.tasks.length;

    return Material(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(isFullScreen ? 0 : 20.0),
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: isFullScreen
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorConstants.lightGrey,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        taskGroup.icon,
                        size: 32.0,
                        color: taskGroup.color,
                      ),
                    ),
                  ),
                  if (!isFullScreen)
                    const Icon(
                      Icons.more_vert_outlined,
                      color: ColorConstants.lightGrey,
                    ),
                ],
              ),
              if (isFullScreen) const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${taskGroup.tasks.length} Tasks',
                    style: TextStyle(
                      color: ColorConstants.darkGrey.withOpacity(.6),
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    taskGroup.name,
                    style: TextStyle(
                      color: ColorConstants.darkGrey.withOpacity(.9),
                      fontWeight: FontWeight.w500,
                      fontSize: 36.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: percentageDone,
                          backgroundColor: ColorConstants.lightGrey,
                          valueColor: AlwaysStoppedAnimation(
                            taskGroup.color,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '${(percentageDone * 100).toStringAsFixed(0)}%',
                        style: TextStyle(
                          color: ColorConstants.darkGrey.withOpacity(.6),
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
