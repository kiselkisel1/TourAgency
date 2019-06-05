package net.agency.model;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "resort")
@Proxy(lazy = false)
public class Resort {
    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "increment")
    private long id;

    @NotBlank(message = "Name is required")
    @Size(min=2,max=30,message = "Name should contain from 2 to 30 symbols")
    @Column(name = "name")
    private String name;

    @Column(name = "isActive")
    private boolean isActive;

//    @OneToMany(mappedBy = "resort",cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.EAGER)
@OneToMany(mappedBy = "resort",cascade={  CascadeType.MERGE ,CascadeType.REFRESH, CascadeType.DETACH}, fetch = FetchType.EAGER)
private Set<Tour> tours=new HashSet<>();

    public Resort() {
        isActive=true;
    }

    public Resort(@NotBlank(message = "Name is required") @Size(min = 2, max = 30, message = "Name should contain from 2 to 30 symbols") String name) {
        this.name = name;
    }

    public Resort(@NotBlank(message = "Name is required") @Size(min = 2, max = 30, message = "Name should contain from 2 to 30 symbols") String name, Set<Tour> tours) {
        this.name = name;
        this.tours = tours;
    }

    public Set<Tour> getTours() {
        return tours;
    }

    public void setTours(Set<Tour> tours)
    {
     //   this.tours = tours;
 this.tours.addAll(tours);
 for(Tour tour:tours){
     tour.setResort(this);
 }

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public String toString() {

        return "Resort{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", isActive='" + isActive + '\'' +
                '}';
    }
}
