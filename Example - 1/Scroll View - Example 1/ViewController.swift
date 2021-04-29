//
//  ViewController.swift
//  Scroll View - Example 1
//
//  Created by Sanket-Sonje on 18/04/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // create a scroll view programatically
        let scrollView = UIScrollView(frame: CGRect(
                                        x: 0,
                                        y: 0,
                                        width: view.frame.size.width,
                                        height: view.frame.size.height))
        scrollView.backgroundColor = UIColor.yellow
        view.addSubview(scrollView)

        // create one label on the top of the scroll view
        let view1 = UILabel(frame: CGRect(
                                x: 20,
                                y: 100,
                                width: 100,
                                height: 50))
        view1.backgroundColor = UIColor.red
        scrollView.addSubview(view1)

        // create another label on the top of the scroll view
        let view2 = UILabel(frame: CGRect(
                                x: 20,
                                y: 1100,
                                width: 100,
                                height: 50))
        view2.backgroundColor = UIColor.red
        scrollView.addSubview(view2)

        // check the original contentSize width and height of the scroll view
        // print("Scroll View -> Content Size -> Height: \(scrollView.contentSize.height)")
        // print("Scroll View -> Content Size -> Width: \(scrollView.contentSize.width)")

        // as you can see we cannot find the label 2
        // also the scroll view is not scrollable
        // to solve this issue we simply need to add the below code
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1500)
    }
}

