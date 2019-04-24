import UIKit

func printSeries (incrementBy incrementAmount: Int, inRange endOfRange: Int) {
    guard incrementAmount >= 1, endOfRange >= 1 else {
        print("Input is not in range")
        return
    }
    for i in incrementAmount...endOfRange where i % incrementAmount == 0 {
        print(i)
    }
}

func printPrimeNumbers (inRange endOfRange: Int) {
    guard endOfRange >= 1 else {
        print("Input is not in range")
        return
    }
    var isPrime: Bool = true
    // Iterates through numbers.
    for A in 2...endOfRange {
        // Checks whether or not each number is prime.
        isPrime = true
        for B in 2..<A where A % B == 0 {
            isPrime = false
        }
        if isPrime {
            print(A)
            isPrime = true
        }
    }
}
