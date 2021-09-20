//
//  CustomInputTextField.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/11.
//

import SwiftUI
import UIKit

struct CustomInputTextField: UIViewRepresentable {
    
    var placeHolder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType
    private let textField = UITextField()
    
    func makeUIView(context: Context) -> UITextField {
        textField.addDoneButton()
        textField.keyboardType = keyboardType
        textField.delegate = context.coordinator
        textField.placeholder = placeHolder
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomInputTextField
        init(_ textField: CustomInputTextField) {
            self.parent = textField
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let currentValue = textField.text as NSString? {
                let proposedValue = currentValue.replacingCharacters(in: range, with: string) as String
                self.parent.text = proposedValue
            }
            return true
        }
        
    }
    
    typealias UIViewType = UITextField
    
}

struct CustomInputTextField_Previews: PreviewProvider {
    @State static var testString = "test"
    static var previews: some View {
        CustomInputTextField(placeHolder: "placeholder", text: $testString, keyboardType: .numberPad)
    }
}
