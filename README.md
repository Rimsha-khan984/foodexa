# Foodexa 🛒

> A Flutter-based food and grocery shopping app that displays products from an API and provides a complete shopping flow, from browsing products to payment confirmation.

## About

**Foodexa** is a Flutter application developed to practice mobile app development, API integration, UI design, and navigation between multiple screens.

The app starts with a splash screen and navigates to the home page, where products are fetched from the DummyJSON API and displayed in a product grid. Users can select a product to view its details, proceed to the payment page, and review the order total, including tax and delivery charges.

After clicking the **Pay Now** button, users are navigated to a separate payment success screen that displays a confirmation message.

Foodexa is a learning project designed to demonstrate how a Flutter shopping application works, using real API product data and a simple checkout flow.

## Features

- **Splash Screen** — Displays the Foodexa branding before opening the home page.
- **API Integration** — Fetches product data from the DummyJSON API.
- **Product Listing** — Displays API products on the home page in a shopping-style layout.
- **Product Details** — Shows product information, including image, title, price, discount, rating, stock, and description.
- **Buy Now** — Navigates from the product details page to the payment page.
- **Payment Summary** — Calculates the order amount, tax, delivery charges, and final total.
- **Payment Success Screen** — Opens a separate screen displaying a payment success message.
- **Bottom Navigation** — Provides navigation between app sections.
- **Product Categories** — Allows users to browse products using category filters.
- **Favorites** — Includes a favorites feature for managing selected products.

## App Flow

The application follows this simple shopping flow:

1. **Splash Screen** — The app displays the Foodexa welcome screen.
2. **Home Page** — Products are fetched from the API and displayed to the user.
3. **Product Details Page** — Tapping a product card opens its detailed information.
4. **Payment Page** — Tapping **Buy Now** opens the checkout screen with the payment summary.
5. **Payment Success Page** — Tapping **Pay Now** navigates to a separate screen displaying the successful payment message.

## Application Structure

The following is an example of how the project can be organized:

```text
foodexa/
│
├── android/
├── assets/
│   └── images/
├── lib/
│   ├── main.dart
│   ├── splash/
│   ├── home/
│   ├── productdetail/
│   ├── payment/
│   └── paymentsuccess/
│
├── test/
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

*Note: The folder names above are an example. Adjust them to match the actual structure of your project.*

## Technologies Used

| Technology | Purpose |
|---|---|
| Flutter | Builds the mobile application UI |
| Dart | Programming language used for app development |
| DummyJSON API | Provides sample product data |
| HTTP | Sends API requests and retrieves product information |
| Material Design | Provides UI components and layouts |
| Google Fonts | Customizes typography |
| Android Studio | Development environment |
| Git and GitHub | Version control and source code hosting |

## API Integration

Foodexa uses the DummyJSON products API to retrieve product information.

**API endpoint:**

```text
https://dummyjson.com/products/category/groceries
```

The API provides product data that can be displayed in the application, such as:

- Product title
- Product image
- Price
- Discount percentage
- Rating
- Available stock
- Product description

The app reads this data and renders it dynamically on the home page and product details screen.

API documentation: [DummyJSON Products API](https://dummyjson.com/docs/products)

> **Note:** The API provides sample grocery products, not a dedicated fast-food or burger menu. The application uses this data for learning and demonstration purposes.

## Payment Calculation

The payment page calculates the final amount using the product price, quantity, tax, and delivery charges.

The calculation rules are:

- **Order Amount:** Product price × quantity
- **Tax:** 5% of the order amount
- **Delivery Charges:** Free for orders of $50 or more; otherwise, $1.50
- **Final Total:** Order amount + tax + delivery charges

### Example

Suppose a customer purchases products worth $40.

| Description | Amount |
|---|---:|
| Order Amount | $40.00 |
| Tax (5%) | $2.00 |
| Delivery Charges | $1.50 |
| **Final Total** | **$43.50** |

If the order amount reaches $50 or more, the delivery charge becomes free.

*The displayed currency and calculation rules should match the implementation in the app.*

## Getting Started

### Prerequisites

Before running Foodexa, make sure you have:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio)
- Flutter and Dart plugins installed in Android Studio
- An Android emulator or a connected Android device
- An active internet connection for API requests

Check your Flutter installation:

```bash
flutter doctor
```

### Clone the Repository

Replace the example repository URL below with your actual Foodexa GitHub repository URL if needed.

```bash
git clone https://github.com/Rimsha-khan984/foodexa.git
cd foodexa
```

### Install Dependencies

Run the following command from the project root directory:

```bash
flutter pub get
```

### Run the Application

Connect an Android device or start an emulator, then execute:

```bash
flutter devices
flutter run
```

Alternatively, open the `foodexa` project in Android Studio and run `main.dart`.

## How to Use Foodexa

1. Launch the application and view the splash screen.
2. Browse the available products on the home page.
3. Tap a product card to open its details.
4. Review the product price, discount, rating, stock, and description.
5. Tap **Buy Now** to open the payment page.
6. Review the order amount, tax, delivery charges, and final total.
7. Tap **Pay Now** to open the payment success screen.

## Learning Objectives

Foodexa demonstrates practical Flutter development concepts, including:

- Creating and navigating between multiple screens
- Designing layouts with Flutter widgets
- Fetching API data using HTTP requests
- Parsing JSON responses
- Displaying dynamic data in product cards
- Passing product data between screens
- Calculating checkout totals
- Creating a separate payment success screen
- Managing project dependencies
- Using Git and GitHub for version control

## Future Improvements

Possible future enhancements include:

- Integrating a dedicated food and burger menu API
- Implementing user authentication
- Adding a shopping cart with multiple products
- Saving favorites persistently
- Integrating a real payment gateway
- Adding order history and order tracking
- Improving error handling and loading states
- Adding search and advanced product filtering

## Important Note

Foodexa is an educational shopping application. The **Pay Now** action currently demonstrates a payment confirmation flow. Unless a payment gateway is integrated, the success screen does not represent a real financial transaction.

The products supplied by DummyJSON are sample data and are not actual purchasable inventory.

## Author

**Rimsha Khan**

- GitHub: [Rimsha-khan984](https://github.com/Rimsha-khan984)
- Project: [Foodexa Repository](https://github.com/Rimsha-khan984/foodexa)

## License

This project is intended for educational and learning purposes. Add a `LICENSE` file to the repository if you wish to distribute it under a specific open-source license.
