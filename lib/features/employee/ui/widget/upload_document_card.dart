import 'package:flutter/material.dart';

class UploadDocumentsCard extends StatelessWidget {
  // Optional callbacks for each upload
  final VoidCallback? onUploadId;
  final VoidCallback? onUploadPoliceClearance;
  final VoidCallback? onUploadPhoto;

  const UploadDocumentsCard({
    super.key,
    this.onUploadId,
    this.onUploadPoliceClearance,
    this.onUploadPhoto,
  });

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

            // ID Proof
            UploadTile(
              title: "Upload ID Proof *",
              subtitle: "PDF or Image (Max 5MB)",
              onTap: onUploadId,
            ),
            const SizedBox(height: 12),

            // Police Clearance
            UploadTile(
              title: "Upload Police Clearance Certificate *",
              subtitle: "PDF or Image (Max 5MB)",
              onTap: onUploadPoliceClearance,
            ),
            const SizedBox(height: 12),

            // Employee Photo
            UploadTile(
              title: "Upload Employee Photo *",
              subtitle: "PDF or Image (Max 5MB)",
              onTap: onUploadPhoto,
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
  final VoidCallback? onTap;

  const UploadTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),

          // Upload Button
          ElevatedButton.icon(
            onPressed: onTap ?? () {},
            icon: const Icon(Icons.upload, size: 16),
            label: const Text("Upload"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          ),
        ],
      ),
    );
  }
}
