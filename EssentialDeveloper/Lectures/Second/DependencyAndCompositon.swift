//
//  DependencyAndCompositon.swift
//  EssentialDeveloper
//  Created by Luane dos Santos Lopes on 12/10/22.
//

import UIKit

protocol FeedLoader {
    func loadFeed(completion: @escaping([String]) -> Void)
}

struct Reachability {
    static let networkAvailable = false
}

class FeedViewController: UIViewController{
    var loader: FeedLoader!
    var remote: RemoteFeedLoader!
    var local: LocalFeedLoader!
    
    convenience init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
        self.init()
        self.remote = remote
        self.local = local
    }
    
    convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Erro
//        if Reachability.networkAvailable{
//            remote.loadFeed(completion: { loadedItems in
//
//            })
//        }else{
//            local.loadFeed(completion: { loadedItems in
//
//            })
//        }
        
        loader.loadFeed(completion: { loadedItems in
            print("Hi Loader variable")
        })
    }
}

/** This class inherits from `FeedLoader`  */
class RemoteFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping([String]) -> Void){
        // Do something`
        print("Hi Remote Feed Loader variable")
    }
}
/** This class inherits from `FeedLoader` */

class LocalFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping([String]) -> Void){
        // Do something
        print("Hi Local Feed Loader variable")
    }
}

// MARK: Same Logic

class RemoteWithLocalFallbackFeedLoader: FeedLoader{
//    var loader: FeedLoader!
    var remote: RemoteFeedLoader!
    var local: LocalFeedLoader!
    
    convenience init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
        self.init()
//        self.loader = loader
        self.remote = remote
        self.local = local
    }
    
    func loadFeed(completion: @escaping([String]) -> Void) {
        let load = Reachability.networkAvailable ? remote.loadFeed : local.loadFeed
        load(completion)
    }
}
// MARK: Anotations 👩🏾‍💻
/** RemoteWithLocalFallbackFeedLoader, RemoteFeedLoader, LocalFeedLoader, FeedLoader
 ➡️ they take care of everything from behind, making the `Feed View Controller` not know
    what is happening, and only receive the screen state change.
    Please check the image in group this lesson.*/

