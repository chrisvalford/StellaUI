//
//  SymptomsSelectCellView.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import SwiftUI

struct SymptomsSelectCellView: View {
    
    var imageName: String
    var title: String
    
    let onSelect: () -> Void
    @State var isSelected = false {
        didSet {
            print("\(title) isSelected: \(isSelected ? "true" : "false")")
        }
    }
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
            onSelect()
        }) {
            VStack {
                Section {
                    isSelected ?
                    Image(systemName: "checkmark.square") : Image(systemName: "square")
                }
                .offset(x: +70, y: -5)
                Image(systemName: imageName)
                    .padding(.bottom, 4)
                Text(title)
                    .font(.custom("Georgia", size: 18, relativeTo: .headline))
                    .multilineTextAlignment(.center)
            }
        }
        .foregroundColor(.black)
        .frame(width: 160, height: 120)
        .background(isSelected ? Color.white : Color.clear)
        .overlay(
           RoundedRectangle(cornerRadius: 4)
               .stroke(Color.gray.opacity(0.1), lineWidth: 2)
        )
    }
}

struct SymptomsCellView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsSelectCellView(imageName: "bed.double", title: "Difficulty getting to sleep") {
            print("Tapped")
        }
    }
}
