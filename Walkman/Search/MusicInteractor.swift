//
//  MusicInteractor.swift
//  Walkman
//
//  Created by Alexander Skrypnyk on 10.12.2019.
//  Copyright (c) 2019 Alexander Skrypnyk. All rights reserved.
//

import UIKit

protocol MusicBusinessLogic {
  func makeRequest(request: Music.Model.Request.RequestType)
}

class MusicInteractor: MusicBusinessLogic {

  var presenter: MusicPresentationLogic?
  var service: MusicService?
  
  func makeRequest(request: Music.Model.Request.RequestType) {
    if service == nil {
      service = MusicService()
    }
  }
  
}
