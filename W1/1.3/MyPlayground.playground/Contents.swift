import UIKit

class Book {
    let title: String
    let author: String
    let genre: String
    
    init(title: String, author: String, genre: String) {
        self.title = title
        self.author = author
        self.genre = genre
    }
}

extension Book: Equatable {}

func ==(lhs: Book, rhs: Book) -> Bool {
    if lhs.title == rhs.title { return false }
    if lhs.author == rhs.author { return false }
    if lhs.genre == rhs.genre { return false}
    
    return true
}

class BookShelf {
    var books = [Book]()
    
    init() {
        self.books = [
            Book(title: "Steve", author: "Stevie Wonder", genre: "Music"),
            Book(title: "Moby Dick", author: "idk", genre: "Fiction")
        ]
    }
    
    func createBook(title: String, author: String, genre: String) {
        self.books.append(Book(title: title, author: author, genre: genre))
    }
    
    func deleteBook(book: Book) {
        if let index = self.books.index(where: { $0 == book }) {
            self.books.remove(at: index)
        }
    }
}

let oldBookShelf = BookShelf()

oldBookShelf.createBook(title: "Some other old shit", author: "old motherfucker", genre: "old shit")

oldBookShelf.books
