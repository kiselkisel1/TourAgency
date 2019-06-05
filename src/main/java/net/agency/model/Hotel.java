package net.agency.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "hotel")
@Proxy(lazy=false)
public class Hotel {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank(message = "Name is required")
    @Size(min=2,max=30,message = "Name should contain from 2 to 30 symbols")
    @Column(name = "name")
    private String name;

    @NotBlank(message = "Address is required")
    @Size(min=2,max=30,message = "Address should contain from 2 to 30 symbols")
    @Column(name = "address")
    private String address;

     @Column(name = "stars")
    private int stars;

    @Column(name = "isActive")
    private boolean isActive;

    @Column(name = "isBooked")
    private boolean isBooked;

    @Column(name="filename")
    private String filename;

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public boolean isBooked() {
        return isBooked;
    }

    public void setBooked(boolean booked) {
        isBooked = booked;
    }

    public Hotel() {
        isActive=true;
    }

    public Hotel(@NotBlank(message = "Name is required") @Size(min = 2, max = 30, message = "Name should contain from 2 to 30 symbols") String name, @NotBlank(message = "Address is required") @Size(min = 5, max = 30, message = "Address should contain from 2 to 30 symbols") String address, int stars, boolean isFree) {
        this.name = name;
        this.address = address;
        this.stars = stars;
     }

    @Override
    public String toString() {
        return "Hotel{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", stars=" + stars +
                ", isBooked=" + isBooked +
                ", isActive=" + isActive +
                ", filename='" + filename + '\'' +
                '}';
    }
}
