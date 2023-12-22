//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Dhanunjay Kumar on 22/12/23.
//

import SwiftUI

struct CustomTabView: View {
    
    @State var selectedTab = 0
    @StateObject private var percentageManager = PercentageManager()

    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            ZStack {
                Group {
                    if selectedTab == 0 {
                        TodayView()
                    } else if selectedTab == 1 {
                        JourneysView()
                    } else if selectedTab == 2 {
                        RewardsView()
                    } else if selectedTab == 3 {
                        CoPilotView()
                    } else if selectedTab == -1 {
                        CenterView()
                            .environmentObject(percentageManager)
                    }
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal, 12)
                .offset(y: 50)
                
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            TabButton(title: "Today", imageName: "house", selectedImageName: "house.fill", badgeNumber: 0, isSelected: selectedTab == 0) {
                                self.selectedTab = 0
                            }
                            Spacer(minLength: 12)
                            
                            TabButton(title: "Journeys", imageName: "house", selectedImageName: "house.fill", badgeNumber: 0, isSelected: selectedTab == 1) {
                                self.selectedTab = 1
                            }
                            
                            Spacer(minLength: 100)
                            
                            TabButton(title: "Rewards", imageName: "house", selectedImageName: "house.fill", badgeNumber: 0, isSelected: selectedTab == 2) {
                                self.selectedTab = 2
                            }
                            Spacer(minLength: 12)
                            
                            TabButton(title: "CoPilot", imageName: "house", selectedImageName: "house.fill", badgeNumber: 400, isSelected: selectedTab == 3) {
                                self.selectedTab = 3
                            }
                        }
                        .background(CurvedShape())
                        .padding()
                        .padding(.horizontal, 22)
                        .cornerRadius(22)
                        .shadow(radius: 5, y: -5)
                        
                        CircleView(isSelected: self.selectedTab == -1)
                                                .onTapGesture {
                                                    self.selectedTab = -1
                                                }
                                                .offset(y: -12)
                                                .environmentObject(percentageManager)

                    }
                }
                .offset(y: 55)
            }
            .alignmentGuide(.top) { _ in CGFloat(50) }
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        }
        .frame(maxHeight: .infinity)
        .background(Color.white)
    }
}


struct TabButton: View {
    
    var title: String
    var imageName: String
    var selectedImageName: String
    var badgeNumber: Int
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(isSelected ? "avatarSelected" : "avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24).padding(.top,18) // Adjust the size as needed

                Text(title)
                            .font(.caption)
                            .lineLimit(1)
                            .foregroundColor(isSelected ? .clear : .black)
                            .overlay(
                                LinearGradient(gradient: Gradient(colors: isSelected ? [.green, .blue] : [Color.clear, Color.clear]), startPoint: .leading, endPoint: .trailing)
                                    .mask(Text(title)
                                            .font(.caption)
                                            .lineLimit(1)
                                            .foregroundColor(isSelected ? .white : .clear)
                                    )
                            )
            }
            .frame(width: 60) // Adjust the width as needed
            .overlay(
                badgeNumber > 0 ?
                    BadgeView(badgeNumber: badgeNumber)
                        .offset(x: 10, y: -12)
                    : nil
            )
        }
        .foregroundColor(isSelected ? .blue : .red)
        .tint(isSelected ? .blue : .red)
    }
}



struct BadgeView: View {
    
    var badgeNumber: Int
    
    var body: some View {
        Text("\(badgeNumber)")
            .font(.system(size: 12))
            .foregroundColor(.white)
            .padding(4)
            .background(Color.red)
            .clipShape(Circle())
            .alignmentGuide(HorizontalAlignment.trailing) { _ in
                -4
            }
            .alignmentGuide(VerticalAlignment.top) { _ in
                -4
            }
    }
    
}


struct CurvedShape: View {
    var body: some View {
        Image("Tabbar")
    }
}
#Preview {
    CustomTabView()
}
