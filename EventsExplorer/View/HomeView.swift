//
//  ContentView.swift
//  EventsExplorer
//
//  Created by Terry Koo on 12/1/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: EventViewModel
    
    let title: String = "Events Explorer"
    let sfstationURL = "https://www.sfstation.com/calendar"
    let loadingInformation = "Loading..."
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding()
            
            WebView(url: URL(string: sfstationURL)!,
                    viewModel: viewModel)
            .padding()
            
            Text(viewModel.isLoaded ? viewModel.firstEventName : loadingInformation)
                .padding()
                .onTapGesture {
                    viewModel.clickEventInBrowser()
                }
        }
    }
}


#Preview {
    HomeView(viewModel: EventViewModel())
}


