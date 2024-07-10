//
//  WebView.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burns on 7/9/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    let webView: WKWebView
        
    init(html: String) {
        self.webView = WKWebView()
        self.webView.loadHTMLString(html, baseURL: nil)
    }
 
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
    }
}
