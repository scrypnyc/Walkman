//
//  MusicViewController.swift
//  Walkman
//
//  Created by Alexander Skrypnyk on 10.12.2019.
//  Copyright (c) 2019 Alexander Skrypnyk. All rights reserved.
//

import UIKit

protocol MusicDisplayLogic: class {
  func displayData(viewModel: Music.Model.ViewModel.ViewModelData)
}

class MusicViewController: UIViewController, MusicDisplayLogic {

  var interactor: MusicBusinessLogic?
  var router: (NSObjectProtocol & MusicRoutingLogic)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = MusicInteractor()
    let presenter             = MusicPresenter()
    let router                = MusicRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func displayData(viewModel: Music.Model.ViewModel.ViewModelData) {

  }
  
}
