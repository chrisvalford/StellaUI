//
//  OnboardingOne.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import SwiftUI

struct NameView: View {
    @Binding var selectedTab: Int
    
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            HeadingView(text: "What shall we call you?")
            StraplineView(text: "Use your real name or anything you fancy")
            TextField("Name", text: $name)
                .padding()
            HorizontalDivider()
            Spacer()
            Button(action: {
                selectedTab = 2
                print("Selecting 2")
            }, label: {
                Text("NEXT")
                    .fontWeight(.heavy)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("ButtonOrange"))
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
            })
        }
        .background(
            Color("Background")
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(selectedTab: .constant(1))
    }
}
