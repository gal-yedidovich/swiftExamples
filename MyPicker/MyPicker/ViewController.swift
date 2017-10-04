import UIKit
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    //how many components (slots) in picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1;
    }
    //how many rows in each component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10;
    }
    //title for each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Bubu \(row)";
    }
}
