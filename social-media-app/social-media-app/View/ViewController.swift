//
//  ViewController.swift
//  social-media-app
//
//  Created by Harry Bower on 11/01/2024.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
//    var rootView: MainView {
//        view as! MainView
//    }
    
    let loginCtrl = UIHostingController(rootView: LoginView())
    
//    override func loadView() {
//            view = MainView()
//        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(loginCtrl)
        view.addSubview(loginCtrl.view)
        setConstraints()
        // Do any additional setup after loading the view.
//        Task {
//            do {
//                let apiCall: apiModel = apiModel(ws: "thoughts", proc:"ThoughtSelect", args: nil);
//                let thoughts = try await apiCall.getThoughts()
//                rootView.update(with: thoughts)
//            } catch {
//                print("Request failed with error: \(error)")
//            }
//        }
    }
    
    fileprivate func setConstraints() {
        loginCtrl.view.translatesAutoresizingMaskIntoConstraints = false
        loginCtrl.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loginCtrl.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loginCtrl.view.leftAnchor.constraint (equalTo: view.leftAnchor).isActive = true
        loginCtrl.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    

}

