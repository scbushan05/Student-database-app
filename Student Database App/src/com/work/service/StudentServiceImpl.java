package com.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.work.dao.StudentDAO;
import com.work.entity.ComboTable;
import com.work.entity.Department;
import com.work.entity.Student;
import com.work.entity.StudentSearch;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	StudentDAO studentDAO;
	
	@Override @Transactional
	public List<StudentSearch> getStudents() {
		return studentDAO.getStudents(); 
	}

	@Override @Transactional
	public void saveStudentObject(Student student) {
		studentDAO.saveStudentObject(student);
	}

	@Override @Transactional
	public List<ComboTable> getListOfStates() {
		return studentDAO.getListOfStates();
	}

	@Override @Transactional
	public Student getStudent(int theId) {
		return studentDAO.getStudent(theId);
	}

	@Override @Transactional
	public void deleteStudentObj(int theId) {
		studentDAO.deleteStudentObj(theId);
	}

	@Override @Transactional
	public List<ComboTable> getListOfCity(String tableField) {
		return studentDAO.getListOfCity(tableField);
	}

	@Override @Transactional
	public List<StudentSearch> getListOfStudents(Student studentObj) {
		return studentDAO.getListOfStudents(studentObj);
	}

	@Override @Transactional
	public List<Student> getLoginDetails(Student studentObj) {
		return studentDAO.getLoginDetails(studentObj);
	}

	@Override @Transactional
	public boolean isUsernameExists(String userName) {
		return studentDAO.isUsernameExists(userName);
	}

	@Override @Transactional
	public List<Department> getDepartmentList() {
		return studentDAO.getDepartmentList();
	}

	@Override @Transactional
	public List<ComboTable> getSkillsList() {
		return studentDAO.getSkillsList();
	}
}
