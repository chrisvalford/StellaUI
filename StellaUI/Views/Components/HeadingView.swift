//
//  HeadingView.swift
//  StellaUI
//
//  Created by Christopher Alford on 13/6/22.
//

import SwiftUI

struct HeadingView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Georgia-bold", size: 22, relativeTo: .headline))
            .multilineTextAlignment(.center)
            .foregroundColor(Color("AppTeal"))
            .padding()
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(text: "Sample heading tect")
    }
}
