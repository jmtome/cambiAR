//
//  ViewController.swift
//  CambiAR
//
//  Created by Gonzalo Yagci on 7/1/15.
//  Copyright (c) 2015 SpaceTimeContinuum Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//labels de USD
    @IBOutlet weak var usdCO: UILabel!
    @IBOutlet weak var usdCB: UILabel!
    @IBOutlet weak var usdVO: UILabel!
    @IBOutlet weak var usdVB: UILabel!
    @IBOutlet weak var usdA: UILabel!
    @IBOutlet weak var usdT: UILabel!
    @IBOutlet weak var usdDate: UILabel!
    
    let ahorro = 1.20
    let tarjeta = 1.35
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//APIS ACTIVAS DE PARSEO
        
getCurrencyCompra("https://www.kimonolabs.com/api/dwb2beuc?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
getCurrencyVenta("https://www.kimonolabs.com/api/2psnx9z0?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
        
    }

    
/*
BIBLIOTECA DE APIS
        
(1) FXRATES (todas las monedas)
https://www.kimonolabs.com/api/2w9d41gi?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o
(2) AMBITO USD (valores de Compra de USD y de Referencia para Ahorro y Tarjeta)
https://www.kimonolabs.com/api/dwb2beuc?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o
(3) PARALELOv  (valores de Venta de USD, EUR, GBP, BRL Oficial, Blue y Tarjeta)
https://www.kimonolabs.com/api/2psnx9z0?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o
(4) AMBITO varios paises (EUR, LIBRA?, REAL, UYU, CLP, etc)
https://www.kimonolabs.com/api/3uq4dggw?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o
*/
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


// funcion obtiene valores de compra de AMBITO (2)
    func getCurrencyCompra(urlString: String){
        let url = NSURL(string: urlString)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setLabelsCompra(data)
            })
        }
        task.resume()
    }
    
// funcion obtiene valores de venta de PARALELO (3)
    func getCurrencyVenta(urlString: String){
        let url = NSURL(string: urlString)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setLabelsVenta(data)
            })
            
        }
        task.resume()
    }

    
// funcion que mete los valores de Compra Oficial USD (sacados de getCurrencyCompra - AMBITO)
    
    func setLabelsCompra(currencyData: NSData){
        let json = JSON(data: currencyData)
        for index in 0...json["count"].intValue {
            if json["results"]["USDcref"][index]["tipoUSD"]["text"].stringValue == "OFICIAL" {
                usdCO.text = json["results"]["USDcref"][index]["CompraUSD"].stringValue                 //COMPRA OFICIAL
                usdDate.text = json["results"]["USDcref"][index]["fechaUSD"].stringValue                //ASIGNA FECHA UPDATE
            }
            if json["results"]["USDcref"][index]["tipoUSD"]["text"].stringValue == "INFORMAL" {
                usdCB.text = json["results"]["USDcref"][index]["CompraUSD"].stringValue                 //COMPRA BLUE
            }
        }
    }
// funcion que mete los valores de Venta USD (sacados de getCurrencyVenta - PARALELO)
    func setLabelsVenta(currencyVenta: NSData){
        
        let json = JSON(data: currencyVenta)
        for index in 0...json["count"].intValue {
            if json["results"]["mainM"][index]["TipoM"].stringValue == "DÓLAR OFICIAL" {
                usdVO.text = json["results"]["mainM"][index]["valorM"].stringValue                      //VENTA OFICIAL
                usdA.text = "\(round(1000*(usdVO.text! as NSString).doubleValue * ahorro)/1000)"                         //VENTA AHORRO
                usdT.text = "\(round(1000*(usdVO.text! as NSString).doubleValue * tarjeta)/1000)"                       //VENTA TARJETA
                    }
            if json["results"]["mainM"][index]["TipoM"].stringValue == "DÓLAR BLUE" {
                usdVB.text = json["results"]["mainM"][index]["valorM"].stringValue                      //VENTA BLUE
            }
            
        }
    }
    
}