//
//  LabelExample.swift
//  CursoiOS
//
//  Created by m1 on 16/07/2026.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
//        Label("Suscribete", image: "mmlogo")
        Label("suscribete", systemImage: "figure.badminton")
        Label(title: {Text("Label 123")}, icon: {Image("mmlogo")
                .resizable()
                .scaledToFit().frame(height: 80)
        })
    }
}

#Preview {
    LabelExample()
}
