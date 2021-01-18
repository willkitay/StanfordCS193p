//
//  Cardify.swift
//  Memorize
//
//  Created by Will on 1/13/21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var isFaceUp: Bool {
        rotation < 90
    }
    
    let gradient: Gradient
    var rotation: Double
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    
    init(isFaceUp: Bool, gradient: Gradient) {
        rotation = isFaceUp ? 0 : 180
        self.gradient = gradient
    }

    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }.opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool, gradient: Gradient) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, gradient: gradient))
    }
}
