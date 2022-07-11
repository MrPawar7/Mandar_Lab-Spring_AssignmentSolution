package com.greatlearning.controller;

import java.security.Principal;
import java.util.List;

import com.greatlearning.entity.Student;
import com.greatlearning.service.IStudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/students")
public class StudentController {

	@Autowired
	private IStudentService studentService;

	@RequestMapping("/list")
	public String listStudents(Model model) {
		List<Student> students = studentService.findAll();
		model.addAttribute("Students", students);
		return "list-students";
	}

	@RequestMapping("/showFormForAdd")
	public String showFormForAdd(Model model) {
		Student student = new Student();
		model.addAttribute("Student", student);
		return "student-form";
	}

	@RequestMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("studentId") int id, Model model) {
		Student student = studentService.findById(id);
		model.addAttribute("Student", student);
		return "student-form";
	}

	@PostMapping("/save")
	public String saveStudent(@RequestParam("id") int id, @RequestParam("firstname") String firstname,
			@RequestParam("lastname") String lastname, @RequestParam("course") String course,
			@RequestParam("country") String country) {
		Student student;
		if (id != 0) {
			student = studentService.findById(id);
			student.setFirstname(firstname);
			student.setLastname(lastname);
			student.setCourse(course);
			student.setCountry(country);
		} else {
			student = new Student(firstname, lastname, course, country);
		}
		studentService.save(student);

		return "redirect:/students/list";
	}

	@RequestMapping("/delete")
	public String deleteStudent(@RequestParam("studentId") int id) {
		studentService.deleteById(id);
		return "redirect:/students/list";
	}

	@RequestMapping("/search")
	public String search(@RequestParam("firstname") String firstname, @RequestParam("course") String course,
			Model model) {
		if (firstname.trim().isEmpty() && course.trim().isEmpty()) {
			return "redirect:/students/list";
		} else {
			List<Student> students = studentService.searchBy(firstname, course);
			model.addAttribute("Students", students);
			return "list-students";
		}
	}

	@RequestMapping("/403")
	public ModelAndView accessDenied(Principal user) {
		ModelAndView model = new ModelAndView();
		if (user != null) {
			model.addObject("msg", "Hi, " + user.getName() + ", you do not have permission to access this page!");
		} else {
			model.addObject("msg", "You do not have permission to access this page");
		}

		model.setViewName("403");
		return model;
	}

}
