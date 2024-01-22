//
//  ViewController.swift
//  social-media-app
//
//  Created by Harry Bower on 11/01/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var rootView: MainView {
        view as! MainView
    }

    override func loadView() {
        view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task {
            do {
                let apiCall: apiModel = apiModel(ws: "thoughts", proc:"ThoughtSelect");
                let thoughts = try await apiCall.getThoughts()
                rootView.update(with: thoughts)
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    

}

