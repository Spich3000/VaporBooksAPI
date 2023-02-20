//
//  File.swift
//  
//
//  Created by Дмитрий Спичаков on 20.02.2023.
//

import Vapor
import Fluent

struct BooksController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        // Group of routes
        let booksRoutes = routes.grouped("api")
        
        booksRoutes.get(use: getAllHandler)
        booksRoutes.get(":bookID", use: getHandler) // ":bookID" - dynamic parametr
        
        booksRoutes.post(use: createHandler)
        
        booksRoutes.put(":bookID", use: updateHandler)
        
        booksRoutes.delete(":bookID", use: deleteHandler)
    }
    
    // Get all books
    func getAllHandler(_ req: Request) -> EventLoopFuture<[Book]> {
        Book.query(on: req.db).all()
    }
    
    // Get book with id
    func getHandler(_ req: Request) -> EventLoopFuture<Book> {
        Book.find(req.parameters.get("bookID"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
    
    // POST book
    func createHandler(_ req: Request) throws -> EventLoopFuture<Book> {
        let book = try req.content.decode(Book.self)
        return book.save(on: req.db).map({book})
    }
    
    // UPDATE book
    func updateHandler(_ req: Request) throws -> EventLoopFuture<Book> {
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
    
    // DELETE book
    func deleteHandler(_ req: Request) -> EventLoopFuture<HTTPStatus> {
        Book.find(req.parameters.get("bookID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { book in
                book.delete(on: req.db)
                    .transform(to: .noContent)
            }
    }
    
}
