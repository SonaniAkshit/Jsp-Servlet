package com.example;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.util.*;

public class StudentServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Map<String, String>> students = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM student")) {

            while (rs.next()) {
                Map<String, String> student = new HashMap<>();
                student.put("id", String.valueOf(rs.getInt("id")));
                student.put("name", rs.getString("name"));
                student.put("email", rs.getString("email"));
                student.put("enrolled_date", rs.getDate("enrolled_date").toString());
                students.add(student);
            }

            request.setAttribute("students", students);
            RequestDispatcher rd = request.getRequestDispatcher("student-list.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
