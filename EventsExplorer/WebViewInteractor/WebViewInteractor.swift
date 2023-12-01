//
//  Test.swift
//  EventsExplorer
//
//  Created by Terry Koo on 12/1/23.
//

protocol WebViewInteractor {
    func evaluateJavaScript(_ script: String, completion: @escaping (Any?, Error?) -> Void)
}

