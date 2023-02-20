import Fluent
import Vapor

final class Book: Model, Content {
    
    static var schema: String = "books"
    
    @ID(key: .id) var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "author")
    var author: String
    
    @Field(key: "year")
    var year: Int
    
    init() {}
    
    init(id: UUID? = nil, title: String, author: String, year: Int) {
        self.id = id
        self.title = title
        self.author = author
        self.year = year
    }
    
    
}
