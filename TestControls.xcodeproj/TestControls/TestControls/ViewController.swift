//
//  ViewController.swift
//  TestControls
//
//  Created by Sowrirajan S on 31/01/18.
//  Copyright © 2018 Sowrirajan S. All rights reserved.
//
import UIKit
import CoreLocation
@objcMembers class ViewController: UIViewController {
    let subView = UIView()
    let firstQuestionLabel = UILabel()
    let firstAnswerTextField = UITextField()
    let secondQuestionLabel = UILabel()
    let secondAnswerTextField = UITextField()
    let thirdQuestionLabel = UILabel()
    let thirdAnswerTextField = UITextField()
    let fourthQuestionLabel = UILabel()
    let fourthAnswerTextField = UITextField()
    let fifthQuestionLabel = UILabel()
    let fifthAnswerTextField = UITextField()
    var constraint: Constraints!
    override func viewDidLoad() {
        print("viewDidLoad")
        
        // MARK: 1
        var cars: [Car] = []
        
        // Perungalathur
        var location = CarLocation(location: CLLocation(latitude: 12.902443, longitude: 80.093274))
        var car = Car(brandName: "Jaguar", regNumber: 1111, location: location)
        cars.append(car)
        
        // Pallavaram
        location = CarLocation(location: CLLocation(latitude: 12.967081, longitude: 80.149560))
        car = Car(brandName: "Swift", regNumber: 3333, location: location)
        cars.append(car)
        
        // Post office, Chrompet
        location = CarLocation(location: CLLocation(latitude: 12.952143, longitude: 80.140296))
        car = Car(brandName: "RollsRoyce", regNumber: 7777, location: location)
        cars.append(car)
        
        // 1
        // Input Coordinates (IICT Training Institute, Chrompet)
        let inputLocation = CLLocation(
            latitude: 12.953852,
            longitude: 80.141283
        )
        
        for car in cars {
            let distance = getDistance(from: inputLocation, to: car.location.location)
            if distance <= 1 {
                print("-------within 1 KM nearby car-------")
                print(car.brandName)
                print(car.registrationNumber)
                print(car.location)
            }
        }
        
        // MARK: 3
        let string: String = "Hi,Hello,How are you!"
        print("Result ", string.components(separatedBy: ","))
        
        
        // MARK: 4
        let student = Pupils()
        student.students = [
            Student(name: "Raja", country: "India"),
            Student(name: "Siva", country: "India"),
            Student(name: "Kala", country: "India"),
            Student(name: "Hirh", country: "Japan"),
            Student(name: "JYh", country: "Arabia"),
            Student(name: "Rahul", country: "Pakistan"),
            Student(name: "Dami", country: "Eeran"),
        ]
        let country = student.students.filter { $0.country == "India" }
        let studentFilter = country.compactMap { $0.name }
        print("studentFilter ", studentFilter)
        
        
        // MARK: 5
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        let rupeesInWords = numberFormatter.string(from: 100000)
        print(rupeesInWords!)
        
        // 6
        let nameArray = ["Ravindhar", "Guru", "Firas"]
        let addressArray = ["1/155, Chennai", "7/757, Kovai", "5/777, Deheli"]
        let details = GenerateNameWithAddress(names: nameArray, address: addressArray)
        print("details ", details)
        
        // 7
        enum ArithmaticOperations:Int {
            case addtion = 1
            case subtraction
            case multiplication
            case division
            
            func calculate(inputOne: Int, inputTwo: Int) -> Int {
                if self == .addtion {
                    return (inputOne + inputTwo)
                } else if self == .subtraction{
                    return (inputOne - inputTwo)
                } else if self == .multiplication{
                    return (inputOne * inputTwo)
                } else if self == .division{
                    return (inputOne / inputTwo)
                }
                return 0
            }
        }
        let maths_Add = ArithmaticOperations(rawValue: 1)?.calculate(inputOne: 7, inputTwo: 3)
        print("Addtion Result ==>>", maths_Add ?? 0)
        
        let maths_Subtract = ArithmaticOperations(rawValue: 2)?.calculate(inputOne: 7, inputTwo: 3)
        print("Subtraction Result ==>>", maths_Subtract ?? 0)
        
        let maths_Multiply = ArithmaticOperations(rawValue: 3)?.calculate(inputOne: 7, inputTwo: 3)
        print("Muliplication Result ==>>", maths_Multiply ?? 0)
        
        let maths_Division = ArithmaticOperations(rawValue: 4)?.calculate(inputOne: 7, inputTwo: 3)
        print("Division Result ==>>", maths_Division ?? 0)
        
        
        // MARK: 8
        let employe = Company("Raj", 7, "ECE")
        var employeeSet = Set<String>() // https://www.programiz.com/swift-programming/sets
        var employeeDictionary = [[String:Int]]()
        for _ in 0..<7 {
            employe.employeeName = "Raj"
            employe.idValue = 777
            employe.designation = "iOS Developer"
            employe.department = "Mobility"
            employeeSet.insert(employe.employeeName)
            employeeDictionary.append([employe.employeeName: employe.idValue])
        }
        print("employe ", employeeSet.count)
        print("employe Dict", employeeDictionary.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        allocateConstraintView()
    }
    
    
    fileprivate func GenerateNameWithAddress(names: [String], address: [String]) -> NSMutableDictionary {
        let dictionary = NSMutableDictionary()
        for index in 0..<names.count {
            dictionary[names[index]] = address[index]
        }
        return dictionary
    }
    fileprivate func getDistance(from: CLLocation, to: CLLocation) -> Float {
        let kiloMeter:Float = (Float(to.distance(from: from))) / 1000
        return kiloMeter
    }
    
    
    func allocateConstraintView() {
        
        subView.backgroundColor = .black
        self.view.addSubview(subView)
        
        subView.translatesAutoresizingMaskIntoConstraints = false
        let horizontal = NSLayoutConstraint(item: subView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let vertical = NSLayoutConstraint(item: subView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: subView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: view.frame.size.width - 40)
        let height = NSLayoutConstraint(item: subView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: view.frame.size.height - 100)
        view.addConstraints([horizontal, vertical, width, height])
        
        firstQuestionLabel.text = "I. What is your name"
        firstQuestionLabel.textColor = .white
        firstQuestionLabel.numberOfLines = 0
        firstQuestionLabel.lineBreakMode = .byWordWrapping
        subView.addSubview(firstQuestionLabel)
        
        
        //================ 1st question

        firstQuestionLabel.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: firstQuestionLabel, attribute: .leading, relatedBy: .equal, toItem: subView, attribute: .leading, multiplier: 1, constant: 20)
        let trailing = NSLayoutConstraint(item: firstQuestionLabel, attribute: .trailing, relatedBy: .equal, toItem: subView, attribute: .trailing, multiplier: 1, constant: -20)
        let top = NSLayoutConstraint(item: firstQuestionLabel, attribute: .top, relatedBy: .equal, toItem: subView, attribute: .top, multiplier: 1, constant: 10)
        subView.addConstraints([leading, trailing, top])
        
        
        subView.addSubview(firstAnswerTextField)
        firstAnswerTextField.backgroundColor = .groupTableViewBackground
        firstAnswerTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstAnswerTextField.topAnchor.constraint(equalTo: firstQuestionLabel.bottomAnchor),
            firstAnswerTextField.leadingAnchor.constraint(equalTo: firstQuestionLabel.leadingAnchor),
            firstAnswerTextField.trailingAnchor.constraint(equalTo: firstQuestionLabel.trailingAnchor),
            firstAnswerTextField.heightAnchor.constraint(equalTo: firstQuestionLabel.heightAnchor)
            ])
        
        
        //================ 2nd question

