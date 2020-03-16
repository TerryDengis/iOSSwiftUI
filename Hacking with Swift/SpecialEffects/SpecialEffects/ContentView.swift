//
//  ContentView.swift
//  SpecialEffects
//
//  Created by Terry Dengis on 11/8/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
    var path = Path ()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX-insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
    }
}

struct CheckerBoard: Shape {
    var rows: Int
    var columns: Int
    
    public var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(Double(rows), Double(columns ))}
        
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path ()
        
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row+column).isMultiple(of: 2) {
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)
                    
                    let rect = CGRect (x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}

struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amount: CGFloat
    
    func gcd (_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        
        return a
    }
    
    func path(in rect: CGRect) -> Path {
        let divisor = gcd (innerRadius, outerRadius)
        let outerRadius = CGFloat (self.outerRadius)
        let innerRadius = CGFloat (self.innerRadius)
        let distance = CGFloat (self.distance)
        let difference = innerRadius - outerRadius
        let endPoint = ceil(2 * CGFloat.pi * outerRadius / CGFloat(divisor)) * amount
        
        var path = Path ()
        
        for theta in stride (from: 0, to: endPoint, by: 0.01) {
        
            var x = difference * cos(theta) + distance * cos (difference / outerRadius * theta)
            var y = difference * sin(theta) + distance * sin (difference / outerRadius * theta)
            
            x += rect.width / 2
            y += rect.height / 2
            
            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        return path
    }
    
    
}

struct ContentView: View {
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount: CGFloat = 1.0
    @State private var hue = 0.6
    
    var body: some View {
        VStack (spacing: 0) {
            Spacer ()
            //hypertrochoid
            Spirograph (innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: amount)
                .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
                .frame(width: 300, height: 300)
            
            Spacer ()
            
            Group {
                Text ("Inner radius: \(Int(innerRadius))")
                Slider (value: $innerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                Text ("Outer radius: \(Int(outerRadius))")
                Slider (value: $outerRadius, in: 1...150, step: 1)
                    .padding([.horizontal, .bottom])
                Text ("Distance: \(Int(distance))")
                Slider (value: $distance, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                Text ("Amount: \(amount, specifier: "%.2f")")
                Slider (value: $amount)
                    .padding([.horizontal, .bottom])
                Text ("Color")
                Slider (value: $hue)
                    .padding(.horizontal)

            }
        }
    }
}

struct CheckerBoardView: View {
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        CheckerBoard (rows: rows, columns: columns)
            .onTapGesture {
                withAnimation (.linear(duration: 3)) {
                    self.rows = 8
                    self.columns = 8
                }
        }
    }
}

struct TrapazoidView: View {
    @State private var insetAmount: CGFloat = 50
    
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    self.insetAmount = CGFloat.random(in: 10...90)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
