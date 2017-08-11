package com.work.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.work.entity.ComboTable;
import com.work.entity.Department;
import com.work.entity.Student;
import com.work.entity.StudentSearch;

@Repository
public class StudentDAOImpl implements StudentDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<StudentSearch> getStudents() {
		Session currentSession = sessionFactory.getCurrentSession();
		List<StudentSearch> theQuery = currentSession.createQuery("from StudentSearch order by firstName").list();
		return theQuery;
	}

	@Override
	public void saveStudentObject(Student student) {
		if(student.getPassword() != null){
			student.setPassword(student.getPassword());
		}else{
			student.setPassword(student.getReset());
		}
		student.setHobbies(student.getHobbies().substring(1, student.getHobbies().length()));
		student.setGender(student.getGender().substring(1, student.getGender().length()));
		student.setCity(student.getCity().substring(1, student.getCity().length()));
		sessionFactory.getCurrentSession().saveOrUpdate(student);
		
	}

	@Override
	public List<ComboTable> getListOfStates() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(ComboTable.class);
		return cr.add(Restrictions.eq("tableField", "State")).list();
	}

	@Override
	public Student getStudent(int theId) {
		Student studentObj = (Student)sessionFactory.getCurrentSession().get(Student.class, theId);
		return studentObj;
	}

	@Override
	public void deleteStudentObj(int theId) {
		Student studentObj = (Student)sessionFactory.getCurrentSession().get(Student.class, theId);
		sessionFactory.getCurrentSession().delete(studentObj);
	}

	@Override
	public List<ComboTable> getListOfCity(String tableField) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(ComboTable.class);
		return cr.add(Restrictions.eq("tableField", tableField)).list();
	}

	@Override
	public List<StudentSearch> getListOfStudents(Student studentObj) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(StudentSearch.class);
		if(studentObj.getSearch().equals("Gender"))
			cr.add(Restrictions.eq("gender", studentObj.getSecSearch()));
		if(studentObj.getSearch().equals("Hobbies"))
			cr.add(Restrictions.like("hobbies", "%"+studentObj.getSecSearch()+"%"));
		if(studentObj.getSearch().equals("State"))
			cr.add(Restrictions.like("state", "%"+studentObj.getSecSearch()+"%"));
		return cr.list();
	}

	@Override 
	public List<Student> getLoginDetails(Student studentObj) {
		String hql = "from Student s where s.userName = :userName and s.password = :password";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userName", studentObj.getUserName());
		query.setParameter("password", studentObj.getPassword());
		List<Student> results = query.list();
		return results;
	}

	@Override
	public boolean isUsernameExists(String userName) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Student.class);
		List<Student> list = cr.add(Restrictions.eq("userName", userName)).list();
		if(list.size() > 0){
			return true;
		}
		return false;
	}

	@Override
	public List<Department> getDepartmentList() {
		Session currentSession = sessionFactory.getCurrentSession();
		List<Department> theQuery = currentSession.createQuery("from Department").list();
		return theQuery;
	}

	@Override
	public List<ComboTable> getSkillsList() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(ComboTable.class);
		return cr.add(Restrictions.eq("tableField", "skills")).list();
	}
}
