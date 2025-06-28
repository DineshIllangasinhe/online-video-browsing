<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.video.VideoDBUtil" %>
<%@ page import="com.video.Video" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Videos</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        nav {
            background-color: #333;
            padding: 10px;
            text-align: center;
        }
        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            padding: 10px 15px;
        }
        nav a:hover {
            background-color: #555;
            border-radius: 5px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h1 {
            text-align: center;
            color: #e57373;
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        form {
            margin-bottom: 20px;
            text-align: center;
        }
        input[type="text"] {
            padding: 10px;
            font-size: 1em;
            width: 70%;
            max-width: 400px;
            margin-right: 10px;
        }
        button {
            padding: 10px 20px;
            font-size: 1em;
            background-color: #e57373;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #ef5350;
        }
        .video-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .video-card {
            flex: 1 1 calc(30% - 20px);
            background: #ffebee;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .video-card:hover {
            transform: translateY(-5px);
        }
        .video-card img {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .video-info {
            margin-top: 10px;
        }
        .video-info h2 {
            margin: 10px 0;
            font-size: 1.4em;
            color: #e57373;
        }
        .video-info p {
            margin: 5px 0;
            font-size: 1.1em;
        }
        a.button {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        a.edit {
            background-color: #e57373;
        }
        a.delete {
            background-color: #ef5350;
        }
        a.edit:hover {
            background-color: #ef5350;
        }
        a.delete:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<nav>
    <a href="about.jsp">About</a>
    <a href="profile.jsp">Profile</a>
    <a href="registration.jsp">Registration</a>
    <a href="attendance.jsp">Attendance</a>
    <a href="communication.jsp">Communication</a>
</nav>

<div class="container">
    <h1>Video List</h1>

    <!-- Search Form -->
    <form action="searchUser" method="get">
        <input type="text" name="search" placeholder="Search by name or email">
        <button type="submit">Search</button>&nbsp;&nbsp;&nbsp;<a href="./insertvideo.jsp"  >Add Video</a>
    </form>

    <div class="video-list">
        <%
            // Retrieve search results from request attribute
            List<Video> videos = (List<Video>) request.getAttribute("users");
            if (videos == null) {
                // Retrieve all videos from the database if no search results
                videos = VideoDBUtil.getAllVideos();
            }

            // Iterate through the list of videos and display them in cards
            for (Video video : videos) {
        %>
            <div class="video-card">
                <img src="./assest/videologo.png" alt="Video Thumbnail">
                <div class="video-info">
                    <h2><%= video.getTitle() %></h2>
                    <p><strong>ID:</strong> <%= video.getId() %></p>
                    <p><strong>URL:</strong> <%= video.getUrl() %></p>
                    <p><strong>Description:</strong> <%= video.getDes() %></p>
                    <a href="Editvideo.jsp?id=<%= video.getId() %>" class="button edit">Edit</a>
                    <a href="deleteUser?id=<%= video.getId() %>" class="button delete">Delete</a>
                </div>
            </div>
        <% } %>
    </div>
</div>

</body>
</html>
