package net.agency.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "transport")
@Proxy(lazy = false)
public class Transport {
    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "increment")
    private long id;

    @NotBlank(message = "Name is required")
    @Size(min=2,max=30,message = "Name should contain from 2 to 30 symbols")
    @Column(name = "name")
    private String name;

    @NotBlank(message = "Description is required")
    @Size(min=2,max=255,message = "Description should contain from 2 to 255 symbols")
    @Column(name = "description")
    private String description;

    @Column(name = "isBooked")
    private boolean isBooked;

    @Column(name = "isActive")
    private boolean isActive;

    @Column(name="filename")
    private String filename;



    @Override
    public String toString() {
        return "Transport{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                '}';
    }


    public Transport() {
        isActive=true;
    }

    public Transport(String name, String description) {
        this.name = name;
        this.description = description;
        isBooked=false;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public boolean isBooked() {
        return isBooked;
    }

    public void setBooked(boolean booked) {
        isBooked = booked;
    }
    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
