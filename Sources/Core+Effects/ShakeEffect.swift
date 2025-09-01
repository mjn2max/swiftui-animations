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
