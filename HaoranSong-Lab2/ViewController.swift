//
//  ViewController.swift
//  HaoranSong-Lab2
//
//  Created by Haoran Song on 9/14/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var Dog: Pets?
    var Cat: Pets?
    var Bird: Pets?
    var Bunny: Pets?
    var Fish: Pets?
    var myPet: Pets?
    var currentPet: String = ""
    var myPetImage = UIImage.init(named: "Upload")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Dog = Pets(name:"Dog",happyInput: 0,foodInput: 2)
        Cat = Pets(name:"Cat",happyInput: 3,foodInput: 7)
        Bird = Pets(name:"Bird",happyInput: 2,foodInput: 10)
        Bunny = Pets(name:"Bunny",happyInput: 1,foodInput: 5)
        Fish = Pets(name:"Fish",happyInput: 9,foodInput: 4)
        myPet = Pets(name:"my",happyInput: -1,foodInput: -1)
        currentPet = "dog"
        let myColor = UIColor(named: "myCyan")
        let myImage = UIImage.init(named: "dog")
        initFormat(setColor: myColor!,setImage: myImage!,pet:Dog!)
        checkMyPetVaild()
    }
    
    @IBAction func playFunc(_ sender: Any) {
        if(currentPet == "dog"){
            Dog?.play()
            updateHappyView(pet:Dog!)
            updateFoodView(pet:Dog!)
        }
        if(currentPet == "cat"){
            Cat?.play()
            updateHappyView(pet:Cat!)
            updateFoodView(pet:Cat!)
        }
        if(currentPet == "fish"){
            Fish?.play()
            updateHappyView(pet:Fish!)
            updateFoodView(pet:Fish!)
        }
        if(currentPet == "bird"){
            Bird?.play()
            updateHappyView(pet:Bird!)
            updateFoodView(pet:Bird!)
        }
        if(currentPet == "bunny"){
            Bunny?.play()
            updateHappyView(pet:Bunny!)
            updateFoodView(pet:Bunny!)
        }
        if(currentPet == "mypet"){
            myPet?.play()
            updateHappyView(pet:myPet!)
            updateFoodView(pet:myPet!)
        }
    }
    
    @IBAction func feedFunc(_ sender: Any) {
        if(currentPet == "dog"){
            Dog?.feed()
            updateFoodView(pet:Dog!)
        }
        if(currentPet == "cat"){
            Cat?.feed()
            updateFoodView(pet:Cat!)
        }
        if(currentPet == "fish"){
            Fish?.feed()
            updateFoodView(pet:Fish!)
        }
        if(currentPet == "bird"){
            Bird?.feed()
            updateFoodView(pet:Bird!)
        }
        if(currentPet == "bunny"){
            Bunny?.feed()
            updateFoodView(pet:Bunny!)
        }
        if(currentPet == "mypet"){
            myPet?.feed()
            updateFoodView(pet:myPet!)
        }
    }
    
    @IBAction func myDog(_ sender: Any) {
        currentPet = "dog"
        let myColor = UIColor(named: "myCyan")
        let myImage = UIImage.init(named: "dog")
        initFormat(setColor: myColor!,setImage: myImage!,pet:Dog!)
        checkMyPetVaild()
    }
    @IBAction func myCat(_ sender: Any) {
        currentPet = "cat"
        let myColor = UIColor(named: "myRed")
        let myImage = UIImage.init(named: "cat")
        initFormat(setColor: myColor!,setImage: myImage!,pet:Cat!)
        checkMyPetVaild()
    }
    @IBAction func myBird(_ sender: Any) {
        currentPet = "bird"
        let myColor = UIColor(named: "myYellow")
        let myImage = UIImage.init(named: "bird")
        initFormat(setColor: myColor!,setImage: myImage!,pet:Bird!)
        checkMyPetVaild()
    }
    @IBAction func myBunny(_ sender: Any){
        currentPet = "bunny"
        let myColor = UIColor(named: "myGreen")
        let myImage = UIImage.init(named: "bunny")
        initFormat(setColor: myColor!,setImage: myImage!,pet:Bunny!)
        checkMyPetVaild()
    }
    @IBAction func myFish(_ sender: Any) {
        currentPet = "fish"
        let myColor = UIColor(named: "myPurple")
        let myImage = UIImage.init(named: "fish")
        initFormat(setColor: myColor!,setImage: myImage!,pet:Fish!)
        checkMyPetVaild()
    }
    
    func checkMyPetVaild(){
        petImage.isHidden = false
        uploadBtn.isHidden = true
        setView.isHidden = true
        submitBtn.isHidden = true
        if(myPet?.foodLevel == -1){
            showMy.isHidden = true
            addBtn.isHidden = false
        }else{
            showMy.isHidden = false
        }
    }
    
    
    func initFormat(setColor:UIColor,setImage:UIImage,pet:Pets){
        petImage.image = setImage
        backgroundView.backgroundColor = setColor
        happyView.color = setColor
        foodView.color = setColor
        happyLable.text = "Played: " + String(pet.happyLevel)
        feedLabel.text = "Fed: " + String(pet.foodLevel)
        happyView.value = CGFloat(Double((pet.happyLevel))/10)
        foodView.value = CGFloat(Double((pet.foodLevel))/10)
    }
    
    func updateHappyView(pet: Pets){
        happyLable.text = "Played: " + String(pet.happyLevel)
        let happyNum = Double((pet.happyLevel))/10
        happyView.animateValue(to: CGFloat(happyNum))
    }
    
    func updateFoodView(pet: Pets){
        feedLabel.text = "Fed: " + String(pet.foodLevel)
        let foodNum = Double((pet.foodLevel))/10
        foodView.animateValue(to: CGFloat(foodNum))
    }
    
    
    @IBAction func addMyPet(_ sender: Any) {
        feedBtn.isEnabled = false
        playBtn.isEnabled = false
        currentPet = "mypet"
        let myColor = UIColor(named: "myGray")
        let myImage = UIImage.init(named: "Upload")
        initFormat(setColor: myColor!,setImage: myImage!,pet:Bunny!)
        happyLable.text = "Played: 0"
        feedLabel.text = "Fed: 0"
        happyView.value = CGFloat(0)
        foodView.value = CGFloat(0)
        petImage.isHidden = true
        uploadBtn.isHidden = false
        setView.isHidden = false
        submitBtn.isHidden = false
        addBtn.isHidden = true
    }
    
    @IBAction func uploadImage(_ sender: Any) {
        print(1)
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker,animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        petImage.image = image
        myPetImage = image
        dismiss(animated: true)
        petImage.isHidden = false
        uploadBtn.isHidden = true
    }
    
    @IBAction func submit(_ sender: Any) {
        let happy = Int(myHappy.text ?? "0")
        let feed = Int(myFeed.text ?? "0")
        let checkHappy = wrongCheck(value: myHappy.text ?? "0")
        let checkFeed = wrongCheck(value: myFeed.text ?? "0")
        if(checkHappy && checkFeed){
            if(myPetImage == UIImage.init(named: "Upload")){
                showAlert(_message: "Invalid Image")
            }else{
                myPet?.happyLevel = happy!
                myPet?.foodLevel = feed!
                let myImage = petImage.image
                let myColor = UIColor(named: "myGray")
                initFormat(setColor: myColor!, setImage: myImage!, pet: myPet!)
                checkMyPetVaild()
                feedBtn.isEnabled = true
                playBtn.isEnabled = true
            }
        }
    }
    
    func wrongCheck(value:String) -> Bool{
        let valid = "[0-9]|10"
        let predicate = NSPredicate(format: "SELF MATCHES %@", valid)
        if !predicate.evaluate(with: value)
        {
            showAlert(_message: "Invalid Level")
            return false
        }
        return true
    }
    
    func showAlert(_message: String){
        let alert = UIAlertController(title: "Warning", message: _message, preferredStyle: UIAlertController.Style.alert)
        let btnOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(btnOK)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showMyPet(_ sender: Any) {
        currentPet = "mypet"
        let myColor = UIColor(named: "myGray")
        let myImage = myPetImage
        initFormat(setColor: myColor!,setImage: myImage!,pet:myPet!)
        checkMyPetVaild()
    }
    
    
    @IBOutlet weak var myFeed: UITextField!
    @IBOutlet weak var myHappy: UITextField!
    @IBOutlet weak var showMy: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var setView: UIStackView!
    @IBOutlet weak var uploadBtn: UIButton!
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var foodView: DisplayView!
    @IBOutlet weak var happyView: DisplayView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var happyLable: UILabel!
    @IBOutlet weak var feedLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var feedBtn: UIButton!
}

