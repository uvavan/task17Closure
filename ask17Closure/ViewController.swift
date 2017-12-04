//
//  ViewController.swift
//  ask17Closure
//
//  Created by Admin on 04.12.2017.
//  Copyright © 2017 Bioprom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var changeColorAction: ((UIColor) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClosure()
    }
    
    private func setupClosure() {
        let printClosure = {
            print("I love seift")
        }
        let calculateCircumference = { (r: Double) -> Double in
            let l = 2 * Double.pi * r
            return l
        }
        changeColorAction = { (color: UIColor) in
            self.view.backgroundColor = color
        }
        print(calculateCircumference(10))
        printClosure()
        repeatTask(times: 10, task: printClosure)
    }
    
    @IBAction func buttonPressColor(_ sender: UIButton) {
        guard let color = sender.backgroundColor else { return }
        guard let colorAction = changeColorAction else { return }
        colorAction(color)
    }
    
    private func repeatTask(times: Int, task: () -> Void) {
        for _ in 0..<times {
            task()
        }
    }
    
}

