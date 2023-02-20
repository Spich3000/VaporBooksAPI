import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    let booksCOntroller = BooksController()
    try app.register(collection: booksCOntroller)
    
    /*
     
     Old routes!
     
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    // Save book
    app.post("api") { req -> EventLoopFuture<Book> in
        let book = try req.content.decode(Book.self)
        return book.save(on: req.db).map({ book })
    }
    
    // Get all books
    app.get("api") { req -> EventLoopFuture<[Book]> in
        return Book.query(on: req.db).all()
    }
    
    // Get book with ID
    app.get("api", ":bookID") { req -> EventLoopFuture<Book> in
         Book.find(req.parameters.get("bookID"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
    
    // Update book
    app.put("api", ":bookID") { req -> EventLoopFuture<Book> in
        // Create new book
        let updatedBook = try req.content.decode(Book.self)
        // Find book that needs to be updated
        let book = Book.find(req.parameters.get("bookID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { book in
                book.title = updatedBook.title
                book.author = updatedBook.author
                book.year = updatedBook.year
                
                return book.save(on: req.db).map({book})
            }
        return book
    }
    
    // Delete book with ID
    app.delete("api", ":bookID") { req -> EventLoopFuture<HTTPStatus> in
        Book.find(req.parameters.get("bookID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { book in
                book.delete(on: req.db)
                    .transform(to: .noContent)
            }
    }
*/
}


// 940310A4-938D-491E-AAEF-70653A909C97
