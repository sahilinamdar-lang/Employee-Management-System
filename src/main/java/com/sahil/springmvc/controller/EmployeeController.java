package com.sahil.springmvc.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sahil.springmvc.pojo.Admin;
import com.sahil.springmvc.pojo.Employee;
import com.sahil.springmvc.service.AdminService;
import com.sahil.springmvc.service.EmployeeService;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private AdminService service;
    
    // ---------------- Home ----------------
    @GetMapping("/home")
    public String home(HttpSession session, ModelMap map) {
        if (session.getAttribute("adminUser") == null) {
            map.addAttribute("msg", "❌ Please login first!");
            return "Login";
        }
        return "Home"; // Home.jsp
    }

    // ---------------- Add Employee ----------------
    @GetMapping("/add")
    public String addPage(HttpSession session, ModelMap map) {
        if (session.getAttribute("adminUser") == null) {
            map.addAttribute("msg", "❌ Please login first!");
            return "Login";
        }
        return "Add"; // Add.jsp
    }

    @PostMapping("/add")
    public String addForm(@RequestParam("name") String name,
                          @RequestParam("email") String email,
                          @RequestParam("contact") long contact,
                          @RequestParam("designation") String designation,
                          @RequestParam("salary") double salary,
                          HttpSession session,
                          ModelMap map) {

        if (session.getAttribute("adminUser") == null) {
            map.addAttribute("msg", "❌ Please login first!");
            return "Login";
        }

        employeeService.addEmployee(name, email, contact, designation, salary);
        map.addAttribute("msg", "✅ Employee added successfully!");
        return "Add";
    }

    // ---------------- Update Employee ----------------
    @GetMapping("/update")
    public String updatePage(@RequestParam(value = "id", required = false) Integer id,
                             HttpSession session, ModelMap map) {
        if (session.getAttribute("adminUser") == null) {
            map.addAttribute("msg", "❌ Please login first!");
            return "Login";
        }

        if (id == null) {
            map.addAttribute("msg", "❌ Employee ID not provided");
            map.addAttribute("employees", employeeService.getAllEmployees());
            return "Employees";
        }

        Employee emp = employeeService.search(id);
        if (emp != null) {
            map.addAttribute("employee", emp);
            return "Update";
        } else {
            map.addAttribute("msg", "❌ Employee not found");
            map.addAttribute("employees", employeeService.getAllEmployees());
            return "Employees";
        }
    }

    @PostMapping("/update")
    public String updateForm(@RequestParam("id") int id,
                             @RequestParam("name") String name,
                             @RequestParam("email") String email,
                             @RequestParam("contact") long contact,
                             @RequestParam("designation") String designation,
                             @RequestParam("salary") double salary,
                             HttpSession session,
                             ModelMap map) {

        if (session.getAttribute("adminUser") == null) {
            map.addAttribute("msg", "❌ Please login first!");
            return "Login";
        }

        Employee updated = employeeService.update(id, name, email, contact, designation, salary);

        if (updated != null) {
            map.addAttribute("msg", "✅ Employee updated successfully!");
        } else {
            map.addAttribute("msg", "❌ Employee not found!");
        }

        map.addAttribute("employees", employeeService.getAllEmployees());
        return "Employees";
    }

    // ---------------- Search Employee ----------------
    @GetMapping("/search")
    public String searchPage(HttpSession session, ModelMap map) {
        if (session.getAttribute("adminUser") == null) {
            map.addAttribute("msg", "❌ Please login first!");
            return "Login";
        }
        return "Search"; // Search.jsp
    }

    @PostMapping("/search")
    public String searchEmp(@RequestParam("id") int id,
                            HttpSession session,
                            ModelMap map) {
        if (session.getAttribute("adminUser") == null) {
            map.addAttribute("msg", "❌ Please login first!");
            return "Login";
        }

        Employee emp = employeeService.search(id);
        if (emp != null) {
            map.addAttribute("emp", emp);
            map.addAttribute("msg", "✅ Employee record found");
        } else {
            map.addAttribute("msg", "❌ Record not found");
        }
        return "Search";
    }

    // ---------------- Employees List ----------------
    @GetMapping("/employees")
    public String listEmployees(@RequestParam(value = "id", required = false) Integer id,
                                HttpSession session, ModelMap map) {
        if (session.getAttribute("adminUser") == null) {
            map.addAttribute("msg", "❌ Please login first!");
            return "Login";
        }

        if (id != null) {
            Employee emp = employeeService.search(id);
            if (emp != null) {
                map.addAttribute("employees", List.of(emp));
            } else {
                map.addAttribute("msg", "❌ Employee not found");
            }
        } else {
            map.addAttribute("employees", employeeService.getAllEmployees());
        }
        return "Employees";
    }

    // ---------------- Delete Employee ----------------
    @PostMapping("/employees/remove")
    public String deleteEmployee(@RequestParam("id") int id,
                                 HttpSession session, ModelMap map) {
        if (session.getAttribute("adminUser") == null) {
            map.addAttribute("msg", "❌ Please login first!");
            return "Login";
        }

        Employee removed = employeeService.remove(id);
        if (removed != null) {
            map.addAttribute("msg", "✅ Employee deleted successfully!");
        } else {
            map.addAttribute("msg", "❌ Employee not found!");
        }

        map.addAttribute("employees", employeeService.getAllEmployees());
        return "Employees";
    }

    // ---------------- Login ----------------
    @GetMapping("/login")
    public String loginPage() {
        return "Login"; 
    }

    @PostMapping("/login")
    public String loginForm(@RequestParam("username") String username,
                            @RequestParam("password") String password,
                            HttpSession session,
                            ModelMap map) {
        if ("admin".equals(username) && "admin".equals(password)) {
            session.setAttribute("adminUser", username);
            map.addAttribute("msg", "✅ Login successful!");
            return "Home";
        } else {
            map.addAttribute("msg", "❌ Invalid username or password!");
            return "Login";
        }
    }

    // ---------------- Register Admin ----------------
    @GetMapping("/register")
    public String registerAdminPage() {
        return "Admin"; // Admin.jsp
    }

    @PostMapping("/register")
    public String registerAdmin(@RequestParam("username") String username,
                                @RequestParam("password") String password,
                                ModelMap map) {
    	
    	Admin admin =service.registrationAdmin(username,password);
    	
    	
        if (admin != null ) {
            map.addAttribute("msg", "✅ Admin registered successfully!");
        } else {
            map.addAttribute("msg", "❌ Registration failed!");
        }
        return "Admin"; // Admin.jsp
    }

    // ---------------- Forgot Password ----------------
    @GetMapping("/forgotPassword")
    public String forgotPasswordPage() {
        return "ForgotPassword"; // ForgotPassword.jsp
    }

    @PostMapping("/forgotPassword")
    public String forgotPassword(@RequestParam("username") String username, ModelMap map) {
        if ("admin".equals(username)) {
            map.addAttribute("msg", "✅ Password reset link sent to your email!");
        } else {
            map.addAttribute("msg", "❌ Username not found!");
        }
        return "ForgotPassword"; // ForgotPassword.jsp
    }

    // ---------------- Logout ----------------
    @GetMapping("/logout")
    public String logout(HttpSession session, ModelMap map) {
        session.invalidate();
        map.addAttribute("msg", "✅ You have been logged out successfully!");
        return "Login";
    }
}
