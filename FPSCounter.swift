import Foundation
import Combine
import QuartzCore

class FPSCounter: ObservableObject {
    @Published var fps: Int = 0
    @Published var maxFPS: Int = 0
    @Published var minFPS: Int = Int.max
    @Published var avgFPS: Int = 0
    @Published var stdDev: Double = 0

    private var displayLink: CADisplayLink?
    private var lastUpdate: CFTimeInterval = 0
    private var frameCount: Int = 0
    private var totalFrames: Int = 0
    private var totalTime: CFTimeInterval = 0
    private var fpsHistory: [Int] = []

    init() {
        start()
    }

    private func start() {
        displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink?.add(to: .main, forMode: .default)
    }

    @objc private func update(displayLink: CADisplayLink) {
        if lastUpdate == 0 {
            lastUpdate = displayLink.timestamp
            return
        }

        frameCount += 1
        totalFrames += 1
        let elapsed = displayLink.timestamp - lastUpdate

        if elapsed >= 1 {
            fps = frameCount
            fpsHistory.append(fps)
            if fpsHistory.count > 60 {
                fpsHistory.removeFirst()
            }
            maxFPS = max(maxFPS, fps)
            minFPS = min(minFPS, fps)
            totalTime += elapsed
            avgFPS = totalFrames / Int(totalTime)
            stdDev = calculateStdDev()

            frameCount = 0
            lastUpdate = displayLink.timestamp
        }
    }

    private func calculateStdDev() -> Double {
    let mean = Double(fpsHistory.reduce(0, +)) / Double(fpsHistory.count)
    let variance = fpsHistory.map { pow(Double($0) - mean, 2) }.reduce(0, +) / Double(fpsHistory.count)
    return sqrt(variance)
}

    deinit {
        displayLink?.invalidate()
    }
}
