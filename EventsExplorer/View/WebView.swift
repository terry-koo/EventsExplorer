//
//  WebView.swift
//  EventsExplorer
//
//  Created by Terry Koo on 12/1/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    let viewModel: EventViewModel
    
    var webView: WKWebView?
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.viewModel.isLoaded = true
            
            let webInteractor = WKWebViewInteractor(webView: webView)
            parent.viewModel.setupWebViewInteractor(webInteractor)
            
            parent.viewModel.fetchFirstEventNameData()
        }
    }
}
