import UIKit

var str = "Hello, playground"
var str2 = ""

for char in str {
	if String(char) != "a" && String(char) != "e" && String(char) != "i" && String(char) != "o" && String(char) != "u" && String(char) != "y" {
		str2.append(char)
	}
}

print(str2)
