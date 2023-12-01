//
//  WKWebViewInteractor.swift
//  EventsExplorer
//
//  Created by Terry Koo on 12/1/23.
//

import WebKit

struct WKWebViewInteractor: WebViewInteractor {
    private let webView: WKWebView

    init(webView: WKWebView) {
        self.webView = webView
    }

    func evaluateJavaScript(_ script: String, completion: @escaping (Any?, Error?) -> Void) {
        webView.evaluateJavaScript(script, completionHandler: completion)
    }
}
