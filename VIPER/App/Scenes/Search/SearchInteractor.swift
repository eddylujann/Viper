//
//  SearchInteractor.swift
//  VIPER
//
//  Created by Eddy Donald Chinchay Lujan on 24/1/22.
//  
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
    
    // MARK: PROPERTIES
    weak var presenter: SearchInteractorOutputProtocol?
    var localDatamanager: SearchLocalDataManagerInputProtocol?
    var remoteDatamanager: SearchRemoteDataManagerInputProtocol?
    
    // MARK: FUNCTIONS
    
    // LLAMAR AL REMOTE DATA MANAGER
    func interactorGetData(page: Int, isPagination:Bool, token: String) {
        self.remoteDatamanager?.remoteGetData(page: page, isPagination:isPagination, token: token)
    }
    
}


// MARK: - OUPUT
extension SearchInteractor: SearchRemoteDataManagerOutputProtocol {
    func remoteCallBackDataAppend(userpost: [Post]) {
        self.presenter?.interactorCallBackDataAppend(userpost: userpost)
    }
    
    // MARK: FUNCTIONS
    
    // LLAMAR AL PRESENTER PARA DE VOLVER LOS DATOS
    func remoteCallBackData(userpost: [Post], totalPages: Int) {
        self.presenter?.interactorCallBackData(userpost: userpost, totalPages: totalPages)
    }
}
