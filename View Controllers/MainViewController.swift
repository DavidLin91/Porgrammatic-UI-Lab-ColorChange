//
//  ViewController.swift
//  Porgrammatic-UI-Lab-ColorChange
//
//  Created by David Lin on 1/28/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }


}

