//
//  Singleton.swift
//  EssentialDeveloper
//
//  Created by Luane dos Santos Lopes on 01/10/22.
//

import UIKit

/*
 A classe ApiClient é compartilhada entre as Controllers de Login e Feed,
 porém cada uma acessa uma determinada função, podendo então que a mesma (ApiClient)
 estabeleça um tipo de dependência do código-fonte.
 */


// Api Module
class ApiClient{
    static var shared = ApiClient()
    
    private init() {}
    
    func execute(_ : URLSession, completion: (Data) -> Void){}
}

//class MockApiClient: ApiClient{ }

// Login Module

struct LoggedInUser {}

extension ApiClient{
    func login(completion: (LoggedInUser) -> Void) {}
}

class LoginViewController: UIViewController{
    let api = ApiClient.shared

    func didTapLoginButton(){
        api.login(){ user in
            //Code
        }
    }
}

// Feed Module
struct FeedItem {}

extension ApiClient{
    func loadFeed(completion: ([FeedItem]) -> Void) {}
}

class FeedViewController: UIViewController{
    let api = ApiClient.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.loadFeed{ loadedItems in
            //Code
        }
    }
}
