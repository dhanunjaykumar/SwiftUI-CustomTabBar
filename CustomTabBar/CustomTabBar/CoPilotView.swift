//
//  CoPilotView.swift
//  CustomTabBar
//
//  Created by Dhanunjay Kumar on 19/12/23.
//

import SwiftUI

struct CoPilotView: View {
    var body: some View {
        ZStack {
            BackgroundImageView()
            
            VStack {
                Spacer().frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Text("CoPilotView")
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
    CoPilotView()
}
