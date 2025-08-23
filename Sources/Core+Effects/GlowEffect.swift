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


    /// A more subtle glowing animation using lower opacity and a smaller radius.
    ///
    /// - Parameters:
    ///   - color: The glow color.
    ///   - radius: The blur radius for the subtle glow.
    ///   - duration: The animation duration.
    /// - Returns: A view with a soft glowing effect.
    ///
    /// # Usage
    /// ```swift
    /// Text("Soft Glow")
    ///     .softGlow(color: .green, radius: 10, duration: 2.0)
    /// ```
    func softGlow(color: Color = .green, radius: CGFloat = 10, duration: Double = 2.0) -> some View {
        self
            .shadow(color: color.opacity(0.3), radius: radius)
            .overlay(
                self
                    .shadow(color: color.opacity(0.3), radius: radius)
                    .opacity(0.7)
                    .animation(
                        Animation.easeInOut(duration: duration)
                            .repeatForever(autoreverses: true),
                        value: UUID()
                    )
            )
    }


    /// A glowing border effect that pulses around a rounded rectangle shape overlaying the view.
    /// This effect works well for rounded rectangles or container views where a rounded rectangle border is desired.
    ///
    /// - Parameters:
    ///   - color: The border glow color.
    ///   - lineWidth: The width of the glowing stroke.
    ///   - duration: The animation duration.
    /// - Returns: A view with an animated glowing rounded rectangle border.
    ///
    /// # Usage
    /// ```swift
    /// RoundedRectangle(cornerRadius: 12)
    ///     .strokeBorder(Color.red, lineWidth: 2)
    ///     .glowingBorder(color: .red, lineWidth: 3, duration: 1.5)
    /// ```
    func glowingBorder(color: Color = .red, lineWidth: CGFloat = 3, duration: Double = 1.5) -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(color, lineWidth: lineWidth)
                    .shadow(color: color.opacity(0.7), radius: lineWidth)
                    .opacity(0.8)
                    .animation(
                        Animation.easeInOut(duration: duration)
                            .repeatForever(autoreverses: true),
                        value: UUID()
                    )
            )
    }


    /// A neon-like glow effect that simulates a bright neon light around the view.
    ///
    /// - Parameters:
    ///   - color: The neon glow color.
    ///   - radius: The maximum blur radius for the neon glow.
    ///   - duration: The animation duration.
    /// - Returns: A view with a vibrant neon glowing effect.
    ///
    /// # Usage
    /// ```swift
    /// Text("Neon")
    ///     .neonGlow(color: .pink, radius: 25, duration: 1.0)
    /// ```
    func neonGlow(color: Color = .pink, radius: CGFloat = 25, duration: Double = 1.0) -> some View {
        self
            .shadow(color: color.opacity(0.8), radius: radius)
            .overlay(
                self
                    .shadow(color: color.opacity(0.8), radius: radius / 2)
                    .blur(radius: radius / 4)
                    .opacity(0.9)
                    .animation(
                        Animation.easeInOut(duration: duration)
                            .repeatForever(autoreverses: true),
                        value: UUID()
                    )
            )
    }


    /// A rainbow glowing effect that cycles through multiple colors.
    ///
    /// - Parameters:
    ///   - radius: The glow radius.
    ///   - duration: The cycle duration for the color changes.
    /// - Returns: A view with a continuously cycling rainbow glow.
    ///
    /// # Usage
    /// ```swift
    /// Text("Rainbow Glow")
    ///     .rainbowGlow(radius: 20, duration: 3.0)
    /// ```
    func rainbowGlow(radius: CGFloat = 20, duration: Double = 3.0) -> some View {
        let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
        return self
            .shadow(color: .red.opacity(0.6), radius: radius)
            .overlay(
                LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask(self)
                    .shadow(color: .red, radius: radius)
                    .animation(
                        Animation.linear(duration: duration)
                            .repeatForever(autoreverses: true),
                        value: UUID()
                    )
            )
    }
}
