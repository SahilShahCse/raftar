import 'package:flutter/material.dart';

void main() {
  runApp(TourismApp());
}

class TourismApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

// Login Screen
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _recoverPassword() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Recover Password'),
          content: Text('Password recovery instructions have been sent to your email.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _login() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            TextButton(
              onPressed: _recoverPassword,
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}

// Home Screen with Navigation
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourism App Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Tourism Details'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SizedBox()));
              },
            ),
            ListTile(
              title: Text('Bookings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TicketBookingScreen()));
              },
            ),
            ListTile(
              title: Text('Safety Features'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SafetyFeatureScreen()));
              },
            ),
            ListTile(
              title: Text('Budget Calculator'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BudgetCalculatorScreen()));
              },
            ),
            ListTile(
              title: Text('Feedback'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to the Tourism App!'),
      ),
    );
  }
}


// Ticket Booking Screen
class TicketBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Services'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Car Booking'),
            onTap: () {
              // Navigate to car booking screen
            },
          ),
          ListTile(
            title: Text('Bus Booking'),
            onTap: () {
              // Navigate to bus booking screen
            },
          ),
          ListTile(
            title: Text('Train Booking'),
            onTap: () {
              // Navigate to train booking screen
            },
          ),
          ListTile(
            title: Text('Flight Booking'),
            onTap: () {
              // Navigate to flight booking screen
            },
          ),
          ListTile(
            title: Text('Hotel Booking'),
            onTap: () {
              // Navigate to hotel booking screen
            },
          ),
        ],
      ),
    );
  }
}

// Safety Feature Screen
class SafetyFeatureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety Features'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Emergency Contact Numbers'),
            onTap: () {
              // Emergency contact feature
            },
          ),
          ListTile(
            title: Text('Share Live Location'),
            onTap: () {
              // Live location sharing feature
            },
          ),
          ListTile(
            title: Text('Nearby Hospitals & Police Stations'),
            onTap: () {
              // Nearby hospitals and safety places
            },
          ),
        ],
      ),
    );
  }
}

// Budget Calculator Screen
class BudgetCalculatorScreen extends StatefulWidget {
  @override
  _BudgetCalculatorScreenState createState() => _BudgetCalculatorScreenState();
}

class _BudgetCalculatorScreenState extends State<BudgetCalculatorScreen> {
  double transport = 0, hotel = 0, food = 0, total = 0;

  void calculateTotal() {
    setState(() {
      total = transport + hotel + food;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Transport Cost'),
              onChanged: (value) {
                transport = double.parse(value);
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Hotel Cost'),
              onChanged: (value) {
                hotel = double.parse(value);
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Food Cost'),
              onChanged: (value) {
                food = double.parse(value);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateTotal,
              child: Text('Calculate Total'),
            ),
            SizedBox(height: 20),
            Text('Total Budget: \$${total.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

// Feedback Screen
class FeedbackScreen extends StatelessWidget {
  final _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _feedbackController,
              decoration: InputDecoration(
                labelText: 'Your Feedback',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Send feedback logic
              },
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
