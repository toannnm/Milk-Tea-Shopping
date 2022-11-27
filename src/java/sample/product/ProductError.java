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
public class ProductError {

    private String productID;
    private String name;
    private String price;
    private String quantity;
    private String image;
    private String categoryID;
    private String error;

    public ProductError() {
        this.productID = "";
        this.name = "";
        this.price = "";
        this.quantity = "";
        this.image = "";
        this.categoryID = "";
        this.error = "";
    }

    public ProductError(String productID, String name, String price, String quantity, String image, String categoryID, String error) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.categoryID = categoryID;
        this.error = error;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
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

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    @Override
    public String toString() {
        return "ProductError{" + "productID=" + productID + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", image=" + image + ", categoryID=" + categoryID + ", error=" + error + '}';
    }

}
