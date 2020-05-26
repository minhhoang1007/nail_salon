import 'dart:ffi';

class Salon {
  final int id;
  final String name;
  final String address;
  final String phone;
  final String image;

  Salon({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.image,
  });

  factory Salon.fromJson(Map<String, dynamic> json) {
    return Salon(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      image: json['image'],
    );
  }
}

class Sevice {
  final int id;
  final String name;
  final String description;
  final String image;
  final int price;

  Sevice({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
  });

  factory Sevice.fromJson(Map<String, dynamic> json) {
    return Sevice(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
    );
  }
}

class Step {
  final int id;
  final String step;
  final String image;
  Step({
    this.id,
    this.step,
    this.image,
  });
  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      id: json['id'],
      step: json['step'],
      image: json['image'],
    );
  }
}

class TimeBook {
  final int id;
  final String time;
  final bool status;
  TimeBook({
    this.id,
    this.time,
    this.status,
  });
  factory TimeBook.fromJson(Map<String, dynamic> json) {
    return TimeBook(
      id: json['id'],
      time: json['time'],
      status: json['status'],
    );
  }
}

class Stylist {
  final int id;
  final String name;
  final int rate;
  Stylist({
    this.id,
    this.name,
    this.rate,
  });
  factory Stylist.fromJson(Map<String, dynamic> json) {
    return Stylist(
      id: json['id'],
      name: json['name'],
      rate: json['rate'],
    );
  }
}
