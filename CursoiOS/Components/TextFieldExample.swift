//
//  TextFieldExample.swift
//  CursoiOS
//
//  Created by m1 on 16/07/2026.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            TextField("escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal,32)
                .onChange(of: email) { oldValue, newValue in
                    print("oldValue",oldValue)
                    print("newValue",newValue)
                }
            
            SecureField("escribe tu password", text: $password)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal,32)
                .onChange(of: password) { oldValue, newValue in
                    print("oldValue",oldValue)
                    print("newValue",newValue)
                }
        }
    }
}

#Preview {
    TextFieldExample()
}
