```
# Flutter Firebase Simple CRUD

This project demonstrates a simple CRUD (Create, Read, Update, Delete) application using Flutter and Firebase. The project is designed to help developers understand the integration of Firebase with Flutter for basic CRUD operations.

## Features

- **Add Data:** Users can add data to the Firebase Firestore database.
- **Read Data:** Data from Firebase Firestore is displayed in real-time.
- **Update Data:** Existing data can be updated.
- **Delete Data:** Data can be deleted from Firebase Firestore.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Firebase CLI](https://firebase.google.com/docs/cli#install_the_firebase_cli)
- A Firebase project set up on the [Firebase Console](https://console.firebase.google.com/)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/PavanEdirisingha2000/flutter-firebase-simple-crud.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd flutter-firebase-simple-crud
   ```

3. **Install the required dependencies:**

   ```bash
   flutter pub get
   ```

4. **Set up Firebase in your Flutter project:**

   - Follow the instructions to add your Firebase configuration files (`google-services.json` for Android and `GoogleService-Info.plist` for iOS) to the project.
   - Ensure Firebase Firestore is enabled in your Firebase Console.

5. **Run the project:**

   ```bash
   flutter run
   ```

Folder Structure
Here's a brief overview of the folder structure of this project
```
lib/
├── main.dart          # Entry point of the application
├── services/          # Firebase CRUD operations
└── pages/             # UI pages for displaying and interacting with data
```



### Firebase Setup

Ensure you've set up Firebase Firestore in your Firebase project. You will need to configure the rules in Firestore to allow read and write operations during development. Here's an example rule:

```plaintext
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

### Usage

1. **Add Data:** Navigate to the "Add Data" page.
2. **View Data:** View the list of data in real-time on the home page.
3. **Update/Delete Data:** Select an item from the list to update or delete it.

### Contributing

If you'd like to contribute to this project, please fork the repository and create a pull request. Contributions are welcome!

### License

This project is licensed under the MIT License. See the LICENSE file for more details.

### Acknowledgements

- Flutter documentation: [https://flutter.dev/docs](https://flutter.dev/docs)
- Firebase documentation: [https://firebase.google.com/docs](https://firebase.google.com/docs)
```

