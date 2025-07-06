class Member {
  Member({required this.name, required this.position, required this.profile});

  final String name;
  final String position;
  final String profile;
}

final List<Member> members = [
  Member(
    name: 'Adela Parkson',
    position: 'Creative Director',
    profile: 'assets/images/avatar_1.png',
  ),
  Member(
    name: 'Christian Mad',
    position: 'Product Designer',
    profile: 'assets/images/avatar_2.png',
  ),
  Member(
    name: 'Jason Statham',
    position: 'Junior Graphic Designer',
    profile: 'assets/images/avatar_3.png',
  ),
];
