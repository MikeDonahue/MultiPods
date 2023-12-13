//
//  MikeButton.swift
//  MikeUI
//
//  Created by Mike Donahue on 12/13/23.
//

import SwiftUI
import MikeCore
import MikeFoundation

public struct MikeButton: View {
    @State var text: String
    
    public init(_ text: String) {
        _text = State(wrappedValue: text)
    }
    public var body: some View {
        Button(action: {
            print("isCool = \(Mike.shared.isCool)")
        }, label: {
            Text(text)
        })
    }
}

#Preview {
    MikeButton("Some Button")
}
