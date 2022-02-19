import 'package:equatable/equatable.dart';

class OfferEntities extends Equatable {
  const OfferEntities({
    this.owner,
    this.acept,
    this.service,
    this.price,
    this.client,
    this.status,
    this.idService,
  });

  final String? owner;
  final bool? acept;
  final ServiceOffer? service;
  final String? price;
  final String? client;
  final String? idService;
  final bool? status;
  @override
  List<Object?> get props => [
        owner,
        acept,
        service,
        price,
        client,
        status,
        idService
      ];

}

class ServiceOffer extends Equatable {
  const ServiceOffer({
    this.date,
    this.imagesevice,
    this.uid,
    this.hour,
    this.city,
    this.description,
    this.id,
    this.category,
    this.dep,
  });

  final String? date;
  final List<String>? imagesevice;
  final String? uid;
  final String? hour;
  final String? city;
  final String? description;
  final String? id;
  final String? category;
  final String? dep;
  @override
  List<Object?> get props => [
        date,
        imagesevice,
        uid,
        hour,
        city,
        description,
        id,
        category,
        dep,
      ];
}
