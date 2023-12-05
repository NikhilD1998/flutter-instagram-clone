# InstaMirror

InstaMirror is a Flutter app that serves as a clone of Instagram. Users can register through email, post images, like, comment, follow, and unfollow each other. The app uses Firebase as its backend for seamless and scalable data management.

## Features

- **User Registration:** Users can create accounts using their email IDs to access the full functionality of the app.

- **Image Sharing:** Share your moments by uploading images directly from your device's gallery using the [Image Picker](https://pub.dev/packages/image_picker) package.

- **Social Interactions:**
  - **Likes:** Users can like images to show appreciation.
  - **Comments:** Engage in conversations by commenting on images.
  - **Follow/Unfollow:** Build your network by following other users and stay updated on their posts.

## Technologies Used

- **Firebase:**
  - [firebase_core](https://pub.dev/packages/firebase_core): Firebase core for Flutter.
  - [cloud_firestore](https://pub.dev/packages/cloud_firestore): Firestore for real-time database.
  - [firebase_auth](https://pub.dev/packages/firebase_auth): Firebase authentication for user management.
  - [firebase_storage](https://pub.dev/packages/firebase_storage): Firebase storage for image storage.

- **UI/UX:**
  - [flutter_svg](https://pub.dev/packages/flutter_svg): SVG support for Flutter.
  - [flutter_staggered_grid_view](https://pub.dev/packages/flutter_staggered_grid_view): Staggered grid view for an aesthetically pleasing layout.

- **State Management:**
  - [provider](https://pub.dev/packages/provider): Provider for state management.

- **Other Utilities:**
  - [uuid](https://pub.dev/packages/uuid): Generates unique identifiers.
  - [intl](https://pub.dev/packages/intl): Internationalization and localization support.
  - [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons): Customize app icons for different platforms.
