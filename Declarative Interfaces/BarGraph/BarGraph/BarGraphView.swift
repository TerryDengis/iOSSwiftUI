//
//  BarGraphView.swift
//  BarGraph
//
//  Created by Terry Dengis on 11/4/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//
import Foundation
import SwiftUI

struct BarGraphView: View {
    
    let reports : [Report]
    
    var body: some View {
        VStack {
            HStack (alignment: .lastTextBaseline) {
                
                ForEach (reports, id:\.self) { report in
                    BarView (report: report)
                }
            }
        }
    }
}

struct BarView: View {
    let report: Report
    @State private var showGraph: Bool = false
    
    var body: some View {
        let value = report.revenue/500
        let yValue = Swift.min(value*20, 500)
        
        return VStack {
            Text (String (format: "$%.0f", report.revenue))
            Rectangle ()
                .fill(Color.red)
                .frame (width: 100, height: self.showGraph ? CGFloat(yValue) : 0)
                .onAppear {
                    withAnimation (.easeInOut(duration: 2.0)) {
                        self.showGraph.toggle ()
                    }
            }
            Text (report.year)
        }
    }
}

struct BarGraphView_Previews: PreviewProvider {
    static var previews: some View {
        BarGraphView(reports: Report.all())
    }
}
