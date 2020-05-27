//
//  ARSViewController.swift
//  CambiAR
//
//  Created by Gonzalo Yagci on 7/28/15.
//  Copyright (c) 2015 SpaceTimeContinuum Apps. All rights reserved.
//

import UIKit

class ARSViewController: UIViewController {

    @IBOutlet weak var trigo: UILabel!
    @IBOutlet weak var maiz: UILabel!
    @IBOutlet weak var soja: UILabel!
    @IBOutlet weak var oro: UILabel!
    @IBOutlet weak var liqui: UILabel!
    
    @IBOutlet weak var arsDate: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

getCurrencyUSD("https://www.kimonolabs.com/api/dwb2beuc?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
getCurrencyGRANOS("https://www.kimonolabs.com/api/8ynkwe40?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
getCurrencyORO("https://www.kimonolabs.com/api/88tijabm?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // funcion obtiene valores de #1
    func getCurrencyUSD(urlString: String){
        let url = NSURL(string: urlString)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setLabelsUSD(data)
            })
        }
        task.resume()
    }
    
    // funcion obtiene valores de #2
    func getCurrencyGRANOS(urlString: String){
        let url = NSURL(string: urlString)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setLabelsGRANOS(data)
            })
        }
        task.resume()
    }
    
    // funcion obtiene valores de #3
    func getCurrencyORO(urlString: String){
        let url = NSURL(string: urlString)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setLabelsORO(data)
            })
        }
        task.resume()
    }
    
    
    
    // funcion que mete los valores sacados de #1
    func setLabelsUSD(currencyData: NSData){
        let json = JSON(data: currencyData)
        for index in 0...json["count"].intValue {
            if json["results"]["USDcref"][index]["tipoUSD"]["text"].stringValue == "CONTADO CON LIQUIDACIÓN" {
                liqui.text = json["results"]["USDcref"][index]["CompraUSD"].stringValue
            }
        }
    }
    
    // funcion que mete los valores sacados de #2
    func setLabelsGRANOS(currencyData: NSData){
        let json = JSON(data: currencyData)
        for index in 0...json["count"].intValue {
            if json["results"]["GRANOS"][index]["Tipo"]["text"].stringValue == "Trigo" {
                trigo.text = json["results"]["GRANOS"][index]["Valor"].stringValue
            }
            if json["results"]["GRANOS"][index]["Tipo"]["text"].stringValue == "Maíz" {
                maiz.text = json["results"]["GRANOS"][index]["Valor"].stringValue
            }
            if json["results"]["GRANOS"][index]["Tipo"]["text"].stringValue == "Soja" {
                soja.text = json["results"]["GRANOS"][index]["Valor"].stringValue
            }
        }
    }
    
    // funcion que mete los valores sacados de #3
    func setLabelsORO(currencyData: NSData){
        let json = JSON(data: currencyData)
        for index in 0...json["count"].intValue {
            if json["results"]["ORO"][index]["METAL"].stringValue == "ORO INTERNACIONAL - NUEVA YORK" {
                oro.text = json["results"]["ORO"][index]["VALOR"].stringValue
            }
        }
    }
    
    
}
