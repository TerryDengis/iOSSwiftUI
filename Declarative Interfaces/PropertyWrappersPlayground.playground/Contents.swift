import UIKit

@propertyWrapper
class UpperCase {
    
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set {
            value = newValue.uppercased()
        }
    }
    
}

struct Driver {
    
    @UpperCase
    var license: String
    
    @UpperCase
    var state: String
    
}

extension Driver {
    
    init(license: String) {
        self.license = license
    }
    
}

var driver = Driver(license: "ert567")
driver.state = "tx"

print(driver.license)
print(driver.state)
