//
//  AuthorizationView.swift
//  Chapter8_SwiftUIBook
//
//  Created by James Thang on 12/05/2023.
//

import SwiftUI
import WebKit

struct AuthorizationView: View {
    
    @State private var isSuccessAuthorized: Bool = false

    var body: some View {
        WebView(request: URLRequest(url: URL(string: APIsManager.shared.returnAuthorizationURL())!), isSuccessAuthorized: $isSuccessAuthorized)
            .fullScreenCover(isPresented: $isSuccessAuthorized) {
                HomeView()
            }
    }
}

struct WebView: UIViewRepresentable {
    
    let request: URLRequest
    @Binding var isSuccessAuthorized: Bool
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) { self.parent = parent }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            guard let url = webView.url else { return }
            // Exchange Code for access Token
            let component = URLComponents(string: url.absoluteString)
            guard let code = component?.queryItems?.first(where: { $0.name == "code" })?.value else { return }
            
            APIsManager.shared.exchangeToken(code: code) { [weak self] success in
                if success {
                    self?.parent.isSuccessAuthorized = true
                }
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView  {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configs = WKWebViewConfiguration()
        configs.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: configs)
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}





struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}



