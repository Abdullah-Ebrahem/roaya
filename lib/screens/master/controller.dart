import '../appointments/view.dart';
import '../my_appointment/view.dart';
import '../profile/view.dart';

class MasterController {
  var screens = const [MyAppointment(), AppointmentPage(), ProfilePage()];
  int currentIndex = 0;
}
