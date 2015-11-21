//
//  ViewController.swift
//  AppLibros
//
//  Created by Arturo Barreto Villafán on 11/20/15.
//  Copyright © 2015 Arturo Barreto Villafán. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textViewContenidp: UITextView!
    @IBOutlet weak var claveIntroducida: UITextField!
    @IBOutlet weak var mensaje: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    func sincrono(){
        let clave = claveIntroducida.text
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(clave!)"
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        if datos == nil{
            let alercontroller = UIAlertController(title: "Warning", message: "Error en Conexión", preferredStyle: UIAlertControllerStyle.Alert)
            alercontroller.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive, handler: nil))
            
            self.presentViewController(alercontroller, animated: true, completion: nil)        }else{
            let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            textViewContenidp.text = String(texto)
        }
    }
    
    
    func comprobar(texto : UITextField){
        if texto.text == ""{
            let alercontroller = UIAlertController(title: nil, message: "Escriba un Numero", preferredStyle: UIAlertControllerStyle.Alert)
            alercontroller.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive, handler: nil))
            
            self.presentViewController(alercontroller, animated: true, completion: nil)
            
        }
        else{
           sincrono()
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    @IBAction func limpiar(sender: UIButton) {
        claveIntroducida.text = ""
        textViewContenidp.text = ""
        
    }
    

    @IBAction func Busqueda(sender: UITextField) {
        
        comprobar(sender)
        
        

 
        
            }

}