        secondQuestionLabel.text = "II. How old are you?"
        secondQuestionLabel.textColor = .white
        secondQuestionLabel.numberOfLines = 0
        secondQuestionLabel.lineBreakMode = .byWordWrapping
        subView.addSubview(secondQuestionLabel)
        
        secondQuestionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondQuestionLabel.topAnchor.constraint(equalTo: firstAnswerTextField.bottomAnchor, constant: 5),
            secondQuestionLabel.leadingAnchor.constraint(equalTo: firstQuestionLabel.leadingAnchor),
            secondQuestionLabel.trailingAnchor.constraint(equalTo: firstAnswerTextField.trailingAnchor),
            ])
        
        
        subView.addSubview(secondAnswerTextField)
        secondAnswerTextField.backgroundColor = .groupTableViewBackground
        secondAnswerTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondAnswerTextField.topAnchor.constraint(equalTo: secondQuestionLabel.bottomAnchor, constant: 5),
            secondAnswerTextField.leadingAnchor.constraint(equalTo: secondQuestionLabel.leadingAnchor),
            secondAnswerTextField.trailingAnchor.constraint(equalTo: secondQuestionLabel.trailingAnchor),
            secondAnswerTextField.heightAnchor.constraint(equalTo: secondQuestionLabel.heightAnchor)
            ])
        
        
        //================ 3rd question
        
        thirdQuestionLabel.text = "III. Your favourite color?"
        thirdQuestionLabel.textColor = .white
        thirdQuestionLabel.numberOfLines = 0
        thirdQuestionLabel.lineBreakMode = .byWordWrapping
        subView.addSubview(thirdQuestionLabel)
        
        thirdQuestionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdQuestionLabel.topAnchor.constraint(equalTo: secondAnswerTextField.bottomAnchor, constant: 10),
            thirdQuestionLabel.leadingAnchor.constraint(equalTo: secondAnswerTextField.leadingAnchor),
            thirdQuestionLabel.trailingAnchor.constraint(equalTo: secondAnswerTextField.trailingAnchor)
            ])
        
        
        subView.addSubview(thirdAnswerTextField)
        thirdAnswerTextField.backgroundColor = .groupTableViewBackground
        thirdAnswerTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdAnswerTextField.topAnchor.constraint(equalTo: thirdQuestionLabel.bottomAnchor, constant: 5),
            thirdAnswerTextField.leadingAnchor.constraint(equalTo: thirdQuestionLabel.leadingAnchor),
            thirdAnswerTextField.trailingAnchor.constraint(equalTo: thirdQuestionLabel.trailingAnchor),
            thirdAnswerTextField.heightAnchor.constraint(equalTo: thirdQuestionLabel.heightAnchor)
            ])
        
        //================ 4th question
        
        fourthQuestionLabel.text = "IV. Where is your native?"
        fourthQuestionLabel.textColor = .white
        fourthQuestionLabel.numberOfLines = 0
        fourthQuestionLabel.lineBreakMode = .byWordWrapping
        subView.addSubview(fourthQuestionLabel)
        
        fourthQuestionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fourthQuestionLabel.topAnchor.constraint(equalTo: thirdAnswerTextField.bottomAnchor, constant: 10),
            fourthQuestionLabel.leadingAnchor.constraint(equalTo: thirdAnswerTextField.leadingAnchor),
            fourthQuestionLabel.trailingAnchor.constraint(equalTo: thirdAnswerTextField.trailingAnchor)
            ])
        
        
        subView.addSubview(fourthAnswerTextField)
        fourthAnswerTextField.backgroundColor = .groupTableViewBackground
        fourthAnswerTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fourthAnswerTextField.topAnchor.constraint(equalTo: fourthQuestionLabel.bottomAnchor, constant: 5),
            fourthAnswerTextField.leadingAnchor.constraint(equalTo: fourthQuestionLabel.leadingAnchor),
            fourthAnswerTextField.trailingAnchor.constraint(equalTo: fourthQuestionLabel.trailingAnchor),
            fourthAnswerTextField.heightAnchor.constraint(equalTo: fourthQuestionLabel.heightAnchor)
            ])

        
        //================ 5th question
        
        fifthQuestionLabel.text = "V. What is your favourite author?"
        fifthQuestionLabel.textColor = .white
        fifthQuestionLabel.numberOfLines = 0
        fifthQuestionLabel.lineBreakMode = .byWordWrapping
        subView.addSubview(fifthQuestionLabel)
        
        fifthQuestionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fifthQuestionLabel.topAnchor.constraint(equalTo: fourthAnswerTextField.bottomAnchor, constant: 10),
            fifthQuestionLabel.leadingAnchor.constraint(equalTo: fourthAnswerTextField.leadingAnchor),
            fifthQuestionLabel.trailingAnchor.constraint(equalTo: fourthAnswerTextField.trailingAnchor)
            ])
        
        
        subView.addSubview(fifthAnswerTextField)
        fifthAnswerTextField.backgroundColor = .groupTableViewBackground
        fifthAnswerTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fifthAnswerTextField.topAnchor.constraint(equalTo: fifthQuestionLabel.bottomAnchor, constant: 5),
            fifthAnswerTextField.leadingAnchor.constraint(equalTo: fifthQuestionLabel.leadingAnchor),
            fifthAnswerTextField.trailingAnchor.constraint(equalTo: fifthQuestionLabel.trailingAnchor),
            fifthAnswerTextField.heightAnchor.constraint(equalTo: fifthQuestionLabel.heightAnchor)
            ])

    }
    

    
}





//https://www.google.com/search?safe=strict&lei=ykn0W4zpNciEvQTArbzYBw&q=swift%20array%20of%20class%20objects&ved=2ahUKEwjbj6XYxOPeAhUHRo8KHSaKCAYQsKwBKAF6BAgBEAI&biw=1280&bih=666







