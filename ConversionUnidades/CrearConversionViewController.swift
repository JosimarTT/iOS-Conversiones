//
//  CrearTareaViewController.swift
//  Tareas
//
//  Created by Josimar on 4/11/19.
//  Copyright © 2019 Josimar. All rights reserved.
//

import UIKit

class CrearConversionViewController: UIViewController {
    
    
    @IBOutlet weak var txtNombreTarea: UITextField!
    @IBOutlet weak var txtTeoria1: UITextField!
    @IBOutlet weak var txtUnidadFinal: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func toDouble(from textField: UITextField) -> Double {
        guard let text = textField.text, let number = Double(text) else {
            return 0
        }
        return number
    }

    @IBAction func agregar(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let tarea = Tarea(context: context)
        
        tarea.numeroInicial = toDouble(from: txtNombreTarea)
        tarea.unidadInicial = txtTeoria1.text!
        tarea.unidadFinal = txtUnidadFinal.text!
        if tarea.unidadInicial == "m" {
            if tarea.unidadFinal == "Km" {
                tarea.numeroFinal = tarea.numeroInicial * 1000
            } else {
                tarea.numeroFinal = tarea.numeroInicial * 1.0936
            }
        } else if tarea.unidadInicial == "Km" {
            if tarea.unidadFinal == "m" {
                tarea.numeroFinal = tarea.numeroInicial * 0.001
            } else {
                tarea.numeroFinal = tarea.numeroInicial * 1093.61
            }
        } else {
            if tarea.unidadFinal == "m" {
                tarea.numeroFinal = tarea.numeroInicial * 0.9144
            } else {
                tarea.numeroFinal = tarea.numeroInicial * 0.0009144
            }
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
}
