//
//  OnboardingOne.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import SwiftUI

struct OnboardingOne: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Text("OnboardingOne")
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
        
    }
}

struct OnboardingOne_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingOne(selectedTab: .constant(1))
    }
}
