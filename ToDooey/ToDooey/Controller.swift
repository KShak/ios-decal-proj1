import UIKit

class Controller: UIViewController {
    
    @IBOutlet weak var workPlease: UILabel!
    var rar = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        workPlease.text = rar
//        let n: Int! = self.navigationController?.viewControllers.count
//        let myUIViewController = self.navigationController?.viewControllers[n-2] as! ItemTableViewController
//        workPlease.text = String(myUIViewController.numCompleted)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMList(sender: UIStoryboardSegue) {
        print("hello d")
        if let sourceViewController = sender.source as? ItemTableViewController {
            workPlease.text = String(sourceViewController.numCompleted)
//            let newIndexPath = NSIndexPath(row: items.count, section: 0)
//            print("here")
//            print(item.completed)
//            items.append(item)
//            let cell = self.tableView.cellForRow(at: newIndexPath as IndexPath)
//            print(cell)
//            print("dawg")
//            tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
            
        }
    }

    
//    // MARK: UITextFieldDelegate
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // Hide the keyboard.
//        textField.resignFirstResponder()
//        return true
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        // This is where work should be done
//        checkValidItemName()
//    }
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        // Disable the Save button while editing.
//        saveButton.isEnabled = false
//    }
//    
//    func checkValidItemName() {
//        // Disable the Save button if the text field is empty.
//        let text = nameTextField.text ?? ""
//        saveButton.isEnabled = !text.isEmpty
//    }
//    
//    // MARK: Navigation
//    
//    @IBAction func cancel(_ sender: AnyObject) {
//        dismiss(animated: true, completion: nil)
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if saveButton === sender as! UIBarButtonItem {
//            let name = nameTextField.text ?? ""
//            item = Item(name: name)
//        }
//    }
    
    
    
}

