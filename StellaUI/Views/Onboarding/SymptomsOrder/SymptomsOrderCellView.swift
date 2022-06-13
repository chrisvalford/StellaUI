//
//  SymptomsOrderCellView.swift
//  StellaUI
//
//  Created by Christopher Alford on 11/6/22.
//

import SwiftUI

struct SymptomsOrderCellView: View {
    var index: Int
    var symptomImageName: String
    var title: String
    
    var body: some View {
        HStack {
            Text("\(index)")
                .font(.custom("Georgia", size: 18, relativeTo: .headline))
                .padding(4)
            HStack {
                Image(systemName: symptomImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text(title)
                    .font(.custom("Georgia", size: 18, relativeTo: .headline))
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(8)
        }
    }
}

struct SymptomsOrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsOrderCellView(index: 8, symptomImageName: "person", title: "Your symptom")
    }
}
