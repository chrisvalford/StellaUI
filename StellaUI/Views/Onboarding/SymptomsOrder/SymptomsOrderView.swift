//
//  TextView.swift
//  StellaUI
//
//  Created by Christopher Alford on 13/6/22.
//

import SwiftUI

struct SymptomsOrderView: View {
    @StateObject private var observed = Observed()
    @Binding var selectedTab: Int
    
    let backgroundGradient = LinearGradient(colors: [Color("BackgroundPink"), Color("BackgroundGreen")], startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        VStack {
            HeadingView(text: "Rank your symptoms in order of severity")
            StraplineView(text: "Drag and drop symptoms into place")
            HorizontalDivider()
            Text("MOST SEVERE")
                .font(.subheadline)
                .foregroundColor(Color("AppGrey"))
            ScrollView {
                ReorderableForEach(items: observed.symptoms) { item in
                    SymptomsOrderCellView(index: Int(item.sequence), symptomImageName: item.imageName, title: item.title)
                        .padding(.horizontal)
                } moveAction: { from, to in
                    observed.symptoms.move(fromOffsets: from, toOffset: to)
                }
            }
            .frame(
                  minWidth: 320,
                  maxWidth: .infinity,
                  maxHeight: .infinity
                )
            Text("LEAST SEVERE")
                .font(.subheadline)
                .foregroundColor(Color("AppGrey"))
            HorizontalDivider()
            Button(action: {
                //model.saveState()
                selectedTab = 4
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
            backgroundGradient
                .edgesIgnoringSafeArea(.all)
        )
        .onAppear {
            observed.fetchSymptoms()
        }
    }
}

struct SymptomsOrderView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsOrderView(selectedTab: .constant(3))
    }
}
