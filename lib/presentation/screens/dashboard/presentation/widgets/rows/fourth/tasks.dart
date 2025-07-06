import 'package:flutter/material.dart';
import 'package:horizon/config/theme/app_colors.dart';
import 'package:horizon/config/theme/text_styles.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/dashboard_cards.dart';

import '../../../../../../../core/presentation/widgets/custom_checkbox.dart';

class TasksCard extends StatefulWidget {
  const TasksCard({super.key});

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  @override
  Widget build(BuildContext context) {
    return LargeCard(
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomCheckbox(isChecked: true),
              SizedBox(width: 16),
              Text('Tasks', style: bold.copyWith(fontSize: 18)),
              Spacer(),
              CustomCard(child: Icon(Icons.more_horiz)),
            ],
          ),
          SizedBox(height: 24),
          Expanded(
            child: ReorderableListView.builder(
              itemCount: tasks.length,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final TaskItem item = tasks.removeAt(oldIndex);
                  tasks.insert(newIndex, item);
                });
              },
              buildDefaultDragHandles: false,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Container(
                  key: ValueKey(task.title),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: GestureDetector(
                      onTap: () {
                        setState(() {
                          task.isCompleted = !task.isCompleted;
                        });
                      },
                      child: CustomCheckbox(isChecked: task.isCompleted),
                    ),
                    title: Text(
                      task.title,
                      style: medium.copyWith(fontSize: 16),
                    ),
                    trailing: ReorderableDragStartListener(
                      index: index,
                      child:  Icon(
                          Icons.drag_indicator,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<TaskItem> tasks = [
  TaskItem(title: 'Landing Page Design', isCompleted: false),
  TaskItem(title: 'Dashboard Builder', isCompleted: true),
  TaskItem(title: 'Mobile App Design', isCompleted: true),
  TaskItem(title: 'Illustrations', isCompleted: false),
  TaskItem(title: 'Promotional LP', isCompleted: true),
];

class TaskItem {
  final String title;
  bool isCompleted;

  TaskItem({required this.title, required this.isCompleted});
}
