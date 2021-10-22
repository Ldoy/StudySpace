//
//  SwiftUIView.swift
//  SwfitUI_Exercise
//
//  Created by Do Yi Lee on 2021/10/22.
//

import SwiftUI

struct CircleImage: View {
    
    var body: some View {
        Image("cat")
            .clipShape(Circle())
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
