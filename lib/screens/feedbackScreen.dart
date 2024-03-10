import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
static const routeName = '/feedbackScreen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your Feedback',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _feedbackController,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Type your feedback here...',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement feedback submission logic
              submitFeedback(_feedbackController.text);
            },
            child: Text('Submit Feedback'),
          ),
        ],
      ),
    );
  }

  void submitFeedback(String feedback) {
    // TODO: Implement the logic to submit feedback (send to server, store locally, etc.)
    // For now, print the feedback to the console
    print('Feedback submitted: $feedback');
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Feedback Submitted'),
          content: Text('Thank you for your feedback!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
