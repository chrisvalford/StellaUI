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
    @State private var selection = Set<Symptom>()
    
    private let columns = [
        GridItem(.adaptive(minimum: 160.0))
    ]
    
    var body: some View {
        VStack {
            Text("Which symptoms are bothering you?")
                .font(.custom("Georgia-bold", size: 22, relativeTo: .headline))
                .multilineTextAlignment(.center)
                .padding()
            Text("What you choose helps us create your personalised plan")
                .font(.custom("Georgia", size: 18, relativeTo: .headline))
                .multilineTextAlignment(.center)
                .padding()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(model.symptoms, id: \.id) { symptom in
                        SymptomsSelectCellView(imageName: symptom.image,
                                         title: symptom.title) {
                            print("Selected", symptom.title)
                        }
                    }
                }
            }
            .padding(.vertical, 4)
         
            Text("We'll add more symptoms soon...")
                .frame(maxWidth: .infinity)
                .padding(10)
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
        .onAppear {
            model.fetchSymptons()
        }
    }
}

struct SymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsSelectView(selectedTab: .constant(2))
    }
}
