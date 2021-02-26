//
//  AddItem.swift
//  MemoAppAppleWatch WatchKit Extension
//
//  Created by emm on 25/02/2021.
//

import SwiftUI

struct AddItem: View {
    
    @State var memoText = ""
    
    // getting context from environment...
    @Environment(\.managedObjectContext) var context
    
    // presentation...
    @Environment(\.presentationMode) var presentation
    
    // edith memo...
    var memoItem: Memo?
    
    var body: some View {
        VStack(spacing: 15){
            TextField("Memories...", text: $memoText)
            
            Button(action: addMemo, label: {
                Text("Save")
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color("orange"))
                    .cornerRadius(15)
            })
            .padding(.horizontal)
            .buttonStyle(PlainButtonStyle())
            .disabled(memoText == "")
        }
        .navigationTitle("\(memoItem == nil ? "Add Memo" : "Update")")
        .onAppear(perform: {
            // verifying if memo item has data...
            if let memo = memoItem{
                memoText = memo.title ?? ""
            }
        })
    }
    
    // adding memo...
    func addMemo() {
        let memo = memoItem == nil ? Memo(context: context) : memoItem!
        
        memo.title = memoText
        memo.dateAdded = Date()
        
        // saving...
        do {
            try context.save()
            // if succes...
            // closing view...
            presentation.wrappedValue.dismiss()
            
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
}







struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddItem()
    }
}
