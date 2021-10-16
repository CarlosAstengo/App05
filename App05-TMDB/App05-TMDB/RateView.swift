//
//  ContentView.swift
//  App 05 Movies
//
//  Created by Carlos Astengo Macias on 27/09/21.
//

import SwiftUI

struct RateView: View {
    
    var rate: Double
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 60, height: 60)
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.55)
                .foregroundColor(Color.black)
                .frame(width: 70, height: 70)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(rate / 100, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(ScoreColor(rate: rate))
                .rotationEffect(Angle(degrees: 270.0))
                .frame(width: 70, height: 70)
                .animation(.linear)
            Text(String(format: "%.0f %%", min(rate, 100.0)))
                .font(.body)
                .foregroundColor(.white)
                .bold()
        }
    }
    
    func ScoreColor(rate: Double) -> Color {
        if rate >= 80 {
            return Color.green
        }
        if rate >= 60 {
            return Color.yellow
        }
        return Color.red
    }
}

struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        RateView(rate: 90.0)
    }
}
