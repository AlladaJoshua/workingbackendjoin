package com.example.sandboxv2.sandboxv2.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.sandboxv2.sandboxv2.entity.Course;

public interface CourseRepository extends JpaRepository<Course, Long>{
    List<Course> findAll();

    Optional<Course> findById(Long courseId);
}
