//
// PulseEffect.swift
// SwiftUI-Animations
//
// Created by Huy D. on 6/26/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// CodePassion.dev
//

import SwiftUI

extension View {
    /// A simple pulsing scale effect.
    ///
    /// - Parameters:
    ///   - scale: Maximum scale factor during pulse.
    ///   - duration: Duration of each pulse cycle.
    /// - Returns: A view with a scale-based pulsing animation.
    ///
    /// # Usage
    /// ```swift
    /// Circle()
    ///     .fill(Color.green)
    ///     .pulseScale(scale: 1.2, duration: 1.0)
    /// ```
    func pulseScale(scale: CGFloat = 1.2, duration: Double = 1.0) -> some View {
        self
            .scaleEffect(scale)
            .animation(
                Animation.easeInOut(duration: duration)
                    .repeatForever(autoreverses: true),
                value: UUID()
            )
    }


    /// A pulsing opacity effect that fades in and out.
    ///
    /// - Parameter duration: Duration of fade cycle.
    /// - Returns: A view with a fading pulse animation.
    ///
    /// # Usage
    /// ```swift
    /// Text("Loading")
    ///     .pulseOpacity(duration: 1.5)
    /// ```
    func pulseOpacity(duration: Double = 1.5) -> some View {
        self
            .opacity(0.5)
            .animation(
                Animation.easeInOut(duration: duration)
                    .repeatForever(autoreverses: true),
                value: UUID()
            )
    }


    /// A pulsing border effect using overlay.
    ///
    /// - Parameters:
    ///   - color: The color of the border pulse.
    ///   - lineWidth: The maximum border width.
    ///   - duration: Duration of pulse cycle.
    /// - Returns: A view with a glowing pulsing border.
    ///
    /// # Usage
    /// ```swift
    /// RoundedRectangle(cornerRadius: 12)
    ///     .fill(Color.clear)
    ///     .frame(width: 120, height: 60)
    ///     .pulseBorder(color: .blue, lineWidth: 6, duration: 1.2)
    /// ```
    func pulseBorder(color: Color = .blue, lineWidth: CGFloat = 6, duration: Double = 1.2) -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(color, lineWidth: lineWidth)
                    .scaleEffect(1.1)
                    .opacity(0.5)
                    .animation(
                        Animation.easeInOut(duration: duration)
                            .repeatForever(autoreverses: true),
                        value: UUID()
                    )
            )
    }
}
