//
//  ViewController.swift
//  SimpleAPIClient
//
//  Created by Kouki Saito on 2014/10/19.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let sharedClient = MyClient.sharedInstance
        //sharedClient.yourAPI()
        
        
        sharedClient.fetchGithubReposFromUser("kouki-dan", success: { (task, response) in
            println(response)
            // TODO:Insert cells for repos
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

