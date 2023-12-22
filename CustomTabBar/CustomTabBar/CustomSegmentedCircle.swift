//
//  CustomSegmentedCircle.swift
//  CustomTabBar
//
//  Created by Dhanunjay Kumar on 22/12/23.
//

import SwiftUI

struct CustomSegmentedCircle: View {
    @EnvironmentObject var percentageManager: PercentageManager

    var body: some View {
        GeometryReader { geometry in
            let radius = (geometry.size.width - 10) / 2 // Adjusted for stroke width
            let gap: Double = 10 // Adjust the gap size as needed
            let segmentAngle = 360.0 / 5 - gap

            let colors: [Color] = [.red, .green, .blue, .orange, .purple] // Specify your desired colors

            ForEach(0..<5) { index in
                let startAngle = Angle(degrees: Double(index) * (segmentAngle + gap))
                let endAngle = Angle(degrees: Double(index + 1) * segmentAngle + Double(index) * gap)

                let color: Color = getColor(for: index, colors: colors)

                Path { path in
                    // Outer circle
                    path.addArc(center: CGPoint(x: radius + 5, y: radius + 5), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                }
                .stroke(color, lineWidth: 6) // Adjust the lineWidth as needed for the gap width
            }
        }
        .onReceive(percentageManager.$percentage) { newPercentage in
            print("Percentage updated to \(newPercentage)")
        }
        .frame(width: 65, height: 65)
    }

    func getColor(for index: Int, colors: [Color]) -> Color {
        let segmentPercentage = Double(index + 1) * 20
        return percentageManager.percentage >= segmentPercentage ? colors[index] : .gray
    }
}
#Preview {
    CustomSegmentedCircle()
}
