//
//  ContentView.swift
//  Drawing
//
//  Created by Terry Dengis on 11/7/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path ()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint (x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint (x: rect.maxY, y: rect.maxY))
        path.addLine(to: CGPoint (x: rect.midX, y: rect.minY))

        return path
    }
}

struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        // swift starts the degrees at the far right middle, moving up, left, down, then right??
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path ()
        
        path.addArc(center: CGPoint (x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset (by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        
        return arc
    }
}

struct Flower: Shape {
    var petalOffset: Double = -20
    var petalWidth : Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path ()
        
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            let rotaion = CGAffineTransform(rotationAngle: number)
            let position = rotaion.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat (petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) {value in
                Circle ()
                    .inset(by: CGFloat(value))
                    // this is being done by CH graphics
                    //.strokeBorder(self.color(for: value, brightness: 1, lineWidth: 2))
                    // increaseing the number of views by adding gardient to the line slows things done a lot
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                    self.color(for: value, brightness: 1, lineWidth: 2),
                    self.color(for: value, brightness: 0.5, lineWidth: 2)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
            //will now use metal, which is way faster, dont use this unless you find the other drawing slow as it can slow down simple drawing
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double, lineWidth: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color (hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var colorCycle = 0.0

    var body: some View {
        VStack {
            ColorCyclingCircle (amount: self.colorCycle)
                .frame(width:300, height:300)
            Slider(value: $colorCycle)
        }
    }
}
struct ColorCycleView: View {
    @State private var colorCycle = 0.0

    var body: some View {
        VStack {
            ColorCyclingCircle (amount: self.colorCycle)
                .frame(width:300, height:300)
            Slider(value: $colorCycle)
        }
    }
}

struct FlowerView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Flower (petalOffset: petalOffset, petalWidth: petalWidth)
                .fill (Color.red, style: FillStyle (eoFill: true))
            Text ("Offset")
            Slider (value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text ("Width")
            Slider (value: $petalWidth, in: 0...100)
                .padding(.horizontal)

        }
    }
}


struct ArcTriangleView: View {
    var body: some View {
        
        VStack {
            Triangle ()
                .stroke (Color.red, style: StrokeStyle ( lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame (width:100, height:100)
            
            Arc (startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .strokeBorder (Color.red, lineWidth: 40)
                //.frame (width:100, height:100)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
