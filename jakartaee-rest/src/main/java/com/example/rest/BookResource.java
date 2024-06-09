package com.example.rest;

import com.example.model.Book;
import com.example.service.BookService;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;

@Path("/books")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class BookResource {

    @Inject
    private BookService service;

    @POST
    public Response createBook(Book book) {
        service.createBook(book);
        return Response.status(Response.Status.CREATED).entity(book).build();
    }

    @GET
    @Path("/{id}")
    public Response getBook(@PathParam("id") Long id) {
        Book book = service.findBook(id);
        if (book == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(book).build();
    }

    @GET
    public List<Book> getAllBooks() {
        return service.findAllBooks();
    }

    @PUT
    @Path("/{id}")
    public Response updateBook(@PathParam("id") Long id, Book book) {
        book.setId(id);
        Book updatedBook = service.updateBook(book);
        return Response.ok(updatedBook).build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteBook(@PathParam("id") Long id) {
        service.deleteBook(id);
        return Response.noContent().build();
    }
}
