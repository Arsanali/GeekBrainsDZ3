//
//  AuthModuleVC.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 22.06.2021.
//

import UIKit
import WebKit
import Alamofire

class AuthModuleVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self
        
        let myURL = URL(string:"https://vk.com")
                let myRequest = URLRequest(url: myURL!)
                webView.load(myRequest)
        request()
        
        AF.request("https://api.vk.com/method/friends.get?v=5.52&access_token=128d5b8063b47d07bfc758df824f738898500df4be9824791b4308179c744f68d7e590d0d28d9730fb4d4&fields=city,domain")
            .response { response in
                print(response.value)
            }
    }
    
    func request(){
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7886024"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }
}

extension AuthModuleVC: WKUIDelegate , WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        
        print("\(String(describing: token)) ваш токен" as Any)
        
        
        decisionHandler(.cancel)
    }
}
