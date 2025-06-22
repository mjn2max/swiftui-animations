# SwiftUI-Animations 🎬✨

[![Swift](https://img.shields.io/badge/Swift-5.x_6.x-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.x_6.x-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS_macOS_watchOS_tvOS_visionOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS_macOS_watchOS_tvOS_visionOS-Green?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)

An open-source collection of smooth, customizable animations built entirely with SwiftUI.

Easily enhance your app’s user experience with engaging transitions, loaders, and effects, designed for flexibility and minimal setup.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Requirements](#requirements)
- [Usage](#usage)
- [Animation List](#animation-list)
- [Migration Guides](#migration-guides)
- [Communication](#communication)
- [Contributing](#contributing)
- [Open Radars](#open-radars)
- [FAQs](#faqs)
- [Credits](#credits)
- [Donations](#donations)
- [License](#license)

## Features

- **Prebuilt Animations:** A collection of ready-to-use animations like transitions, loaders, and effects.
- **Customizable:** Easily tweak animation parameters to match your app’s design.
- **Reusable Components:** Modular and reusable animation views and modifiers.
- **Cross-Platform Support:** Works seamlessly across iOS, macOS, watchOS, and tvOS.
- **100% SwiftUI:** Leverages the power of SwiftUI for smooth and declarative animations.

## Installation

### Swift Package Manager

To install using Swift Package Manager, add the following line to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/mjn2max/swiftui-animations.git", from: "1.0.0")
]
```

Then import in your source files:

```swift
import SwiftUI-Animations
```

### Manually Integration

- Download or clone the repository.
- Copy the `Sources` folder into your Xcode project.
- Use the extensions as you would any other Swift code.

## Requirements

| Platform    | Minimum Swift Version | Installation                                                         | Status           |
| ----------- | --------------------- | -------------------------------------------------------------------- | ---------------- |
| iOS 13.0+   | 5.7.1 / Xcode 14.1    | [Swift Package Manager](#swift-package-manager), [Manual](#manually) | Not Fully Tested |
| macOS 13.0+ | Latest Only           | [Swift Package Manager](#swift-package-manager)                      | Not Fully Tested |
| watchOS     | Latest Only           | [Swift Package Manager](#swift-package-manager)                      | Not Fully Tested |
| tvOS        | Latest Only           | [Swift Package Manager](#swift-package-manager)                      | Not Fully Tested |
| visionOS    | Latest Only           | [Swift Package Manager](#swift-package-manager)                      | Not Fully Tested |

## Usage

SwiftUI-Animations is designed for drop-in use with minimal configuration. Simply import the module and use the prebuilt animation components directly in your views:

**Example 1: Animated Loader**

```swift
import SwiftUI-Animations

struct ContentView: View {
    var body: some View {
        BouncingDotsLoader()
            .frame(width: 100, height: 20)
    }
}
```

**Example 2: Customizable Transition**

```swift
import SwiftUI-Animations

struct ContentView: View {
    @State private var showDetail = false

    var body: some View {
        VStack {
            if showDetail {
                DetailView()
                    .transition(.fadeAndSlide)
            }

            Button("Toggle") {
                withAnimation {
                    showDetail.toggle()
                }
            }
        }
    }
}
```

**Example 3: Reusable Animation Modifier**

```swift
import SwiftUI-Animations

struct ContentView: View {
    var body: some View {
        Text("Animated Text")
            .animatedScaleEffect()
    }
}
```

More examples can be found in the [Animation List](#animation-list).

## Animation List

Coming soon...

## Migration Guides

Coming soon...

## Communication

- **Bugs & Feature Requests:** Please [open an issue](https://github.com/mjn2max/swiftui-animations/issues) on GitHub.
- **Questions & Support:** Use the issue tracker for all questions, suggestions, and support requests.
- **Contact:** For all communication, please use the GitHub issue tracker to ensure transparency and faster responses.

## Contributing

Contributions are welcome! Please:

1. [Open an issue](https://github.com/mjn2max/swiftui-animations/issues) or discussion to propose changes or extensions.
2. Fork the [repo](https://github.com/mjn2max/swiftui-animations) and create your feature branch.
3. Add tests for new functionality.
4. Submit a pull request with a clear description.

All contributions must follow the [Code of Conduct](https://www.swift.org/code-of-conduct/).

## Open Radars

If you discover any Swift or Apple bugs that impact this project, please share the radar number and a brief description in this section to help other contributors stay informed.

## FAQs

**Q: Can I use only a subset of the extensions?**  
A: Yes! Just include the specific files you need.

**Q: Is this production ready?**  
A: Core extensions are stable, but some platforms are not fully tested. Use at your discretion and report any issues.

## Credits

Created and maintained by [mjn2max](https://github.com/mjn2max) and contributors. See the [Contributors](https://github.com/mjn2max/swiftui-animations/graphs/contributors) page for a full list.

## Donations

If you find this useful, you can sponsor this project via [GitHub Sponsors](https://github.com/sponsors/mjn2max) or [Buy Me a Coffee](https://buymeacoffee.com/mjn2max). Your support helps maintain and improve SwiftUI-Animations!

## License

This project is licensed under the MIT License. See [LICENSE](/LICENSE) for details.
