//
// BounceAnimations.swift
// SwiftUI-Animations
//
// Created by Huy D. on 6/26/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// CodePassion.dev
//

import SwiftUI

// MARK: - Bounce Animations

public extension View {
    /// Applies a bounce scale effect using a spring animation.
    ///
    /// - Parameters:
    ///   - scale: The peak scale reached during the bounce. Defaults to `1.1`.
    ///   - duration: The approximate duration of the bounce in seconds. Defaults to `0.45`.
    ///   - damping: The damping fraction for the spring. Lower values bounce more. Defaults to `0.6`.
    ///   - blendDuration: The blend duration for the spring. Defaults to `0.0`.
    /// - Returns: A view that briefly scales up to `scale` and settles back to `1.0`.
    ///
    /// # Usage
    /// ```swift
    /// Text("Tap me")
    ///     .bounce(scale: 1.1, duration: 0.45, damping: 0.6, blendDuration: 0)
    /// ```
    func bounce(
        scale: CGFloat = 1.1,
        duration: CGFloat = 0.45,
        damping: CGFloat = 0.6,
        blendDuration: CGFloat = 0
    ) -> some View {
        modifier(BounceModifier(
            trigger: .constant(UUID()),
            peakScale: scale,
            duration: duration,
            damping: damping,
            blendDuration: blendDuration
        ))
    }

    /// Triggers a bounce when the view appears.
    ///
    /// - Parameters:
    ///   - scale: The peak scale reached during the bounce. Defaults to `1.1`.
    ///   - duration: The approximate duration of the bounce in seconds. Defaults to `0.45`.
    ///   - damping: The damping fraction for the spring. Lower values bounce more. Defaults to `0.6`.
    ///   - blendDuration: The blend duration for the spring. Defaults to `0.0`.
    /// - Returns: A view that bounces on first appearance.
    ///
    /// # Usage
    /// ```swift
    /// Text("Hello")
    ///     .bounceOnAppear(scale: 1.1, duration: 0.45, damping: 0.6, blendDuration: 0)
    /// ```
    func bounceOnAppear(
        scale: CGFloat = 1.1,
        duration: CGFloat = 0.45,
        damping: CGFloat = 0.6,
        blendDuration: CGFloat = 0
    ) -> some View {
        modifier(BounceOnAppearModifier(
            peakScale: scale,
            duration: duration,
            damping: damping,
            blendDuration: blendDuration
        ))
    }

    /// Triggers a bounce when the view is tapped (and via the default accessibility action).
    ///
    /// - Parameters:
    ///   - scale: The peak scale reached during the bounce. Defaults to `1.1`.
    ///   - duration: The approximate duration of the bounce in seconds. Defaults to `0.45`.
    ///   - damping: The damping fraction for the spring. Lower values bounce more. Defaults to `0.6`.
    ///   - blendDuration: The blend duration for the spring. Defaults to `0.0`.
    /// - Returns: A view that bounces in response to taps and accessibility activation.
    ///
    /// # Usage
    /// ```swift
    /// Text("Tap me")
    ///     .bounceOnTap(scale: 1.1, duration: 0.45, damping: 0.6, blendDuration: 0)
    /// ```
    func bounceOnTap(
        scale: CGFloat = 1.1,
        duration: CGFloat = 0.45,
        damping: CGFloat = 0.6,
        blendDuration: CGFloat = 0
    ) -> some View {
        modifier(BounceOnTapModifier(
            peakScale: scale,
            duration: duration,
            damping: damping,
            blendDuration: blendDuration
        ))
    }
}

// MARK: - Private Modifiers

/// A core modifier that performs the bounce scale animation.
///
/// This modifier drives the scale effect from a peak value back to `1.0`
/// using an interactive spring. It listens to a `trigger` value to restart
/// the animation on demand.
///
/// - Parameters:
///   - trigger: A binding that, when changed, restarts the bounce animation.
///   - peakScale: The maximum scale reached at the start of the bounce.
///   - duration: The spring response (approximate duration) in seconds.
///   - damping: The spring damping fraction; lower values bounce more.
///   - blendDuration: The spring blend duration.
private struct BounceModifier: ViewModifier {
    @Binding var trigger: UUID

    let peakScale: CGFloat
    let duration: CGFloat
    let damping: CGFloat
    let blendDuration: CGFloat

    @State private var isBouncing = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(isBouncing ? 1.0 : peakScale)
            .animation(
                .interactiveSpring(
                    response: duration,
                    dampingFraction: damping,
                    blendDuration: blendDuration
                ),
                value: isBouncing
            )
            .onChange(of: trigger) { _ in
                // Start at peak, then settle back to 1.0
                isBouncing = false
                // Ensure the state change propagates to trigger animation
                DispatchQueue.main.async {
                    isBouncing = true
                }
            }
            .onAppear {
                // Initialize settled state
                isBouncing = true
            }
    }
}

/// A convenience modifier that triggers a bounce when the view appears.
///
/// Internally, this creates and updates a `trigger` value on `onAppear` to
/// restart the underlying `BounceModifier` animation.
///
/// - Parameters:
///   - peakScale: The maximum scale reached at the start of the bounce.
///   - duration: The spring response (approximate duration) in seconds.
///   - damping: The spring damping fraction; lower values bounce more.
///   - blendDuration: The spring blend duration.
private struct BounceOnAppearModifier: ViewModifier {
    let peakScale: CGFloat
    let duration: CGFloat
    let damping: CGFloat
    let blendDuration: CGFloat

    @State private var trigger = UUID()

    func body(content: Content) -> some View {
        content
            .modifier(BounceModifier(
                trigger: $trigger,
                peakScale: peakScale,
                duration: duration,
                damping: damping,
                blendDuration: blendDuration
            ))
            .onAppear {
                trigger = UUID()
            }
    }
}

/// A convenience modifier that triggers a bounce on tap and accessibility activation.
///
/// This wraps `BounceModifier` and regenerates an internal `trigger` whenever
/// the view is tapped or the default accessibility action is performed.
///
/// - Parameters:
///   - peakScale: The maximum scale reached at the start of the bounce.
///   - duration: The spring response (approximate duration) in seconds.
///   - damping: The spring damping fraction; lower values bounce more.
///   - blendDuration: The spring blend duration.
private struct BounceOnTapModifier: ViewModifier {
    let peakScale: CGFloat
    let duration: CGFloat
    let damping: CGFloat
    let blendDuration: CGFloat

    @State private var trigger = UUID()

    func body(content: Content) -> some View {
        content
            .modifier(BounceModifier(
                trigger: $trigger,
                peakScale: peakScale,
                duration: duration,
                damping: damping,
                blendDuration: blendDuration
            ))
            .onTapGesture {
                trigger = UUID()
            }
            .accessibilityAction(.default) {
                trigger = UUID()
            }
    }
}

