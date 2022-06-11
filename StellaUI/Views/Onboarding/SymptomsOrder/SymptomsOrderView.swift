//
//  SymptomsOrderView.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import SwiftUI

struct SymptomsOrderView: View {
    //@Binding var selectedTab: Int
    
    @StateObject private var model = Observed()
    
    var body: some View {
        Text("Symptoms Order View")
    }
}

struct SymptomsOrderView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsOrderView() //selectedTab: .constant(3))
    }
}
