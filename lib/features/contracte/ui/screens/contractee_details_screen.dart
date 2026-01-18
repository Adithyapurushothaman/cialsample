import 'package:cial/core/widget/search_bar.dart';
import 'package:cial/features/contracte/data/contractee.dart';
import 'package:cial/features/contracte/ui/widget/contrcatee_card.dart';
import 'package:flutter/material.dart';

class ContracteeDetailsScreen extends StatefulWidget {
  const ContracteeDetailsScreen({super.key});

  @override
  State<ContracteeDetailsScreen> createState() =>
      _ContracteeDetailsScreenState();
}

class _ContracteeDetailsScreenState extends State<ContracteeDetailsScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchCtrl = TextEditingController();

  final List<Contractee> contractees = [
    Contractee(
      id: "CON001",
      name: "ABC Constructions Pvt Ltd",
      validTill: "31 Dec 2026",
      projectCount: 5,
      status: "active",
    ),
    Contractee(
      id: "CON002",
      name: "XYZ Infrastructure",
      validTill: "15 Aug 2025",
      projectCount: 2,
      status: "pending",
    ),
    Contractee(
      id: "CON003",
      name: "Metro Builders",
      validTill: "01 Jan 2024",
      projectCount: 0,
      status: "expired",
    ),
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
              hintText: "Search contractees...",
              onChanged: (_) {},
              onFilterTap: () {},
            ),

            const SizedBox(height: 16),

            ListView.separated(
              itemCount: contractees.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return ContracteeCard(
                  contractee: contractees[index],
                  onView: () {
                    // later → navigate to contractee detail page
                  },
                );
              },
            ),

            const SizedBox(height: 16),

            Center(
              child: Text(
                "Showing ${contractees.length} contractees",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
