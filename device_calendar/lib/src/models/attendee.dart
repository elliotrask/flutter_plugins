part of device_calendar;

/// A person attending an event
class Attendee {
  /// The name of the attendee
  late String name;

  Attendee(this.name);

  Attendee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
