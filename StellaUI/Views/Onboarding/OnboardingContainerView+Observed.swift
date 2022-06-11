//
//  OnboardingContainerView+Observed.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import SwiftUI

extension OnboardingContainerView {
    class Observed: ObservableObject {
        @AppStorage("isOnboarding") var isOnboarding: Bool?
    }
}
