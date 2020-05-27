//
//  GBPViewController.swift
//  CambiAR
//
//  Created by Gonzalo Yagci on 7/28/15.
//  Copyright (c) 2015 SpaceTimeContinuum Apps. All rights reserved.
//

import UIKit

class GBPViewController: UIViewController {

    
//labels de GBP
    @IBOutlet weak var gbpCO: UILabel!
    @IBOutlet weak var gbpVO: UILabel!
    @IBOutlet weak var gbpCB: UILabel! //nohayinfo
    @IBOutlet weak var gbpVB: UILabel!
    @IBOutlet weak var gbpA: UILabel!
    @IBOutlet weak var gbpT: UILabel!
    @IBOutlet weak var gbpDate: UILabel!
    
    let ahorro = 1.20
    let tarjeta = 1.35
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


//APIS ACTIVAS DE PARSEO
getCurrencyFXRATES("https://www.kimonolabs.com/api/2w9d41gi?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
getCurrencyVenta("https://www.kimonolabs.com/api/2psnx9z0?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// funcion obtiene valores de FXRATES
func getCurrencyFXRATES(urlString: String){
    let url = NSURL(string: urlString)
    
    var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
        dispatch_async(dispatch_get_main_queue(), {
            self.setLabelsFXRATES(data)
        })
    }
    task.resume()
    }

// funcion obtiene valores de venta de PARALELO
func getCurrencyVenta(urlString: String){
    let url = NSURL(string: urlString)
    
    var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
        dispatch_async(dispatch_get_main_queue(), {
            self.setLabelsVenta(data)
            })
            
        }
        task.resume()
        }

    
    
func setLabelsFXRATES(currencyVenta: NSData){
    
    let json = JSON(data: currencyVenta)
    for index in 0...json["count"].intValue {
        if json["results"]["FXRATES"][index]["Paridad"].stringValue == "GBP/ARS" {
            gbpCO.text = json["results"]["FXRATES"][index]["Compra"].stringValue                     //COMPRA OFICIAL
            gbpVO.text = json["results"]["FXRATES"][index]["Venta"].stringValue                      //VENTA OFICIAL
            gbpA.text = "\((gbpVO.text! as NSString).doubleValue * ahorro)"                         //VENTA AHORRO
            gbpT.text = "\((gbpVO.text! as NSString).doubleValue * tarjeta)"                        //VENTA TARJETA
        }
        
    }

    }



func setLabelsVenta(currencyVenta: NSData){
    
    let json = JSON(data: currencyVenta)
    for index in 0...json["count"].intValue {
        if json["results"]["mainM"][index]["TipoM"].stringValue == "LIBRA EST. BLUE" {
            gbpVB.text = json["results"]["mainM"][index]["valorM"].stringValue                      //VENTA BLUE
        }
        
    }
}
}
