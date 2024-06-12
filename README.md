# FPS Counter

This project is a simple SwiftUI application that monitors and displays the frames per second (FPS) of the app. It shows the current FPS, the maximum, minimum, average FPS, and the standard deviation of the FPS over time.

## Features

- Real-time FPS monitoring
- Displays the current FPS
- Displays the maximum, minimum, and average FPS
- Displays the standard deviation of the FPS

## Requirements

- Xcode 12.0 or later
- iOS 14.0 or later

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/FPSCounter.git
    ```

2. Open the project in Xcode:

    ```bash
    cd FPSCounter
    open FPSCounter.xcodeproj
    ```

3. Build and run the project on your device or simulator.

## Usage

Once the app is running, it will display the current FPS, maximum FPS, minimum FPS, average FPS, and standard deviation of the FPS in a simple interface.

## Code Overview

### FPSCounter.swift

This file contains the `FPSCounter` class which is responsible for monitoring the FPS using `CADisplayLink`. It calculates and publishes the current FPS, maximum FPS, minimum FPS, average FPS, and standard deviation.

### ContentView.swift

This file contains the `ContentView` struct, which is the main entry point of the SwiftUI view hierarchy. It creates an instance of `FPSCounterView`.

### FPSCounterView.swift

This file contains the `FPSCounterView` struct, which is a SwiftUI view that displays the FPS information.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any bug fixes or new features.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
