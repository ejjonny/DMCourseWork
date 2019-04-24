import Cocoa

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    
    func itemFor(row: Int, column: Int) -> String
}

func printTable(_ dataSource: TabularDataSource & CustomStringConvertible) {
    print("Table: \(dataSource.description)")
    
    // Create first row containing column headers
    var firstRow = "|"
    
    // Keep track of the width of each column
    var columnWidths = [Int]()
    var maxCount = Int()
    
    for column in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: column)
        var columnContent = [String]()
        for i in 0 ..< dataSource.numberOfRows {
            columnContent.append(dataSource.label(forColumn: column))
            columnContent.append(dataSource.itemFor(row: i, column: column))
        }
        if let max = columnContent.max(by: {$1.count > $0.count}) {
            maxCount = max.count
        }
        
        columnWidths.append(maxCount)
        let paddingNeeded = maxCount - columnLabel.count
        let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
        firstRow += " \(padding)\(columnLabel) |"
    }
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        // Start the output string
        var out = "|"
        
        // Append each item int his row to the string
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            let paddingNeeded = columnWidths[j] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += " \(padding)\(item) |"
        }
        
        // Done - print it!
        print(out)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department (\(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years of Experience"
        default: fatalError("Invalid Column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people [row]
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid Column!")
        }
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Joe", age: 10000000000, yearsOfExperience: 6000000000000))
department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))
printTable(department)
