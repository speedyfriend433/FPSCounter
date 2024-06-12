import SwiftUI

struct FPSCounterView: View {
    @StateObject private var fpsCounter = FPSCounter()

    var body: some View {
        VStack {
            Text("FPS: \(fpsCounter.fps)")
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(10)

            HStack {
                Text("Max: \(fpsCounter.maxFPS)")
                Spacer()
                Text("Min: \(fpsCounter.minFPS)")
                Spacer()
                Text("Avg: \(fpsCounter.avgFPS)")
                Spacer()
                Text("Std Dev: \(String(format: "%.2f", fpsCounter.stdDev))")
            }
            .padding()
            .background(Color.gray.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
