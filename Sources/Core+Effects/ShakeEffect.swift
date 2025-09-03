//
// ShakeEffect.swift
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
    /// A horizontal shake effect that moves the view left and right.
    ///
    /// - Parameters:
    ///   - distance: The maximum horizontal offset.
    ///   - duration: Duration of one shake cycle.
    ///   - repeats: Number of repeats for the shake.
    /// - Returns: A view with a horizontal shake animation.
    ///
    /// # Usage
    /// ```swift
    /// Text("Wrong Password")
    ///     .shakeHorizontal(distance: 10, duration: 0.1, repeats: 5)
    /// ```
    func shakeHorizontal(distance: CGFloat = 10, duration: Double = 0.1, repeats: Int = 5) -> some View {
        self.modifier(ShakeEffect(animatableData: CGFloat(repeats), axis: .horizontal, distance: distance, duration: duration))
    }

    /// A vertical shake effect that moves the view up and down.
    ///
    /// - Parameters:
    ///   - distance: The maximum vertical offset.
    ///   - duration: Duration of one shake cycle.
    ///   - repeats: Number of repeats for the shake.
    /// - Returns: A view with a vertical shake animation.
    ///
    /// # Usage
    /// ```swift
    /// Image(systemName: "arrow.down")
    ///     .shakeVertical(distance: 8, duration: 0.12, repeats: 4)
    /// ```
    func shakeVertical(distance: CGFloat = 8, duration: Double = 0.12, repeats: Int = 4) -> some View {
        self.modifier(ShakeEffect(animatableData: CGFloat(repeats), axis: .vertical, distance: distance, duration: duration))
    }
}


fileprivate struct ShakeEffect: GeometryEffect {
    enum Axis {
        case horizontal, vertical
    }

    var animatableData: CGFloat
    var axis: Axis
    var distance: CGFloat
    var duration: Double

    func effectValue(size: CGSize) -> ProjectionTransform {
        let translation: CGFloat
        if axis == .horizontal {
            translation = sin(animatableData * .pi * 2) * distance
            return ProjectionTransform(CGAffineTransform(translationX: translation, y: 0))
        } else {
            translation = sin(animatableData * .pi * 2) * distance
            return ProjectionTransform(CGAffineTransform(translationX: 0, y: translation))
        }
    }
}

fileprivate struct RotateShakeEffect: GeometryEffect {
    var animatableData: CGFloat
    var angle: Double
    var duration: Double

    func effectValue(size: CGSize) -> ProjectionTransform {
        let rotation = sin(animatableData * .pi * 2) * angle
        let transform = CGAffineTransform(rotationAngle: CGFloat(rotation * .pi / 180))
        return ProjectionTransform(transform)
    }
}
