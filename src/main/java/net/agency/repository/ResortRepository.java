package net.agency.repository;

import net.agency.model.Resort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ResortRepository extends JpaRepository<Resort, Long> {

    Resort findByName(String name);

    @Query(value = "select * from resort where isActive is true", nativeQuery = true)
    List<Resort> getAllByActiveIsTrue();
}
