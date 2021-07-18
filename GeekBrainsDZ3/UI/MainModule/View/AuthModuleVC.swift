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
    
    private let vm: AuthViewModel = AuthViewModelImpl()

    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let request = vm.urlRequest else {
            return
        }
        webView.load(request)
        webView.uiDelegate = self
    }

}

extension AuthModuleVC: WKUIDelegate , WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        do{
            try vm.saveTokenAndUserId(navigationResponse.response.url)
            guard let presentVC = storyboard?.instantiateViewController(identifier: "tabbar") as? MainTabVC else{
                print("Vc with identifier FriendsViewController, not found")
                return
            }
          //  presentVC.presenter = FriendsVC() as? FriendsPresenter
            view.window?.rootViewController = presentVC
            decisionHandler(.cancel)
        }catch{
            decisionHandler(.allow)
        }
    }
}
