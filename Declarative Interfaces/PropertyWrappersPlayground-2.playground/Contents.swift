import UIKit

@propertyWrapper
class UrlEncode {
    
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set {
            if let url = newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                self.value = url
            }
        }
    }
    
}

struct Resource {
    
    @UrlEncode
    var city: String
    
    var url: String {
        "https://samples.openweathermap.org/data/2.5/weather?q=\(city)&appid=b6907d289e10d714a6e88b30761fae22"
    }
    
}

extension Resource {
    init(city: String) {
        self.city = city
    }
}

var resource = Resource(city: "Los Angelos")
print(resource.city)

print(resource.url)
