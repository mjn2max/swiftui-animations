//
// ScaleTransitions.swift
// SwiftUI-Animations
//
// Created by Huy D. on 6/26/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// CodePassion.dev
//

import SwiftUI

extension AnyTransition {
    /// A scale transition that scales the view from the bottom with opacity.
    ///
    /// - Returns: A transition that combines scaling from bottom with fading.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.scaleFromBottom)
    /// ```
    static var scaleFromBottom: AnyTransition {
        .scale(scale: 0.8, anchor: .bottom).combined(with: .opacity)
    }
}
