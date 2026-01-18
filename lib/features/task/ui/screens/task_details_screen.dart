import 'package:flutter/material.dart';
import 'package:cial/core/widget/search_bar.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchCtrl = TextEditingController();

  final List<Map<String, String>> tasks = [
    {"title": "Site inspection", "status": "Pending"},
    {"title": "Safety training", "status": "Completed"},
    {"title": "Material check", "status": "In Progress"},
  ];

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Material(
      color: const Color(0xFFF5F6FA),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomSearchBar(
              controller: _searchCtrl,
              hintText: "Search tasks...",
              onChanged: (_) {},
              onFilterTap: () {},
            ),

            const SizedBox(height: 16),

            ListView.separated(
              itemCount: tasks.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final task = tasks[index];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(task["title"]!),
                    subtitle: Text("Status: ${task["status"]}"),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
