//
//  ViewController.swift
//  UIKitApp
//
//  Created by Vitaly Kuryatnik on 16.05.2020.
//  Copyright © 2020 Vitaly Kuryatnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLable: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var HideAllElements: UISwitch!
    @IBOutlet var switchLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Setup main lable
       
        mainLable.text = String(slider.value)
        mainLable.font = mainLable.font.withSize(35)
        mainLable.textAlignment = .center
        mainLable.numberOfLines = 2
        // Setup segmented control
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Setup slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .systemBlue
        
         mainLable.text = String(slider.value)
        // Setup Date Picker
        datePicker.locale = Locale(identifier: "ru_RU")
        //Локализация в соответсвии с текущими настройками системы
        //datePicker.locale = Locale.current
        
        HideAllElements.onTintColor = .red
        HideAllElements.thumbTintColor = .systemBlue
        switchLable.text = "Скрыть все элементы"
        
    }

    @IBAction func changeSegment() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLable.text = "The first segment is selected"
            mainLable.textColor = .red
        case 1:
            mainLable.text = "The second segment is selected"
            mainLable.textColor = .blue
        case 2:
            mainLable.text = "The third segment is selected"
            mainLable.textColor = .yellow
        default: break
        }
    }
    
    @IBAction func sliderAction() {
        let backgroundColor = view.backgroundColor
        view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(slider.value))
        //var roundValue = String(slider.value)
        mainLable.text = String(round(slider.value * 10 ) / 10)
        
    }
    
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {return}
        
        if let _ = Double(inputText){
            showAlert(title: "Wrong format", message: "Please enter your name")
            print("Wrong former")
        } else {
            mainLable.text = inputText
            textField.text = nil
        }
    }
    @IBAction func changeDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let dateValue = dateFormatter.string(from: datePicker.date)
        mainLable.text = dateValue
    }
    
    @IBAction func SwithAction() {
        segmentedControl.isHidden.toggle()
        mainLable.isHidden.toggle()
        slider.isHidden.toggle()
        textField.isHidden.toggle()
        doneButton.isHidden.toggle()
        datePicker.isHidden.toggle()
        
        switchLable.text = HideAllElements.isOn ? "Скрыть все элементы" : "Отобразить все элементы"
    }
}

extension ViewController{
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


