//
//  IMCView.swift
//  CursoiOS
//
//  Created by m1 on 16/07/2026.
//

import SwiftUI

struct IMCView: View {
//    init(){
//        UINavigationBar.appearance()
//            .titleTextAttributes = [.foregroundColor:UIColor.white]
//    }
    
    @State var gender:Int = 0
    @State var age:Int = 18
    @State var weight:Int = 80
    @State var height:Double = 0
    
    var body: some View {
        VStack{
            HStack{
                ToggleButton(text: "Men", imageName: "heart.fill", gender: 0,selectedGender:$gender)
                ToggleButton(text: "Women", imageName: "start.fill", gender: 1,selectedGender:$gender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack{
                CounterButton(text: "Edad", number: $age)
                CounterButton(text: "Peso", number: $weight)
            }
            IMCCalculateButton(userWeight: Double(weight), userHeight: (height))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
//        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("IMC Calculator by m1").foregroundStyle(Color(.white))
            }
        }
//        .navigationTitle("IMC Calculator")
        
    }
}

struct IMCCalculateButton:View {
    let userWeight:Double
    let userHeight:Double
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: IMCResult(userWeight: userWeight, userHeight: userHeight)){
                Text("Calcular")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.purple)
                    .frame(maxWidth: .infinity,maxHeight: 100)
                    .background(.backgroundComponent)
            }
        }
    }
}

struct ToggleButton:View {
    let text: String
    let imageName: String
    let gender: Int
    @Binding var selectedGender:Int
    
    var body: some View {
        let color = if(gender == selectedGender){
            Color.backgroundComponentSelected
        } else {
            Color.backgroundComponent
        }
        
        Button (action: {
            selectedGender = gender
        }){
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundStyle(.white)
                InformationText(text: "Hello")
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(color)
        }

    }
}

struct InformationText: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
    }
}

struct TitleText: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundStyle(.gray)
    }
}

struct HeightCalculator:View {
    @Binding var selectedHeight:Double
    
    var body: some View {
        VStack{
            TitleText(text: "Altura")
            InformationText(text:"\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight,in:100...220,step:1)
                .tint(.purple)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}

struct CounterButton:View {
    let text:String
    @Binding var number:Int
    var body: some View {
        VStack{
            TitleText(text: text)
            InformationText(text: String(number))
            HStack{
                Button(action:{
                    if(number > 0){
                        number -= 1
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70,height: 70)
                            .foregroundStyle(.purple)
                        
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.white)
                            .frame(width: 25,height: 25)
                    }
                }
                
                Button(action:{
                    if(number < 100){
                        number += 1
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70,height: 70)
                            .foregroundStyle(.purple)
                        
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 25,height: 25)
                    }
                }
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}

#Preview {
//    ToggleButton(text: "Aris", imageName: "heart.fill", index: 0)
    IMCView()
}
