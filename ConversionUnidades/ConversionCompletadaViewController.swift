//
//  TareaCompletadaViewController.swift
//  Tareas
//
//  Created by Josimar on 4/12/19.
//  Copyright © 2019 Josimar. All rights reserved.
//

import UIKit

class ConversionCompletadaViewController: UIViewController {


    
    var tarea : Tarea? = nil

    @IBOutlet weak var txtTeoria1: UILabel!
    @IBOutlet weak var txtTeoria2: UILabel!
    @IBOutlet weak var txtTeoria3: UILabel!
    @IBOutlet weak var txtPromTeoria: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtTeoria1.text = String(tarea!.numeroInicial)
        txtTeoria2.text = tarea!.unidadInicial
        txtTeoria3.text = String(tarea!.numeroFinal)
        txtPromTeoria.text = tarea!.unidadFinal
    }
    
    @IBAction func completarTarea(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(tarea!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
}
