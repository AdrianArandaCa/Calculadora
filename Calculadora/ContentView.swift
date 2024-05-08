//
//  ContentView.swift
//  Calculadora
//
//  Created by Dev on 22/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            GeometryReader {proxy in
                VStack {
                    VStack {
                        Spacer()
                        HStack  {
                            Spacer()
                            Text (viewModel.textFieldValue)
                                .foregroundColor(.white)
                                .font(.system(size: 100, weight: .regular))
                                .frame(height: 100)
                                .padding(.trailing, 20)
                        }
                    }
                    VerticalButtonStack(viewModel: viewModel,
                                        data: Matrix.firstSectionData,
                                        columns: Matrix.firstSectionGrid(proxy.size.width * 0.25),
                                        width: proxy.size.width)
                    VerticalButtonStack(viewModel: viewModel,
                                        data: Matrix.secondSectionData,
                                        columns: Matrix.secondSectionGrid(proxy.size.width * 0.25),
                                        width: proxy.size.width)
                }
            }
            .background(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}