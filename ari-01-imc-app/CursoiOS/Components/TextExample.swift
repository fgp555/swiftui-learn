//
//  TextExample.swift
//  CursoiOS
//
//  Created by m1 on 16/07/2026.
//

import SwiftUI

struct TextExample: View {
  var body: some View {
    VStack {

        Text("Hello, World!" ).font(.headline)
        Text("Custom Text!" ).font(.system(
            size: 40, weight: .light, design: .monospaced
        )).italic().bold().underline()
    }
     
  }
}

#Preview {
  TextExample()
}
