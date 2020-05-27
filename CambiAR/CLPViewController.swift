//
//  CLPViewController.swift
//  CambiAR
//
//  Created by Gonzalo Yagci on 7/28/15.
//  Copyright (c) 2015 SpaceTimeContinuum Apps. All rights reserved.
//

import UIKit

class CLPViewController: UIViewController {

    
    @IBOutlet weak var clpCO: UILabel!
    @IBOutlet weak var clpVO: UILabel!
    
    @IBOutlet weak var clpA: UILabel!
    @IBOutlet weak var clpT: UILabel!
    
    @IBOutlet weak var clpDate: UILabel!
    
    let ahorro = 1.20
    let tarjeta = 1.35
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

getCurrencyVarios("https://www.kimonolabs.com/api/3uq4dggw?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // funcion obtiene valores de VARIOS
    func getCurrencyVarios(urlString: String){
        let url = NSURL(string: urlString)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setLabelsVarios(data)
            })
        }
        task.resume()
    }
    
    // funcion que mete los valores sacados de getCurrencyVarios
    func setLabelsVarios(currencyData: NSData){
        let json = JSON(data: currencyData)
        for index in 0...json["count"].intValue {
            if json["results"]["EUROoficial"][index]["Moneda"].stringValue == "CHILE - PESO" {
                clpCO.text = json["results"]["EUROoficial"][index]["Compra"].stringValue
                clpVO.text = json["results"]["EUROoficial"][index]["Venta"].stringValue
                clpA.text = "\((clpCO.text! as NSString).doubleValue * ahorro)"
                clpT.text = "\((clpVO.text! as NSString).doubleValue * tarjeta)"
            }
        }
    }
    

}
