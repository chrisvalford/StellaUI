//
//  SymptomsSelectView.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import SwiftUI

struct SymptomsSelectView: View {
    
    @StateObject private var model = Observed()
    @Binding var selectedTab: Int
    
    private let columns = [
        GridItem(.adaptive(minimum: 160.0))
    ]
    
    var body: some View {
        VStack {
            HeadingView(text: "Which symptoms are bothering you?")
            StraplineView(text: "What you choose helps us create your personalised plan")
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(model.symptoms, id: \.id) { symptom in
                        SymptomsSelectCellView(imageName: symptom.imageName,
                                               title: symptom.title, onSelect:  {
                            print("Selected", symptom.title)
                            model.updateSelected(id: symptom.id)
                        }, isSelected: symptom.selected)
                    }
                }
            }
            .padding(.vertical, 4)
         
            Text("We'll add more symptoms soon...")
                .frame(maxWidth: .infinity)
                .padding(10)
                .foregroundColor(Color("AppGrey"))
                .background(Color("BackgroundGreen"))
                
            Button(action: {
                model.saveState()
                selectedTab = 3
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

struct SymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsSelectView(selectedTab: .constant(2))
    }
}
