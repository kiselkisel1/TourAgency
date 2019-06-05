package net.agency.service;

import net.agency.model.Resort;

import java.util.List;

public interface ResortService {
    List<Resort> getAll();
    List<Resort> getAllActive();
    Resort getOne(long id);
    void edit(Resort resort);
    void delete(long id);
    Resort add(Resort resort);
    Resort getByName(String name);
    void checkActive();
    boolean IsActiveResorts(List<Resort> resorts);
}
