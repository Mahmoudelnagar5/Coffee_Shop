# Caffeine Corner

A Flutter-based mobile application for ordering and purchasing coffee drinks. Caffeine Corner provides a seamless user experience for browsing coffee menus, managing shopping carts, and completing secure payments. The app includes user authentication, categorized coffee listings, detailed product views, and an intuitive onboarding process.

## Features

- **User Authentication**: Secure login and registration using Firebase Authentication
- **Coffee Browsing**: Explore coffee drinks organized by categories
- **Product Details**: Detailed view of each coffee item with descriptions and options
- **Cart Management**: Add, remove, and modify items in the shopping cart
- **Secure Payments**: Integration with Stripe for credit card payments and PayPal support
- **Onboarding Screens**: Guided introduction for new users
- **Splash Screen**: Attractive app launch screen with animations

## Tech Stack

- **Framework**: Flutter
- **Programming Language**: Dart
- **State Management**: Bloc/Cubit pattern
- **Backend**: Firebase (Authentication)
- **Payment Gateway**: Stripe and PayPal
- **Architecture**: Clean Architecture
- **Additional Libraries**:
  - Dartz for functional programming
  - Dio for HTTP requests
  - Animate Do for animations
  - Flutter ScreenUtil for responsive design
  - Lottie for animations
  - Flutter SVG for SVG support

## Installation

1. **Prerequisites**:
   - Flutter SDK installed (version >=3.5.4)
   - Android Studio or Xcode for running on emulators/simulators
   - Dart SDK

2. **Clone the Repository**:
   ```
   git clone https://github.com/yourusername/caffeine_corner.git
   cd caffeine_corner
   ```

3. **Install Dependencies**:
   ```
   flutter pub get
   ```

4. **Run the App**:
   ```
   flutter run
   ```

## Setup Instructions

### Firebase Setup
1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Firebase Authentication
3. Download and place the `google-services.json` file in `android/app/`
4. Configure Firebase in your project according to the [Firebase Flutter documentation](https://firebase.google.com/docs/flutter/setup)

### Stripe Setup
1. Create a Stripe account at [Stripe Dashboard](https://dashboard.stripe.com/)
2. Obtain your Stripe publishable key and secret key
3. Add the publishable key to your app's configuration
4. Configure webhooks for payment processing (if needed)

### PayPal Setup
1. Sign up for PayPal developer account
2. Create an app in the [PayPal Developer Console](https://developer.paypal.com/)
3. Obtain client ID and configure the PayPal integration



(Note: Current assets include product images, icons, and illustrations. For app screenshots, run the app on a device or emulator to capture them.)

## Project Structure

The app follows Clean Architecture principles with features organized into modules:

- `lib/features/Auth/`: User authentication (login/register)
- `lib/features/cafe_home/`: Main coffee browsing and checkout
- `lib/features/cart/`: Shopping cart management
- `lib/features/on_boarding/`: User onboarding
- `lib/features/splash/`: App launch screen
- `lib/core/`: Shared utilities, widgets, and services

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support or questions, please email support@caffeinecorner.app or open an issue in this repository.
