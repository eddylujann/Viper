//
//  SearchResultProtocols.swift
//  VIPER
//
//  Created by Eddy Donald Chinchay Lujan on 25/1/22.
//  
//

import Foundation
import UIKit

protocol SearchResultViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: SearchResultPresenterProtocol? { get set }
    func updateUI()
    func startActivity()
    func stopActivity() 
}

protocol SearchResultWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createSearchResultModule(filter: String) -> UIViewController
}

protocol SearchResultPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: SearchResultViewProtocol? { get set }
    var interactor: SearchResultInteractorInputProtocol? { get set }
    var wireFrame: SearchResultWireFrameProtocol? { get set }
    var filter: String? { get set } 
    func viewDidLoad()
    func numberOfRowsInsection(section: Int) -> Int
    func showProfileData(indexPath: IndexPath) -> Userpost
    func viewModelIsEmpty() -> Bool
}

protocol SearchResultInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func interactorCallBackData(userpost: [Userpost])
}

protocol SearchResultInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: SearchResultInteractorOutputProtocol? { get set }
    var localDatamanager: SearchResultLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SearchResultRemoteDataManagerInputProtocol? { get set }
    func interactorGetData(token:String, filter: String)
}

protocol SearchResultDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol SearchResultRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SearchResultRemoteDataManagerOutputProtocol? { get set }
    // func remoteGetData(token:String, filter: String)
    func remoteGetData(token:String, filter: UserSearchBE)
}

protocol SearchResultRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteCallBackData(userpost: [Userpost])
}

protocol SearchResultLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
