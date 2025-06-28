package com.video;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateUser")
public class UpdateVideoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String url = request.getParameter("url");
        String title = request.getParameter("title");
        String des = request.getParameter("des");
        

        boolean isSuccess = VideoDBUtil.updatevideo(id, url, title, des);

        if (isSuccess) {
            response.sendRedirect("all_video.jsp");
        } else {
            response.getWriter().print("Update failed!");
        }
    }
}
