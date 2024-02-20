//
//  ViewController.swift
//  HorizontalPageControl
//
//  Created by 4285647 on 02/19/2024.
//  Copyright (c) 2024 4285647. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // create UIHostingController to integrate SwiftUI with UIKit
        let viewController = HorizontalPageControlWrapper.createHostingController()
        guard let subView = viewController.view else { return }
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(subView)
        
        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            subView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            subView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
        
        viewController.didMove(toParent: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

