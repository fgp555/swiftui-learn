//
//  ContentView.swift
//  CursoiOS
//
//  Created by m1 on 16/07/2026.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!123")
            Text("Hello, world!").bold().foregroundColor(.green)
                .frame(width: 200, height: 200).background(Color.blue)
            
        }
        .padding()
    }
}

#Preview {
    Exercise1()
}

