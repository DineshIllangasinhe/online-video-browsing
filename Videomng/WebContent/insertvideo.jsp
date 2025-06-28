<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upoald Video</title>
</head>
<body style="font-family: 'Helvetica Neue', Arial, sans-serif; background-color: #f4f4f9; color: #333; margin: 0; padding: 20px;">

<div style="max-width: 600px; margin: 0 auto; background: #fff; padding: 20px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); border-radius: 10px;">
    <h1 style="text-align: center; color: #4CAF50; font-size: 2em; margin-bottom: 20px;">Upload Video</h1>
    <form action="insert" method="post" style="display: flex; flex-direction: column; gap: 10px;">
        <label for="url" style="font-size: 1.1em;">url:</label>
        <input type="text" id="url" name="url" style="padding: 10px; font-size: 1em; border: 1px solid #ccc; border-radius: 5px;">

        <label for="title" style="font-size: 1.1em;">title:</label>
        <input type="text" id="title" name="title" style="padding: 10px; font-size: 1em; border: 1px solid #ccc; border-radius: 5px;">

        <label for="des" style="font-size: 1.1em;">des:</label>
        <input type="text" id="des" name="des" style="padding: 10px; font-size: 1em; border: 1px solid #ccc; border-radius: 5px;">

        

        <input type="submit" name="submit" value="Upload" style="padding: 10px 20px; font-size: 1em; background-color: #e57373; color: white; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s;">
    </form>
</div>

</body>
</html>
