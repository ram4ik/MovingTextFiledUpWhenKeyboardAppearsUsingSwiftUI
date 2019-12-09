//
//  ContentView.swift
//  MovingTextFiledUpWhenKeyboardAppearsUsingSwiftUI
//
//  Created by Ramill Ibragimov on 09.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var txt = ""
    @State private var value: CGFloat = 0
    var body: some View {
        VStack {
            List(0..<100) {_ in
                Text("Hello from SwiftUI")
            }
            TextField("Type Something", text: $txt)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 15)
            }.offset(y: -self.value)
            .animation(.spring())
            .onAppear() {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height
                
                self.value = height
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                
                self.value = 0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
