class Booking {
  final String uid;
  Booking({this.uid});
}

class BookingData {
  final String uid;
  final String selectedBookingdate;
  final String selectedRoom;
  final String selectedTimeSlot;

  BookingData(
      {this.uid,
      this.selectedBookingdate,
      this.selectedRoom,
      this.selectedTimeSlot});
}
