import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadDocumentsCard extends StatefulWidget {
  const UploadDocumentsCard({super.key});

  @override
  State<UploadDocumentsCard> createState() => _UploadDocumentsCardState();
}

class _UploadDocumentsCardState extends State<UploadDocumentsCard> {
  String? idFileName;
  String? policeFileName;
  String? photoFileName;

  Future<void> _pickFile(Function(String) onSelected) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null && result.files.single.name.isNotEmpty) {
      onSelected(result.files.single.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upload Documents",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),

            UploadTile(
              title: "Upload ID Proof *",
              subtitle: idFileName ?? "PDF or Image (Max 5MB)",
              isUploaded: idFileName != null,
              onTap: () =>
                  _pickFile((name) => setState(() => idFileName = name)),
            ),
            const SizedBox(height: 12),

            UploadTile(
              title: "Upload Police Clearance Certificate *",
              subtitle: policeFileName ?? "PDF or Image (Max 5MB)",
              isUploaded: policeFileName != null,
              onTap: () =>
                  _pickFile((name) => setState(() => policeFileName = name)),
            ),
            const SizedBox(height: 12),

            UploadTile(
              title: "Upload Employee Photo *",
              subtitle: photoFileName ?? "PDF or Image (Max 5MB)",
              isUploaded: photoFileName != null,
              onTap: () =>
                  _pickFile((name) => setState(() => photoFileName = name)),
            ),
          ],
        ),
      ),
    );
  }
}

class UploadTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isUploaded;

  const UploadTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.isUploaded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isUploaded ? Colors.green : Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    Icon(
                      isUploaded ? Icons.insert_drive_file : Icons.info_outline,
                      size: 16,
                      color: isUploaded ? Colors.green : Colors.black54,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: isUploaded ? Colors.green : Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ElevatedButton.icon(
            onPressed: onTap,
            icon: const Icon(Icons.upload, size: 16),
            label: Text(isUploaded ? "Change" : "Upload"),
          ),
        ],
      ),
    );
  }
}
