//
//  CircleView.swift
//  CustomTabBar
//
//  Created by Dhanunjay Kumar on 20/12/23.
//

import SwiftUI

struct CircleView: View {
    var isSelected = false

    var body: some View {
        ZStack(alignment: .center){
            Image("GroupCircleBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            CustomSegmentedCircle()
        }
    }
}


