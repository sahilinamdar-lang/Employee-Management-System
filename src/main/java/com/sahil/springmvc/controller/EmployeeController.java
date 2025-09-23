package com.sahil.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sahil.springmvc.pojo.Employee;
import com.sahil.springmvc.service.EmployeeService;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    // ---------------- Home ----------------
    @GetMapping("/home")
    public String home() {
        return "Home"; // Home.jsp
    }

    // ---------------- Add Employee ----------------
    @GetMapping("/add")
    public String addPage() {
        return "Add"; // Add.jsp
    }

    @PostMapping("/add")
    public String addForm(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("contact") long contact,
            @RequestParam("designation") String designation,
            @RequestParam("salary") double salary,
            ModelMap map) {

        employeeService.addEmployee(name, email, contact, designation, salary);
        map.addAttribute("msg", "✅ Employee added successfully!");
        return "Add";
    }

    // ---------------- Update Employee ----------------
    @GetMapping("/update")
    public String updatePage(@RequestParam(value = "id", required = false) Integer id, ModelMap map) {
        if (id == null) {
            map.addAttribute("msg", "❌ Employee ID not provided");
            List<Employee> employees = employeeService.getAllEmployees();
            map.addAttribute("employees", employees);
            return "Employees";
        }

        Employee emp = employeeService.search(id);
        if (emp != null) {
            map.addAttribute("employee", emp); // matches ${employee} in Update.jsp
            return "Update";
        } else {
            map.addAttribute("msg", "❌ Employee not found");
            List<Employee> employees = employeeService.getAllEmployees();
            map.addAttribute("employees", employees);
            return "Employees";
        }
    }

    @PostMapping("/update")
    public String updateForm(
            @RequestParam("id") int id,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("contact") long contact,
            @RequestParam("designation") String designation,
            @RequestParam("salary") double salary,
            ModelMap map) {

        Employee updated = employeeService.update(id, name, email, contact, designation, salary);

        if (updated != null) {
            map.addAttribute("msg", "✅ Employee updated successfully!");
        } else {
            map.addAttribute("msg", "❌ Employee not found!");
        }

        List<Employee> employees = employeeService.getAllEmployees();
        map.addAttribute("employees", employees);

        return "Employees";
    }

    // ---------------- Search Employee ----------------
    @GetMapping("/search")
    public String searchPage() {
        return "Search"; // Search.jsp
    }

    @PostMapping("/search")
    public String searchEmp(@RequestParam("id") int id, ModelMap map) {
        Employee emp = employeeService.search(id);
        if (emp != null) {
            map.addAttribute("emp", emp);
            map.addAttribute("msg", "✅ Employee record found");
        } else {
            map.addAttribute("msg", "❌ Record not found");
        }
        return "Search";
    }

    // ---------------- Employees List / Search by ID ----------------
    @GetMapping("/employees")
    public String listEmployees(@RequestParam(value = "id", required = false) Integer id, ModelMap map) {
        if (id != null) {
            Employee emp = employeeService.search(id);
            if (emp != null) {
                map.addAttribute("employees", List.of(emp));
            } else {
                map.addAttribute("msg", "❌ Employee not found");
            }
        } else {
            List<Employee> employees = employeeService.getAllEmployees();
            map.addAttribute("employees", employees);
        }
        return "Employees"; // Employees.jsp
    }

    // ---------------- Delete Employee ----------------
    @PostMapping("/employees/remove")
    public String deleteEmployee(@RequestParam("id") int id, ModelMap map) {
        Employee removed = employeeService.remove(id);
        if (removed != null) {
            map.addAttribute("msg", "✅ Employee deleted successfully!");
        } else {
            map.addAttribute("msg", "❌ Employee not found!");
        }

        List<Employee> employees = employeeService.getAllEmployees();
        map.addAttribute("employees", employees);
        return "Employees";
    }
    
    @GetMapping("/login")
    		public String Login() {
    	return "Login";
    }
}
