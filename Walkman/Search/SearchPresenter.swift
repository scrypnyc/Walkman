//
//  SearchPresenter.swift
//  Walkman
//
//  Created by Alexander Skrypnyk on 10.12.2019.
//  Copyright (c) 2019 Alexander Skrypnyk. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
  func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
  weak var viewController: SearchDisplayLogic?
  
  func presentData(response: Search.Model.Response.ResponseType) {
    
    switch response {
    case .some:
        print("presenter .some")
    case .presentTracks:
        print("presenter .presentTracks")
        viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks)
    }
  
  }
  
}
