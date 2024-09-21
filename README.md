# SwiftUI Biometric Authentication: Face ID & Touch ID Integration

## 🚀 Project Overview

This project demonstrates how to implement **biometric authentication** (Face ID & Touch ID) in a **SwiftUI** application using **Apple's LocalAuthentication framework**. It's a step-by-step guide on how to secure your iOS app with **Face ID** and **Touch ID** to provide users with a seamless and secure authentication experience.

---

## 📹 Video Tutorial

Check out the full step-by-step video tutorial on YouTube:

[![Watch on YouTube](https://img.shields.io/badge/Watch%20on%20YouTube-FF0000?logo=youtube)](https://youtu.be/4YPi6mvJ4hE)

In this video, we walk through every line of code, making it easy for you to add biometric authentication to your SwiftUI app. Learn how to use **Face ID**, **Touch ID**, and **error handling** for a smooth user experience.

---

## 🛠 Features

- **Biometric Authentication**: Easily integrate **Face ID** or **Touch ID** for authenticating users.
- **Custom Error Handling**: Display user-friendly alerts when authentication fails.
- **Real-Time UI Updates**: Automatically update the app’s interface upon successful or failed authentication.

---

## 🧑‍💻 How It Works

1. **LAContext**: The app uses **LocalAuthentication** to check if **Face ID** or **Touch ID** is available on the device.
2. **Biometric Authentication**: If available, the user is prompted to authenticate using **Face ID** or **Touch ID**.
3. **Fallbacks**: If biometric authentication fails, an alert is shown with an error message.
4. **Success**: Upon successful authentication, the UI updates to show a welcome message.

---

## 🚨 Prerequisites

Before you can run this project, ensure that you have:

- **Xcode 14+** installed on your machine
- An iOS device or simulator with **Face ID** or **Touch ID** capabilities (or simulator setup for biometrics)
- A basic understanding of **SwiftUI** and **Swift** development

---

## 📂 Project Structure

- **`ContentView.swift`**: Contains the main logic for the biometric authentication, including handling success and error scenarios.
- **`LocalAuthentication`**: The framework used for handling biometric authentication.
- **`Alert`**: Custom SwiftUI alerts to show error messages to users.

---

## 🧩 How to Use

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/swiftui-biometric-authentication.git
    ```

2. Open the project in **Xcode**:
    ```bash
    cd swiftui-biometric-authentication
    open SwiftUIBiometricAuthentication.xcodeproj
    ```

3. Run the app on an iOS simulator or a real device that supports **Face ID** or **Touch ID**.

4. Authenticate using **Face ID** or **Touch ID** to see how the app responds to successful or failed authentication.

---

## 🔍 Code Breakdown

### `authenticate()` Function

```swift
private func authenticate() {
    let context = LAContext()
    var error: NSError?

    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        let reason = "Please authenticate to continue."
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
            DispatchQueue.main.async {
                if success {
                    self.isAuthorized = true
                } else {
                    self.isAuthorized = false
                    self.alertMessage = authenticationError?.localizedDescription ?? "Failed to authenticate"
                }
            }
        }
    } else {
        DispatchQueue.main.async {
            self.alertMessage = error?.localizedDescription ?? "Authentication not available"
        }
    }
}
```
This function uses LAContext to check if biometric authentication is available on the device. If available, the user is prompted to authenticate. On success, the app grants access to the user; on failure, an error message is shown.
---
## 🤔 FAQs
1. What happens if the device doesn’t support Face ID or Touch ID?
The app will show an alert stating that authentication is not available.

2. Can this be used on devices without biometric authentication?
You can modify the code to use passcode authentication as a fallback for devices that do not support biometric authentication.

3. Is this compatible with iOS versions below 13?
No, this project requires iOS 13+, as it leverages SwiftUI and the LocalAuthentication framework, which require newer iOS versions.
---
## 🙌 Contributions
Feel free to contribute to this project! You can fork this repository, create a new branch, and submit a pull request.

## 🔗 Useful Resources
[Apple’s LocalAuthentication Documentation](https://developer.apple.com/documentation/localauthentication)
[SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
---
##👋 Contact
If you have any questions or suggestions, feel free to reach out:

Website: [pouyasadri.com](https://pouyasadri.com)
Email: info@pouyasadri.com
