//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by m1 on 16/07/2026.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("my button") {
            print("hola")
        }
        
        Button {
            print("hola 2")
        } label: {
            Text("Hola 22")
                .frame(width: 100,height: 50)
                .background(Color.blue)
                .foregroundStyle(Color.white)
                .cornerRadius(10)
        }
    }
}

struct Counter:View {
    @State var subscribersNumber = 0
    
    var body: some View {
        Button { subscribersNumber += 1 } label: {
            Text("Suscriptores: \(subscribersNumber)")
                .bold()
                .font(.title)
                .frame(height: 50)
                .background(.red)
                .foregroundStyle(Color.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    Counter()
}
