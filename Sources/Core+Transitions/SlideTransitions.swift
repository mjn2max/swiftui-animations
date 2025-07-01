//
// SlideTransitions.swift
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
    /// A slide-and-fade transition that moves the view in from the bottom while fading it in.
    ///
    /// - Returns: A transition that combines slide from bottom and opacity.
    ///
    /// # Usage
    /// ```swift
    /// .transition(.slideAndFade)
    /// ```
    static var slideAndFade: AnyTransition {
        .move(edge: .bottom).combined(with: .opacity)
    }
}
