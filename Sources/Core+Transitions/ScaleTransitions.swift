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


    /// A scale transition that scales the view from the top-leading corner with opacity.
    ///
    /// - Returns: A transition that combines scaling from the top-leading corner with fading.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.scaleFromTopLeading)
    /// ```
    static var scaleFromTopLeading: AnyTransition {
        .scale(scale: 0.8, anchor: .topLeading).combined(with: .opacity)
    }


    /// A scale transition that scales the view from the trailing edge with opacity.
    ///
    /// - Returns: A transition that combines scaling from the trailing edge with fading.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.scaleFromTrailing)
    /// ```
    static var scaleFromTrailing: AnyTransition {
        .scale(scale: 0.8, anchor: .trailing).combined(with: .opacity)
    }
}
