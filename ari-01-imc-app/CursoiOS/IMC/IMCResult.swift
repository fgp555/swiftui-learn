//
//  IMCResult.swift
//  CursoiOS
//
//  Created by m1 on 17/07/2026.
//

import SwiftUI

struct IMCResult: View {
    
    let userWeight:Double
    let userHeight:Double
    
    
    var body: some View {
        VStack{
            Text("Resultado")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
            let result = calculateImc(weight: userWeight, height: userHeight)
            InformationView(result: result)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

func calculateImc(weight:Double,height:Double)-> Double{
    let result = weight/((height/100)*(height/100))
    return result
}

struct InformationView:View {
    let result:Double
    var body: some View {
        let information = getImcResult(result: result)
        
        VStack{
            Spacer()
            Text(information.0).foregroundStyle(information.2)
                .font(.title)
                .bold()
            Spacer()
            Text("\(result, specifier: "%.2f")")
                .font(.system(size: 80))
                .bold()
                .foregroundStyle(.white)
            Spacer()
            Text(information.1)
                .foregroundStyle(.white)
                .font(.title2)
                .padding(.horizontal,8)
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.backgroundComponent)
        .cornerRadius(16)
        .padding(16)
    }
}

func getImcResult(result:Double) -> (String,String,Color){
    let title: String
    let description: String
    let color: Color
    
    switch result {
    case 0.00...19.99:
        title = "Delgado"
        description = "Debes aumentar tu consumo de proteínas y grasas saludables"
        color = .red
    case 20.00...24.99:
        title = "Saludable"
        description = "Sigues teniendo un estilo de vida saludable"
        color = .green
    case 25.00...29.99:
        title = "Sobrepeso"
        description = "Debes reducir el consumo de grasas y aumentar el ejercicio físico"
        color = .yellow
    default:
        title = "Obeso"
        description = "Debes reducir significativamente el consumo de calorías"
        color = .red
    }
    
    return (title, description,color)
}

#Preview {
    IMCResult(userWeight: 80, userHeight: 190)
}
