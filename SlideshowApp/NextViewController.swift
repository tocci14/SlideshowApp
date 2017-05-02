//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by Hisashi Sugimoto on 2017/05/02.
//  Copyright © 2017年 tocci14. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var zoomImage: UIImageView!
    var selectedImageName :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        zoomImage.image = UIImage(named: selectedImageName!)
        zoomImage.contentMode = UIViewContentMode.scaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
