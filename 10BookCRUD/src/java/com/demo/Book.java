package com.demo;

public class Book {
    private int bookId;
    private String title;
    private String author;
    private double price;
    private int quantity;
    private String isbn;
    private String publisher;
    private int editionYear;
    private int catalogueId;

    // Constructor
    public Book() {}

    // Getters and Setters
    public int getBookId() { return bookId; }
    public void setBookId(int bookId) { this.bookId = bookId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public String getIsbn() { return isbn; }
    public void setIsbn(String isbn) { this.isbn = isbn; }

    public String getPublisher() { return publisher; }
    public void setPublisher(String publisher) { this.publisher = publisher; }

    public int getEditionYear() { return editionYear; }
    public void setEditionYear(int editionYear) { this.editionYear = editionYear; }

    public int getCatalogueId() { return catalogueId; }
    public void setCatalogueId(int catalogueId) { this.catalogueId = catalogueId; }
}