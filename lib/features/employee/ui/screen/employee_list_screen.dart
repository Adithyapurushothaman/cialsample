// import 'package:cial/features/employee/data/employee_data.dart';
// import 'package:cial/features/employee/ui/widget/employee_card.dart';
// import 'package:cial/features/employee/ui/widget/search_bar.dart';
// import 'package:flutter/material.dart';

// class EmployeeDetailsScreen extends StatelessWidget {
//   EmployeeDetailsScreen({super.key});

// final List<Employee> employees = [
//   Employee(
//     id: "EMP001",
//     name: "Rajesh Kumar",
//     role: "Labour",
//     aadhaar: "****-****-1234",
//     clearance: "Pending",
//     status: "pending",
//   ),
//   Employee(
//     id: "EMP002",
//     name: "Haridas Sharma",
//     role: "Labour",
//     aadhaar: "****-****-5678",
//     clearance: "Valid",
//     status: "approved",
//   ),
//   Employee(
//     id: "EMP003",
//     name: "John Doe",
//     role: "Labour",
//     aadhaar: "****-****-9012",
//     clearance: "Valid",
//     status: "approved",
//   ),
//   Employee(
//     id: "EMP004",
//     name: "Michael V",
//     role: "Labour",
//     aadhaar: "****-****-3456",
//     clearance: "Valid",
//     status: "sent_back",
//   ),
//   Employee(
//     id: "EMP005",
//     name: "Ramesh P",
//     role: "Labour",
//     aadhaar: "****-****-7890",
//     clearance: "Pending",
//     status: "pending",
//   ),
//   Employee(
//     id: "EMP006",
//     name: "George Joseph",
//     role: "Labour",
//     aadhaar: "****-****-2345",
//     clearance: "Pending",
//     status: "forwarded",
//   ),
//   Employee(
//     id: "EMP007",
//     name: "Bimal Raj",
//     role: "Labour",
//     aadhaar: "****-****-6485",
//     clearance: "Rejected",
//     status: "rejected",
//   ),
// ];

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Employees",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(height: 4),
//           const Text(
//             "View and manage labourers",
//             style: TextStyle(color: Colors.grey),
//           ),

//           const SizedBox(height: 16),

//           EmployeeSearchBar(
//             onChanged: (value) {
//               // TODO: search logic
//             },
//             onFilterTap: () {
//               // TODO: filter logic
//             },
//           ),

//           const SizedBox(height: 16),

//           ListView.separated(
//             itemCount: employees.length,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             separatorBuilder: (_, __) => const SizedBox(height: 12),
//             itemBuilder: (context, index) {
//               return EmployeeCard(
//                 employee: employees[index],
//                 onView: () {},
//                 onEdit: () {},
//               );
//             },
//           ),

//           const SizedBox(height: 16),

//           const Center(
//             child: Text(
//               "Showing 7 of 24 employees",
//               style: TextStyle(color: Colors.grey),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:cial/features/employee/data/employee_data.dart';
import 'package:cial/features/employee/ui/widget/employee_card.dart';
import 'package:cial/features/employee/ui/widget/search_bar.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  const EmployeeDetailsScreen({super.key});

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchCtrl = TextEditingController();

  final List<Employee> employees = [
    Employee(
      id: "EMP001",
      name: "Rajesh Kumar",
      role: "Labour",
      aadhaar: "****-****-1234",
      clearance: "Pending",
      status: "pending",
    ),
    Employee(
      id: "EMP002",
      name: "Haridas Sharma",
      role: "Labour",
      aadhaar: "****-****-5678",
      clearance: "Valid",
      status: "approved",
    ),
    Employee(
      id: "EMP003",
      name: "John Doe",
      role: "Labour",
      aadhaar: "****-****-9012",
      clearance: "Valid",
      status: "approved",
    ),
    Employee(
      id: "EMP004",
      name: "Michael V",
      role: "Labour",
      aadhaar: "****-****-3456",
      clearance: "Valid",
      status: "sent_back",
    ),
    Employee(
      id: "EMP005",
      name: "Ramesh P",
      role: "Labour",
      aadhaar: "****-****-7890",
      clearance: "Pending",
      status: "pending",
    ),
    Employee(
      id: "EMP006",
      name: "George Joseph",
      role: "Labour",
      aadhaar: "****-****-2345",
      clearance: "Pending",
      status: "forwarded",
    ),
    Employee(
      id: "EMP007",
      name: "Bimal Raj",
      role: "Labour",
      aadhaar: "****-****-6485",
      clearance: "Rejected",
      status: "rejected",
    ),
  ];

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // ✅ THIS IS THE FIX
      color: const Color(0xFFF5F6FA),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmployeeSearchBar(
                onChanged: (_) {},
                onFilterTap: () {},
                controller: _searchCtrl,
              ),

              const SizedBox(height: 16),

              ListView.separated(
                itemCount: employees.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return EmployeeCard(
                    employee: employees[index],
                    onView: () {},
                    onEdit: () {},
                  );
                },
              ),

              const SizedBox(height: 16),

              const Center(
                child: Text(
                  "Showing 7 of 24 employees",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
