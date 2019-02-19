//
//  ViewController.swift
//  marioKart
//
//  Created by Mark Kinoshita on 2/14/19.
//  Copyright © 2019 Mark Kinoshit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kartView0: UIImageView!
    @IBOutlet weak var kartView1: UIImageView!
    @IBOutlet weak var kartView2: UIImageView!
    var startingPointKartView0 = CGPoint()
    var startingPointKartView1 = CGPoint()
    var startingPointKartView2 = CGPoint()
    @IBAction func didPanKartView(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        print("Location: x: \(location.x), y: \(location.y)")
        let kartView = sender.view!
        kartView.center = location
    }
    @IBAction func didPinchKart(_ sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        print("scale: \(scale)")
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    @IBAction func didRotateKartView(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
        print("rotation: \(rotation)")
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(rotationAngle: rotation)
    }
    @IBAction func didTapKartView(_ sender: UITapGestureRecognizer) {
        print("Double tap recognized")
        let kartView = sender.view!
        UIView.animate(withDuration: 0.6) {
            kartView.center.x += 400
        }
    }
    @IBAction func didLongPressBackground(_ sender: UILongPressGestureRecognizer) {
        UIView.animate(withDuration: 0.8) {
            self.kartView0.center = self.startingPointKartView0
            self.kartView1.center = self.startingPointKartView1
            self.kartView2.center = self.startingPointKartView2
            self.kartView0.transform = CGAffineTransform.identity
            self.kartView1.transform = CGAffineTransform.identity
            self.kartView2.transform = CGAffineTransform.identity
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        startingPointKartView0 = kartView0.center
        startingPointKartView1 = kartView1.center
        startingPointKartView2 = kartView2.center
    }


}

