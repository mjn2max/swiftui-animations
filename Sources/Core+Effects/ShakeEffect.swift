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

    /// A rotation shake effect that tilts the view back and forth.
    ///
    /// - Parameters:
    ///   - angle: The maximum rotation angle in degrees.
    ///   - duration: Duration of one shake cycle.
    ///   - repeats: Number of repeats for the shake.
    /// - Returns: A view with a rotational shake animation.
    ///
    /// # Usage
    /// ```swift
    /// Image(systemName: "exclamationmark.triangle")
    ///     .shakeRotate(angle: 6, duration: 0.15, repeats: 3)
    /// ```
    func shakeRotate(angle: Double = 6, duration: Double = 0.15, repeats: Int = 3) -> some View {
        self.modifier(RotateShakeEffect(animatableData: CGFloat(repeats), angle: angle, duration: duration))
    }


    /// A diagonal shake effect that moves the view both horizontally and vertically.
    ///
    /// - Parameters:
    ///   - distance: The maximum offset in both directions.
    ///   - duration: Duration of one shake cycle.
    ///   - repeats: Number of repeats for the shake.
    /// - Returns: A view with a diagonal shake animation.
    ///
    /// # Usage
    /// ```swift
    /// Text("Diagonal Shake")
    ///     .shakeDiagonal(distance: 12, duration: 0.1, repeats: 5)
    /// ```
    func shakeDiagonal(distance: CGFloat = 12, duration: Double = 0.1, repeats: Int = 5) -> some View {
        self.modifier(DiagonalShakeEffect(animatableData: CGFloat(repeats), distance: distance, duration: duration))
    }


    /// A 3D rotation shake effect that wobbles along the X axis.
    ///
    /// - Parameters:
    ///   - angle: Maximum rotation angle in degrees.
    ///   - duration: Duration of one shake cycle.
    ///   - repeats: Number of repeats for the shake.
    /// - Returns: A view with a 3D wobble effect.
    ///
    /// # Usage
    /// ```swift
    /// Text("3D Shake")
    ///     .shake3DX(angle: 8, duration: 0.15, repeats: 4)
    /// ```
    func shake3DX(angle: Double = 8, duration: Double = 0.15, repeats: Int = 4) -> some View {
        self.modifier(Rotate3DShakeEffect(animatableData: CGFloat(repeats), angle: angle, axis: (x: 1, y: 0, z: 0), duration: duration))
    }

    
    /// A 3D rotation shake effect that wobbles along the Y axis.
    ///
    /// - Parameters:
    ///   - angle: Maximum rotation angle in degrees.
    ///   - duration: Duration of one shake cycle.
    ///   - repeats: Number of repeats for the shake.
    /// - Returns: A view with a 3D wobble effect along Y axis.
    ///
    /// # Usage
    /// ```swift
    /// Text("3D Shake Y")
    ///     .shake3DY(angle: 8, duration: 0.15, repeats: 4)
    /// ```
    func shake3DY(angle: Double = 8, duration: Double = 0.15, repeats: Int = 4) -> some View {
        self.modifier(Rotate3DShakeEffect(animatableData: CGFloat(repeats), angle: angle, axis: (x: 0, y: 1, z: 0), duration: duration))
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

fileprivate struct DiagonalShakeEffect: GeometryEffect {
    var animatableData: CGFloat
    var distance: CGFloat
    var duration: Double

    func effectValue(size: CGSize) -> ProjectionTransform {
        let offset = sin(animatableData * .pi * 2) * distance
        return ProjectionTransform(CGAffineTransform(translationX: offset, y: offset))
    }
}

fileprivate struct Rotate3DShakeEffect: GeometryEffect {
    var animatableData: CGFloat
    var angle: Double
    var axis: (x: CGFloat, y: CGFloat, z: CGFloat)
    var duration: Double

    func effectValue(size: CGSize) -> ProjectionTransform {
        let rotation = sin(animatableData * .pi * 2) * angle
        var transform3D = CATransform3DIdentity
        transform3D.m34 = -1 / 500 // perspective
        transform3D = CATransform3DRotate(transform3D, CGFloat(rotation * .pi / 180), axis.x, axis.y, axis.z)
        return ProjectionTransform(CATransform3DGetAffineTransform(transform3D))
    }
}
