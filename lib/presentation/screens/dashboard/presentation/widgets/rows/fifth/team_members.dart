import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizon/config/theme/app_colors.dart';
import 'package:horizon/config/theme/text_styles.dart';
import 'package:horizon/presentation/screens/dashboard/data/models/member.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/dashboard_cards.dart';

class TeamMembers extends StatelessWidget {
  const TeamMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return LargeCard(
      child: Column(
        spacing: 12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Team members',style: bold.copyWith(fontSize: 18),),
              CustomCard(child: Icon(CupertinoIcons.plus_circle_fill)),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  MemberTile(member: members[index]),
              itemCount: members.length,
            ),
          ),
        ],
      ),
    );
  }
}

class MemberTile extends StatelessWidget {
  const MemberTile({super.key, required this.member});

  final Member member;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 23,
            backgroundImage: AssetImage(member.profile),
            backgroundColor: Colors.grey[300], // Fallback color
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  member.name,
                  style: bold.copyWith(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  member.position,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: medium.copyWith(color: cardText, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.more_vert,
            color: cardText,
            size: 20,
          ),
        ],
      ),
    );
  }
}