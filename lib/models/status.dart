class StatusView {
  String name;
  String statusDate;


  StatusView({
    required this.name,
    required this.statusDate,
  });
}

var statusList = [
  StatusView(
      name: 'Budi',
      statusDate: 'Now, 20:00 PM'),
  StatusView(
      name: 'Rosa',
      statusDate: 'Now, 22:00 PM'),
  StatusView(
      name: 'Johan',
      statusDate: 'Now, 21:00 PM'),  
];