//
//  OnboardingContainerView.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import SwiftUI

struct OnboardingContainerView: View {
    
    @StateObject private var model = Observed()
    @State var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            OnboardingOne(selectedTab: $selectedTab)
                .tabItem {}
                .tag(1)
            SymptomsSelectView(selectedTab: $selectedTab)
                .tabItem {}
                .tag(2)
            SymptomsOrderView()
                .tabItem {}
                .tag(3)
        }
        .tabViewStyle(PageTabViewStyle())
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContainerView(selectedTab: 1)
    }
}
