package web_study_10.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import web_study_10.dao.DepartmentDao;
import web_study_10.ds.JndiDS;
import web_study_10.dto.Department;

public class DepartmentDaoImpl implements DepartmentDao {
	private static final DepartmentDaoImpl instance = new DepartmentDaoImpl();

	public static DepartmentDaoImpl getInstance() {
		return instance;
	}

	private DepartmentDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Department> selectDepartmentByAll() {
		String sql = "SELECT DEPT_NO, DEPT_NAME, FLOOR FROM DEPARTMENT";
		try(Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				ArrayList<Department> list = new ArrayList<Department>();
				do {
					list.add(getDept(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	private Department getDept(ResultSet rs) throws SQLException {
		int deptNo = rs.getInt("DEPT_NO");
		String deptName = rs.getString("DEPT_NAME");
		int deptFloor = rs.getInt("FLOOR");
		return new Department(deptNo, deptName, deptFloor);
	}

	@Override
	public int getNextNo() {
		String sql = "SELECT max(DEPT_NO)+1 FROM DEPARTMENT";
		try(Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return 0;
	}

	@Override
	public int insertDepartment(Department department) {
		String sql = "INSERT INTO DEPARTMENT VALUES (?, ?, ?)";
		try(Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, department.getDeptNo());
			pstmt.setString(2, department.getDeptName());
			pstmt.setInt(3, department.getDeptFloor());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public Department selectDepartmentByNo(Department department) {
		String sql = "SELECT DEPT_NO, DEPT_NAME, FLOOR FROM DEPARTMENT WHERE DEPT_NO = ?";
		try(Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, department.getDeptNo());
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return getDept(rs);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int deleteDepartment(Department department) {
		String sql = "DELETE FROM DEPARTMENT WHERE DEPT_NO = ? ";
		try(Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, department.getDeptNo());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public int updateDepartment(Department department) {
		String sql = "UPDATE DEPARTMENT SET DEPT_NAME = ?, FLOOR = ?  WHERE DEPT_NO = ?";
		try(Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, department.getDeptName());
			pstmt.setInt(2, department.getDeptFloor());
			pstmt.setInt(3, department.getDeptNo());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}
}
