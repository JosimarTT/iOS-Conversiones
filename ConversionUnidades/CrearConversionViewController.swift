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
   // @IBOutlet weak var txtTeoria1: UITextField!
    //@IBOutlet weak var txtUnidadFinal: UITextField!
    
    @IBOutlet weak var txtTeoria1: UISegmentedControl!
    @IBOutlet weak var txtUnidadFinal: UISegmentedControl!
    
    
    
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
        
        let uInicial : String? = txtTeoria1.titleForSegment(at: txtTeoria1.selectedSegmentIndex)
        
        let uFinal : String? =  txtUnidadFinal.titleForSegment(at: txtUnidadFinal.selectedSegmentIndex)
        
        
        tarea.numeroInicial = toDouble(from: txtNombreTarea)
        tarea.unidadInicial = uInicial
        tarea.unidadFinal = uFinal
        if tarea.unidadInicial == "m" {
            if tarea.unidadFinal == "Km" {
                tarea.numeroFinal = tarea.numeroInicial / 1000
            } else {
                tarea.numeroFinal = tarea.numeroInicial * 1.0936
            }
        } else if tarea.unidadInicial == "Km" {
            if tarea.unidadFinal == "m" {
                tarea.numeroFinal = tarea.numeroInicial * 1000
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
