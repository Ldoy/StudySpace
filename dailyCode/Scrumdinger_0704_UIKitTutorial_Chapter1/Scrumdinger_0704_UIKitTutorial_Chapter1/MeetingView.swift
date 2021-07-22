//
//  ContentView.swift
//  Scrumdinger_0704_UIKitTutorial_Chapter1
//
//  Created by Do Yi Lee on 2021/07/05.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
		Text("Hello").padding()
		VStack {
			ProgressView(value: 5, total: 15)
		}
    }
} // View 프로토콜을 따르고 있음. body 프로퍼티를 가짐.

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
