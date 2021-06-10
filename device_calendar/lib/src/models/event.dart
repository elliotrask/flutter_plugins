part of device_calendar;

/// An event associated with a calendar
class Event {
  /// The unique identifier for this event
  late String? eventId;

  /// The identifier of the calendar that this event is associated with
  late String? calendarId;

  /// The title of this event
  late String? title;

  /// The description for this event
  late String? description;

  /// Indicates when the event starts
  late DateTime? start;

  /// Indicates when the event ends
  late DateTime? end;

  /// Indicates if this is an all-day event
  late bool allDay;

  /// The location of this event
  late String? location;

  /// A list of attendees for this event
  late List<Attendee>? attendees;

  /// Sets alarm to the start of the event
  /// Negative value indicates before the date
  late List<Duration>? alarms;

  Event(
    this.calendarId, {
    this.eventId,
    this.title,
    this.start,
    this.end,
    this.description,
    this.alarms,
  });

  Event.fromJson(Map<String, dynamic> json) {
    eventId = json['eventId'];
    calendarId = json['calendarId'];
    title = json['title'];
    description = json['description'];
    int? startMillisecondsSinceEpoch = json['start'];
    if (startMillisecondsSinceEpoch != null) {
      start =
          new DateTime.fromMillisecondsSinceEpoch(startMillisecondsSinceEpoch);
    }
    int? endMillisecondsSinceEpoch = json['end'];
    if (endMillisecondsSinceEpoch != null) {
      end = new DateTime.fromMillisecondsSinceEpoch(endMillisecondsSinceEpoch);
    }
    allDay = json['allDay'];
    location = json['location'];
    if (json['attendees'] != null) {
      attendees = json['attendees'].map<Attendee>((decodedAttendee) {
        return new Attendee.fromJson(decodedAttendee);
      }).toList();
    }
    if (json['alarms'] != null) {
      alarms = json['alarms'].map<Duration>((decodedAlarm) {
        return decodedAlarm != null ? Duration(seconds: decodedAlarm) : null;
      }).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventId'] = this.eventId;
    data['calendarId'] = this.calendarId;
    data['eventTitle'] = this.title;
    data['eventDescription'] = this.description;
    data['eventStartDate'] = this.start?.millisecondsSinceEpoch;
    data['eventEndDate'] = this.end?.millisecondsSinceEpoch;
    data['eventAllDay'] = this.allDay;
    data['eventLocation'] = this.location;
    if (attendees != null) {
      List<Map<String, dynamic>> attendeesJson = [];
      for (var attendee in attendees!) {
        var attendeeJson = attendee.toJson();
        attendeesJson.add(attendeeJson);
      }
      data['eventAttendees'] = attendeesJson;
    }
    if (alarms != null) {
      List<int> alarmsJson = [];
      for (var alarm in alarms!) {
        alarmsJson.add(alarm.inSeconds);
      }
      data['eventAlarms'] = alarmsJson;
    }
    return data;
  }
}
