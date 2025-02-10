import 'package:flutter/material.dart';

void main() {
  runApp(const VacationBookingApp());
}

class VacationBookingApp extends StatelessWidget {
  const VacationBookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vacation Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF8E8E8),
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

class Destination {
  final String name;
  final String description;
  final String imageAsset;
  final double price;
  final Color color;
  final List<String> highlights;
  final String currency;
  final double rating;
  final List<String> activities;
  final String bestTimeToVisit;

  Destination({
    required this.name,
    required this.description,
    required this.imageAsset,
    required this.price,
    required this.color,
    required this.highlights,
    this.currency = 'USD',
    required this.rating,
    required this.activities,
    required this.bestTimeToVisit,
  });
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Destination> destinations = [
    Destination(
      name: 'Hawaii',
      description:
          'Experience tropical paradise with pristine beaches and volcanic landscapes',
      imageAsset: 'assets/images/hawaii.jpg',
      price: 2499.99,
      color: const Color(0xFFFFE5E5),
      highlights: [
        'Visit Volcanoes National Park',
        'Relax on Waikiki Beach',
        'Learn to surf with professional instructors',
        'Experience traditional luau'
      ],
      rating: 4.8,
      activities: [
        'Snorkeling',
        'Hiking',
        'Surfing',
        'Volcano tours',
        'Cultural shows'
      ],
      bestTimeToVisit: 'April to October',
    ),
    Destination(
      name: 'Paris',
      description:
          'Discover the city of love with its iconic landmarks and rich culture',
      imageAsset: 'assets/images/paris.jpg',
      price: 1999.99,
      color: const Color(0xFFE5FFE5),
      highlights: [
        'Visit the Eiffel Tower',
        'Explore the Louvre Museum',
        'Walk along the Champs-Élysées',
        'Visit Notre-Dame Cathedral'
      ],
      currency: 'EUR',
      rating: 4.7,
      activities: [
        'Museum tours',
        'Wine tasting',
        'River Seine cruise',
        'Cooking classes',
        'Shopping'
      ],
      bestTimeToVisit: 'June to September',
    ),
    Destination(
      name: 'Bali',
      description: 'Explore spiritual temples and beautiful rice terraces',
      imageAsset: 'assets/images/bali.jpg',
      price: 1799.99,
      color: const Color(0xFFE5E5FF),
      highlights: [
        'Visit Tanah Lot Temple',
        'Explore Ubud Monkey Forest',
        'Relax in Nusa Dua',
        'Trek Mount Batur'
      ],
      currency: 'IDR',
      rating: 4.6,
      activities: [
        'Temple visits',
        'Yoga classes',
        'Spa treatments',
        'Cooking classes',
        'Beach activities'
      ],
      bestTimeToVisit: 'April to October',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dream Vacations',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: const Color(0xFFFFF0F0),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black87),
            onPressed: () {
              // Implement favorites functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          return DestinationCard(destination: destinations[index]);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.pink[200],
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      color: destination.color,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  destination.imageAsset,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.landscape, size: 50),
                          SizedBox(height: 8),
                          Text('Image not available',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        destination.rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      destination.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        // Implement favorite functionality
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  destination.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Highlights:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: destination.highlights.map((highlight) {
                    return Chip(
                      label: Text(highlight),
                      backgroundColor: Colors.white,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Text(
                  'Best Time to Visit: ${destination.bestTimeToVisit}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From ${destination.currency} ${destination.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const Text(
                          'per person',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              BookingPage(destination: destination),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC0CB),
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text('Book Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookingPage extends StatefulWidget {
  final Destination destination;

  const BookingPage({Key? key, required this.destination}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _datesController = TextEditingController();
  final _guestsController = TextEditingController();
  bool _acceptedTerms = false;
  String? _selectedActivity;
  bool _wantsInsurance = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _datesController.dispose();
    _guestsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book ${widget.destination.name}',
          style: const TextStyle(color: Colors.black87),
        ),
        backgroundColor: const Color(0xFFFFF0F0),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: widget.destination.color,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Booking Details',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Price: ${widget.destination.currency} ${widget.destination.price.toStringAsFixed(2)} per person',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Best time to visit: ${widget.destination.bestTimeToVisit}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your email';
                  }
                  if (!value!.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _datesController,
                decoration: InputDecoration(
                  labelText: 'Travel Dates',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.calendar_today),
                  hintText: 'MM/DD/YYYY - MM/DD/YYYY',
                ),
                onTap: () async {
                  // Add date range picker
                  DateTimeRange? dateRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (dateRange != null) {
                    setState(() {
                      _datesController.text =
                          '${dateRange.start.toString().split(' ')[0]} - ${dateRange.end.toString().split(' ')[0]}';
                    });
                  }
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your travel dates';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _guestsController,
                decoration: InputDecoration(
                  labelText: 'Number of Guests',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.people),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter number of guests';
                  }
                  final guests = int.tryParse(value!);
                  if (guests == null || guests < 1) {
                    return 'Please enter a valid number of guests';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Preferred Activity',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _selectedActivity,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        items: widget.destination.activities
                            .map((activity) => DropdownMenuItem(
                                  value: activity,
                                  child: Text(activity),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedActivity = value;
                          });
                        },
                        hint: const Text('Choose an activity'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Add Travel Insurance'),
                subtitle:
                    const Text('Protect your trip from unexpected events'),
                value: _wantsInsurance,
                onChanged: (bool value) {
                  setState(() {
                    _wantsInsurance = value;
                  });
                },
                activeColor: const Color(0xFFFFC0CB),
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: const Text('I accept the terms and conditions'),
                value: _acceptedTerms,
                onChanged: (bool? value) {
                  setState(() {
                    _acceptedTerms = value ?? false;
                  });
                },
                activeColor: const Color(0xFFFFC0CB),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _acceptedTerms
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          _showBookingConfirmation(context);
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC0CB),
                  foregroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  disabledBackgroundColor: Colors.grey[300],
                ),
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBookingConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Booking Confirmation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Destination: ${widget.destination.name}'),
              Text('Guest: ${_nameController.text}'),
              Text('Dates: ${_datesController.text}'),
              Text('Number of Guests: ${_guestsController.text}'),
              if (_selectedActivity != null)
                Text('Selected Activity: $_selectedActivity'),
              if (_wantsInsurance) const Text('Travel Insurance: Included'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Edit'),
            ),
            ElevatedButton(
              onPressed: () {
                // Here you would typically submit the booking to a backend
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Booking confirmed for ${_nameController.text}!'),
                    backgroundColor: const Color(0xFFFFC0CB),
                  ),
                );
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Return to home page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC0CB),
                foregroundColor: Colors.black87,
              ),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
