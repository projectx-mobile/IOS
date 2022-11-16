import UIKit

var greeting = "Hello, playground"
var array1 = [4,5]
var array2 = [3,4,5,6,7,8]

for (index, value) in array1.enumerated() {
    for (index1, value1) in array2.enumerated() {
        if value == value1 {
            print("oba-na")
        } else {
            print("ha-ha")
        }
    }
}
