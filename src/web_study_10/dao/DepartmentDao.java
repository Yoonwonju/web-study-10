package web_study_10.dao;

import java.util.List;

import web_study_10.dto.Department;

public interface DepartmentDao {
	List<Department> selectDepartmentByAll();
	int getNextNo();
	int insertDepartment(Department department);
	Department selectDepartmentByNo(Department department);
	int deleteDepartment(Department department);
	int updateDepartment(Department department);
}
