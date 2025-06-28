<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.video.VideoDBUtil" %>
<%@ page import="com.video.Video" %>
<%
    // Retrieve user id from request
    int userId = Integer.parseInt(request.getParameter("id"));
    Video video = VideoDBUtil.getVideoById(userId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h1 {
            text-align: center;
            color: #4CAF50;
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-size: 1.2em;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="email"], input[type="date"] {
            padding: 10px;
            font-size: 1em;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            font-size: 1em;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Edit Video</h1>
    <form action="updateUser" method="post">
        <input type="hidden" name="id" value="<%= video.getId() %>">
        <label for="url">URL:</label>
        <input type="text" id="url" name="url" value="<%= video.getUrl() %>">
        
        <label for="title">Last Name:</label>
        <input type="text" id="title" name="title" value="<%= video.getTitle() %>">
        
        <label for="des">des:</label>
        <input type="text" id="des" name="des" value="<%= video.getDes() %>">
        
        
        <input type="submit" value="Update">
    </form>
</div>

</body>
</html>
