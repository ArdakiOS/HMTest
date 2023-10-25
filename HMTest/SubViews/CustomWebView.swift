//
//  File.swift
//  HMTest
//
//  Created by Ardak Tursunbayev on 24.10.2023.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let pair : String
    

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let htmlString: String = """
            <!DOCTYPE html>
            <html>
            <style>
                body {
                    height: 100vh;
                    background-color: rgba(32, 35, 47, 1);
                    margin: 0;
                    overflow: hidden;
                }
            </style>
            <body>
                <!-- TradingView Widget BEGIN -->
                <div class="tradingview-widget-container">
                  <div class="tradingview-widget-container__widget"></div>
                  <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
                  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-symbol-overview.js" async>
                  {
                  "symbols": [
                    [
                      "BITSTAMP:\(pair)|ALL"
                    ]
                  ],
                  "chartOnly": true,
                  "width": "100%",
                  "height": "100%",
                  "locale": "en",
                  "colorTheme": "dark",
                  "autosize": true,
                  "showVolume": false,
                  "showMA": false,
                  "hideDateRanges": false,
                  "hideMarketStatus": true,
                  "hideSymbolLogo": true,
                  "scalePosition": "right",
                  "scaleMode": "Normal",
                  "fontFamily": "-apple-system, BlinkMacSystemFont, Trebuchet MS, Roboto, Ubuntu, sans-serif",
                  "fontSize": "10",
                  "noTimeScale": false,
                  "valuesTracking": "1",
                  "changeMode": "price-and-percent",
                  "chartType": "candlesticks",
                  "maLineColor": "#2962FF",
                  "maLineWidth": 1,
                  "maLength": 9,
                  "lineType": 0,
                  "dateRanges": [
                    "all|1M"
                  ],
                  "upColor": "#22ab94",
                  "downColor": "#f7525f",
                  "borderUpColor": "#22ab94",
                  "borderDownColor": "#f7525f",
                  "wickUpColor": "#22ab94",
                  "wickDownColor": "#f7525f"
                }
                  </script>
                </div>
                <!-- TradingView Widget END -->
            </body>
            </html>
            """
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
}
