class Content {
  final String name;
  final String? imageUrl;

  final String? description;
  final String? location;
  final String? phone;
  final String? date;
  final String? meal;

  const Content({
    required this.name,
    this.imageUrl,
    this.description,
    this.location,
    this.phone,
    this.date,
    this.meal,

  });
}
