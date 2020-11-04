//
//  GraphCapsule.swift
//  Apple-SwiftUI-Example
//
//  Created by qiang on 2020/11/4.
//

import SwiftUI

struct GraphCapsule: View {
    var index: Int
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>
    
    var heightRadio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }
    
    var offsetRadio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }
    
    var body: some View {
        Capsule()
            .fill(Color.white)
            .frame(height: height * heightRadio)
            .offset(x: 0, y: height * -offsetRadio)
    }
}

struct GraphCapsule_Previews: PreviewProvider {
    static var previews: some View {
        GraphCapsule(index: 0, height: 150, range: 10..<50, overallRange: 0..<100)
    }
}
