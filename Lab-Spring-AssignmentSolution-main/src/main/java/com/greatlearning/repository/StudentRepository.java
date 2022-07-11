package com.greatlearning.repository;

import java.util.List;

import com.greatlearning.entity.Student;

import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student, Integer> {
	
	List<Student> findByFirstnameAndCourse(String firstname, String course);
	
}
