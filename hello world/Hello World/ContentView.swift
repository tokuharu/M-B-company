//
//  ContentView.swift
//  Hello World
//
//  Created by tokunakaharuyuki on 2020/01/17.
//  Copyright © 2020 M&B company. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var labelText = "Hello SwiftUI"
    
    var body: some View {
        VStack(spacing: 80) {
            Text(labelText)
                .font(.largeTitle)
                .foregroundColor(Color.red)
            Button(action: {self.labelText = "Yes Tapped!"}) {
                Text(/*@START_MENU_TOKEN@*/"tap!!"/*@END_MENU_TOKEN@*/)
                    .font(.footnote)
                    .fontWeight(.thin)
                    .foregroundColor(Color.black)
                    .frame(width: 70, height: 20)
                border(Color.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
