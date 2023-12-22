//
//  CenterView.swift
//  CustomTabBar
//
//  Created by Dhanunjay Kumar on 19/12/23.
//

import SwiftUI

class PercentageManager: ObservableObject {
    @Published var percentage: Double = 0
}

struct CenterView: View {
    @EnvironmentObject var percentageManager: PercentageManager
    
    var body: some View {
        ZStack {
            
            BackgroundImageView()
            
            VStack {
                
                Spacer().frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    percentageManager.percentage = Double(Int.random(in: 1...5) * 20)
                }) {
                    Text("Click to Update Percentage")
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.blue)
                .cornerRadius(8)
                
                
                Text("Percentage: \(String(format: "%.2f", percentageManager.percentage))").foregroundColor(.red)
                
                
                Text("Center View")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CenterView()
}


// 
