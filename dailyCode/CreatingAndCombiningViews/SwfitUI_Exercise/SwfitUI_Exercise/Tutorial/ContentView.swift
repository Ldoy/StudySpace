//
//  ContentView.swift
//  SwfitUI_Exercise
//
//  Created by Do Yi Lee on 2021/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isViewColorGreen: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            MapView()
                .frame(height: 300)
            //CircleImage().offset(x: 0, y: 0)
            
            VStack(alignment: .center) {
                Text("Funny SwiftUI")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.blue)
                    .accessibility(label: .init("Greetings"))
                Spacer(minLength: 20)
                Divider()

//                Text("UIKit")
//                    .font(.title3)
//                    .fontWeight(.light)
                
                if isViewColorGreen {
                    CircleImage()
                        .foregroundColor(.yellow)
                } else {
                    CircleImage().foregroundColor(.red)
                }
                
                Button {
                    isViewColorGreen.toggle()
                } label: {
                    Text("dd")
                }
                //Spacer(minLength: 20)
            }
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
