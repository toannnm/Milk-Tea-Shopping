/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author toanm
 */
public class Product {

    private String productID;
    private String name;
    private int price;
    private int quantity;
    private String image;
    private String categoryID;

    public Product() {
    }

    public Product(String productID, String name, int price, int quantity, String image, String categoryID) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.categoryID = categoryID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", image=" + image + ", categoryID=" + categoryID + '}';
    }

    

 

}
