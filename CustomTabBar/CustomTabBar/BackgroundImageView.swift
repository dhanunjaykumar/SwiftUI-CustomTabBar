//
//  BackgroundImageView.swift
//  CustomTabBar
//
//  Created by Dhanunjay Kumar on 19/12/23.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
           VStack {
               Spacer()
               
//               Image("bgImage")
//                   .resizable()
//                   .aspectRatio(contentMode: .fill)
//                   .frame(height: UIScreen.main.bounds.height * 0.63)
//                   .clipped()
//                   .colorMultiply(Color.white)
//                   .padding(.leading,0)

           }
           .edgesIgnoringSafeArea(.all)
       }
}

#Preview {
    BackgroundImageView()
}

