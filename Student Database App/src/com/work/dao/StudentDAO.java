package com.work.dao;

import java.util.List;

import com.work.entity.ComboTable;
import com.work.entity.Department;
import com.work.entity.Student;
import com.work.entity.StudentSearch;

public interface StudentDAO {

	public List<StudentSearch> getStudents();

	public void saveStudentObject(Student student);

	public List<ComboTable> getListOfStates();

	public Student getStudent(int theId);

	public void deleteStudentObj(int theId);

	public List<ComboTable> getListOfCity(String tableField);

	public List<StudentSearch> getListOfStudents(Student studentObj);

	public List<Student> getLoginDetails(Student studentObj);

	public boolean isUsernameExists(String userName);

	public List<Department> getDepartmentList();

	public List<ComboTable> getSkillsList();

}
