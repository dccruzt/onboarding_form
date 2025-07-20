# Pet Onboarding App

A Flutter application that guides users through a multi-step onboarding process to register their pet's details. The flow is implemented using Cubit (from `flutter_bloc`) for state management and follows a form wizard approach with validation at each step.

## 🧩 Steps in the Onboarding Flow

The onboarding consists of the following steps:

1. **Select Breed**: User selects a pet breed from a dropdown menu.
2. **Enter Name**: User inputs the pet's name.
3. **Provide Details**: User adds additional details like address.
4. **Select Birthday**: User selects the pet's date of birth.
5. **Enter Weight**: User inputs the pet's weight.

Navigation between steps is controlled programmatically via a `PageView` and a `submit` button that advances the flow after validations.

## ✨ Features

- **Multi-step Form Onboarding**: A guided form flow to collect pet-related data step by step.
- **Automatic Location Retrieval**: On the final step, the user's current location is fetched automatically.
- **Form Validation**: Each step validates user input and enables submission only when valid.

## 🧪 Testing

Includes widget tests that simulate user interactions and also unit test for the cubit.

## 🛠 Tech Stack

- **Flutter**: 3.32.4
- **Dart**: 3.8.1
- **State Management**: `flutter_bloc`

## 🚀 Setup & Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/dccruzt/onboarding_form.git
   cd onboarding_form
