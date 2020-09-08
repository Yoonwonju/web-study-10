package web_study_10.service;

import java.util.List;

import web_study_10.dao.DepartmentDao;
import web_study_10.dao.impl.DepartmentDaoImpl;
import web_study_10.dto.Department;

public class DepartmentService {
	private DepartmentDao departmentDao = DepartmentDaoImpl.getInstance();
	
	public List<Department> showDepartments(){
		return departmentDao.selectDepartmentByAll();
	}
	
	public int getNextNo() {
		return departmentDao.getNextNo();
	}
	
	public int addDepartment(Department department) {
		return departmentDao.insertDepartment(department);
	}
	
	public Department getDepartment(Department department) {
		return departmentDao.selectDepartmentByNo(department);
	}
	
	public int removeDepartment(Department department) {
		return departmentDao.deleteDepartment(department);
	}
	
	public int modifyDepartment(Department department) {
		return departmentDao.updateDepartment(department);
	}
}
