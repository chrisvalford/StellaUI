//
//  StraplineView.swift
//  StellaUI
//
//  Created by Christopher Alford on 13/6/22.
//

import SwiftUI

struct StraplineView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Georgia", size: 18, relativeTo: .headline))
            .multilineTextAlignment(.center)
            .foregroundColor(Color("AppGrey"))
            .padding()
    }
}

struct StraplineView_Previews: PreviewProvider {
    static var previews: some View {
        StraplineView(text: "Sample strapline tect")
    }
}
