package web_study_10.model;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_study_10.dto.Department;
import web_study_10.service.DepartmentService;

@WebServlet("/DepartmentGetHandler")
public class DepartmentGetHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DepartmentService service;

	public void init(ServletConfig config) throws ServletException {
		service = new DepartmentService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");
			int deptNo = Integer.parseInt(request.getParameter("deptNo").trim());
			Department department = service.getDepartment(new Department(deptNo));		// ***
			
			System.out.println("department > " + department);
			request.setAttribute("department", department);
			request.getRequestDispatcher("department.jsp").forward(request, response);
		}
	}

}
