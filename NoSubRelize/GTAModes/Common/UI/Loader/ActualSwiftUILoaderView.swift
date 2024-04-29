//
//  ActualLoaderView.swift
//  ActualGTA6
//
//  Created by Vladimir Khalin on 24.04.2024.
//

import SwiftUI

struct AnimatedProgressTextLoader: AnimatableModifier {
    var progress: CGFloat
    
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Text(String(format: "%.0f%%", progress * 100))
                    .font(.custom("Gilroy-Bold", size: 40))
                    .foregroundColor(.white)
                    .background(Color.clear.opacity(0))
                    
            )
    }
}

extension View {
    func animatedProgressTextLoader(progress: CGFloat) -> some View {
        modifier(AnimatedProgressTextLoader(progress: progress))
    }
}



struct ActualLoaderView: View {
    @State private var progress: CGFloat = 0.0 // Прогресс от 0 до 1
    @State var timerCounts: Double
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack {
                ZStack {
                    Circle()
                        .stroke(Color.black, lineWidth: 33)
                        .opacity(0.5)
                        .foregroundColor(.purple)
                    
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color("ActualPink"))
                        .offset(y: -80) // Расстояние от центра большого круга
                        .rotationEffect(Angle(degrees: Double(progress) * 360))
                    
                }
                .frame(width: 160, height: 160)
                .animatedProgressTextLoader(progress: progress)
                .onAppear {
                    withAnimation(.linear(duration: timerCounts)) {
                        self.progress = 1.0
                    }
                }
            }
            .frame(width: width, height: height)
        }
    }
}

#Preview {
    ActualLoaderView(timerCounts: 13)
}
