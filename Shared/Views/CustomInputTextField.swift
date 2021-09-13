//
//  CustomInputTextField.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/11.
//

import SwiftUI
import UIKit

struct CustomInputTextField: UIViewRepresentable {
    
    @Binding var text: String
    var keyboardType: UIKeyboardType
    private let textField = UITextField()
    
    func makeUIView(context: Context) -> UITextField {
        textField.addDoneButton()
        textField.keyboardType = keyboardType
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        self.textField.text = text
    }
    
    func makeCoordinator() -> CustomInputTextField.Coordinator {
        return Coordinator()
    }
    
    typealias UIViewType = UITextField
    
}

struct CustomInputTextField_Previews: PreviewProvider {
    @State static var testString = "test"
    static var previews: some View {
        CustomInputTextField(text: $testString, keyboardType: .numberPad)
    }
}
