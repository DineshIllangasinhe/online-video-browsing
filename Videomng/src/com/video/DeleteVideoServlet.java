package com.video;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteUser")
public class DeleteVideoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        boolean isSuccess = VideoDBUtil.deletevideo(id);

        if (isSuccess) {
            response.sendRedirect("all_video.jsp");
        } else {
            response.getWriter().print("Delete failed!");
        }
    }
}
