class PropertyModel {
  String? locationn,
      area,
      type,
      paymentType,
      price,
      amenty,
      noOfRooms,
      noOfBaths,
      downPayment,
      installmentValue,
      description,
      userPhone,
      userEmail,
      waterFront, // corrected capitalization
      floors, // corrected capitalization
      view, // corrected capitalization
      conditions, // corrected capitalization
      grade, // corrected capitalization
      sqftAboveYrBuilt, // corrected capitalization and naming
      zipcode, // corrected capitalization
      lat, // corrected capitalization
      sqftLiving15, // corrected capitalization
      sqftLot15, // corrected capitalization
      sqftLiving, // corrected capitalization
      sqftLot, // corrected capitalization
      sqftAbov, // corrected capitalization
      yrBuild, // corrected capitalization
      long; // corrected capitalization

  PropertyModel({
    this.locationn,
    this.area,
    this.type,
    this.noOfRooms,
    this.noOfBaths,
    this.amenty,
    this.paymentType,
    this.price,
    this.downPayment,
    this.installmentValue,
    this.description,
    this.userPhone,
    this.userEmail,
    this.conditions,
    this.floors,
    this.grade,
    this.lat,
    this.sqftAboveYrBuilt,
    this.sqftLiving15,
    this.sqftLot15,
    this.view,
    this.waterFront,
    this.zipcode,
    this.long,
    this.sqftLot,
    this.sqftAbov,
    this.sqftLiving,
    this.yrBuild,
  });

  factory PropertyModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return PropertyModel();
    }
    return PropertyModel(
      locationn: map['Location'],
      area: map['area'],
      type: map['type'],
      price: map['price'],
      noOfRooms: map['number of rooms'],
      noOfBaths: map['number of baths'],
      amenty: map['Amenties'],
      paymentType: map['payment type'],
      downPayment: map['down payment'],
      installmentValue: map['installment value'],
      description: map['description'],
      userEmail: map['user email'],
      waterFront: map['waterFront'],
      floors: map['floors'],
      view: map['view'],
      conditions: map['conditions'],
      grade: map['grade'],
      sqftAboveYrBuilt: map['Sqft_aboveyr_built'],
      zipcode: map['zipcode'],
      lat: map['lat'],
      sqftLiving15: map['sqftLiving15'],
      sqftLot15: map['sqftLot15'],
      sqftLiving: map['sqftLiving'],
      sqftLot: map['sqftLot'],
      sqftAbov: map['sqftAbov'],
      yrBuild: map['yrBuild'],
      long: map['long'],
    );
  }
}
