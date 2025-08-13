//
// GlowEffect.swift
// SwiftUI-Animations
//
// Created by Huy D. on 6/26/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// CodePassion.dev
//

import Foundation

import SwiftUI

extension View {
    /// A glowing animation effect that creates a pulsating aura around the view.
    ///
    /// - Parameters:
    ///   - color: The glow color.
    ///   - radius: The maximum blur radius.
    ///   - duration: The animation duration.
    /// - Returns: A view with a glowing effect using shadow and overlay animation.
    ///
    /// # Usage
    /// ```swift
    /// Text("Glowing")
    ///     .glowing(color: .blue, radius: 20, duration: 1.5)
    /// ```
    func glowing(color: Color = .blue, radius: CGFloat = 20, duration: Double = 1.5) -> some View {
        self
            .shadow(color: color.opacity(0.6), radius: radius)
            .overlay(
                self
                    .shadow(color: color.opacity(0.6), radius: radius)
                    .blur(radius: 0)
                    .scaleEffect(1.0)
                    .opacity(0.8)
                    .animation(
                        Animation.easeInOut(duration: duration)
                            .repeatForever(autoreverses: true),
                        value: UUID() // unique value to keep animating
                    )
            )
    }
}
