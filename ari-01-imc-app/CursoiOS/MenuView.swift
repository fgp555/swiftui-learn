//
//  MenuView.swift
//  CursoiOS
//
//  Created by m1 on 16/07/2026.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            VStack{
                NavigationLink {
                    
                } label: {
                    Text("NavigationLink 1")
                }
                
                NavigationLink(destination:{}){
                     Text("NavigationLink 2")
                }
                
                NavigationLink(destination:IMCView()){
                     Text("IMCView")
                }
                
            }
        }
    }
}

#Preview {
    MenuView()
}
