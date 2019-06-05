package net.agency.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tour")
@Proxy(lazy = false)
public class Tour {

    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "increment")
    private long id;

    @NotBlank(message = "Name is required")
    @Size(min=2,max=30,message = "Name should contain from 2 to 30 symbols")
    @Column(name = "name")
    private String name;

    @Column(name = "full_price")
    private double full_price;

    @Column(name = "begin_date")
    @Temporal(TemporalType.DATE)
     private Date date_begin;

    @Column(name = "end_date")
    @Temporal(TemporalType.DATE)
     private Date date_end;

    @Column(name="filename")
    private String filename;

    @Column(name = "isActive")
    private boolean isActive;

  //  @OneToMany(cascade={  CascadeType.MERGE ,CascadeType.REMOVE,CascadeType.REFRESH, CascadeType.DETACH}, orphanRemoval = true,fetch = FetchType.EAGER)
  @OneToMany(cascade={  CascadeType.MERGE ,CascadeType.REFRESH, CascadeType.DETACH}, fetch = FetchType.EAGER)
    @JoinColumn(name = "tour_id")
    private Set<Transport> transports=new HashSet<>();

    @OneToMany(cascade={  CascadeType.MERGE ,CascadeType.REFRESH, CascadeType.DETACH}, fetch = FetchType.EAGER)
    @JoinColumn(name = "tour_id")
    private Set<Hotel> hotels=new HashSet<>();

    @ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.REFRESH}, fetch = FetchType.EAGER)
    @JoinColumn(name = "resort_id")
    private Resort resort;

    @ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.REFRESH}, fetch = FetchType.EAGER)
    @JoinColumn(name = "booking_id")
    private Booking booking;

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

    public Resort getResort() {
        return resort;
    }

    public void setResort(Resort resort) {
       this.resort = resort;
    }

    public Date getDate_end() {
        return date_end;
    }

    public void setDate_end(Date date_end) {
        this.date_end = date_end;
    }

    public Set<Hotel> getHotels() {
        return hotels;
    }

    public void setHotels(Set<Hotel> hotels)
    {
        this.hotels = hotels;
    }

    public Date getDate_begin() {
        return date_begin;
    }

    public void setDate_begin(Date date_begin) {
        this.date_begin = date_begin;
    }

    public Set<Transport> getTransports() {
        return transports;
    }

    public void setTransports(Set<Transport> transports)
    {
        this.transports = transports;

    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getFull_price() {
        return full_price;
    }

    public void setFull_price(double full_price) {
        this.full_price = full_price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Tour()
    {
     isActive=true;
    }
    public Tour(double full_price) {
    this.full_price=full_price;
      isActive=true;
     }

    @Override
    public String toString() {
        return "Tour{" +
                "id=" + id +
                ", full_price=" + full_price +
                ", date_begin=" + date_begin +
                ", date_end=" + date_end +
                '}';
    }
}


