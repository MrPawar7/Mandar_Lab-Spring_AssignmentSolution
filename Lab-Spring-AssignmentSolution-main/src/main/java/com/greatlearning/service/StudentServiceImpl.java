package com.greatlearning.service;

import java.util.List;

import com.greatlearning.entity.Student;
import com.greatlearning.repository.StudentRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements IStudentService {

	@Autowired
	StudentRepository studentRepository;

	@Override
	public List<Student> findAll() {
		List<Student> students = studentRepository.findAll();
		return students;
	}

	@Override
	public Student findById(int id) {
		Student student = studentRepository.findById(id).get();
		return student;
	}

	@Override
	public void save(Student student) {
		studentRepository.save(student);

	}

	@Override
	public void deleteById(int id) {
		studentRepository.deleteById(id);
	}

	@Override
	public List<Student> searchBy(String firstname, String course) {
		List<Student> students = studentRepository.findByFirstnameAndCourse(firstname, course);
		return students;
	}

}
