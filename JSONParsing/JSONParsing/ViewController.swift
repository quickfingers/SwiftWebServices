//
//  ViewController.swift
//  JSONParsing
//
//  Created by Efthemios Suyat on 7/31/15.
//  Copyright (c) 2015 Efthemiosprime. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var fileError, jsonError: NSError?
        
        var jsonData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("players", ofType: "json")!, options:nil, error: &fileError)
        if let err = fileError 
        {
            println("Error: Could not load JSON file: \(fileError?.localizedDescription)")
            return
        }
        
        var json = JSONParser.parse(jsonData!, error: &jsonError)
        
        if let j = json {
            println(j[0]?["name"]?.stringValue)
            println(j[0]?["number"]?.intValue)
        } else {
            println("Error: Could not parse JSON. \(jsonError?.localizedDescription)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

