//
//  ImageExample.swift
//  CursoiOS
//
//  Created by m1 on 16/07/2026.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Image("mmlogo")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
        
        Image(systemName: "square.and.arrow.up")
            .resizable()
            .scaledToFit()            .frame(width: 100, height: 100)

    }
}

#Preview {
    ImageExample()
}
