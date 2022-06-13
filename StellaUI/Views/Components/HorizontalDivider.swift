//
//  HorizontalDivider.swift
//  StellaUI
//
//  Created by Christopher Alford on 13/6/22.
//

import SwiftUI

struct HorizontalDivider: View {
    var body: some View {
        Divider()
            .frame(height: 2)
            .background(Color("AppTeal").opacity(0.5))
            .padding(.horizontal)
    }
}

struct HorizontalDivider_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalDivider()
    }
}
