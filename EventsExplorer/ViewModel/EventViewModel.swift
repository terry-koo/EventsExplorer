//
//  EventViewModel.swift
//  EventsExplorer
//
//  Created by Terry Koo on 12/1/23.
//

import Foundation

final class EventViewModel: ObservableObject {
    @Published var firstEventName = ""
    @Published var isLoaded = false
    
    private var webViewInteractor: WebViewInteractor?

    func setupWebViewInteractor(_ webInteractor: WebViewInteractor) {
        webViewInteractor = webInteractor
    }
    
    func fetchFirstEventNameData() {
        guard let webViewInteractor = webViewInteractor else { return }

        let findFirstEventNameScript =
        """
            var eventNameElement = document.querySelector("#page_calendar > div > div.evcal_out > div > div:nth-child(2) > div:nth-child(1) > div.row.row-auth.ev.multi_ev > div.col-xs-12.col-sm-7 > div.ev_in.ev_mobile_c > h4 > a > span");
            if (eventNameElement) {
                eventNameElement.innerText;
            } else {
        
            }
        """

        webViewInteractor.evaluateJavaScript(findFirstEventNameScript) { result, error in
            if let error = error {
                print("Error evaluating JavaScript: \(error)")
            } else if let eventName = result as? String {
                DispatchQueue.main.async {
                    self.firstEventName = eventName
                }
            }
        }
    }

    func clickFirstEventInBrowser() {
        guard let webViewInteractor = webViewInteractor else { return }

        let clickFirstEventNameScript =
        """
            var eventLinkElement = document.querySelector("#page_calendar > div > div.evcal_out > div > div:nth-child(2) > div:nth-child(1) > div.row.row-auth.ev.multi_ev > div.col-xs-12.col-sm-7 > div.ev_in.ev_mobile_c > h4 > a");
            if (eventLinkElement) {
                eventLinkElement.click();
            }
        """

        webViewInteractor.evaluateJavaScript(clickFirstEventNameScript) { _, error in
            if let error = error {
                print("Error clicking event link: \(error)")
            }
        }
    }
}
