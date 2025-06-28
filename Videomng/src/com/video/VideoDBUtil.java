package com.video;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class VideoDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

public static boolean insertvideo(String url,String title, String des) {
		
		boolean isSuccess = false;
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into video values (0, '"+url+"','"+title+"','"+des+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}

public static List<Video> getAllVideos() {
    List<Video> videos = new ArrayList<>();

    try {
        con = DBConnect.getConnection();
        stmt = con.createStatement();
        String sql = "SELECT * FROM video";
        rs = stmt.executeQuery(sql);

        while (rs.next()) {
            int id = rs.getInt("id");
            String url = rs.getString("url");
            String title = rs.getString("title");
            String des = rs.getString("des");
            Video video = new Video(id, url, title, des);
            videos.add(video);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    return videos;
}

public static Video getVideoById(int id) {
    Video video = null;

    try {
        con = DBConnect.getConnection();
        stmt = con.createStatement();
        String sql = "SELECT * FROM video WHERE id=" + id;
        rs = stmt.executeQuery(sql);

        if (rs.next()) {
            String url = rs.getString("url");
            String title = rs.getString("title");
            String des = rs.getString("des");
           

            video = new Video(id, url, title, des);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    return video;
}

public static boolean updatevideo(int id, String url, String title, String des) {
    boolean isSuccess = false;

    try {
        con = DBConnect.getConnection();
        stmt = con.createStatement();
        String sql = "UPDATE video SET url='" + url + "', title='" + title + "', des='" + des + "' WHERE id=" + id;
        int rs = stmt.executeUpdate(sql);

        if (rs > 0) {
            isSuccess = true;
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    return isSuccess;
}

public static boolean deletevideo(int id) {
    boolean isSuccess = false;

    try {
        con = DBConnect.getConnection();
        stmt = con.createStatement();
        String sql = "DELETE FROM video WHERE id=" + id;
        int rs = stmt.executeUpdate(sql);

        if (rs > 0) {
            isSuccess = true;
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    return isSuccess;
}

// Method to search users by name or email
public static List<Video> searchUsers(String searchQuery) {
    List<Video> video = new ArrayList<>();

    try {
        con = DBConnect.getConnection();
        stmt = con.createStatement();
        String sql = "SELECT * FROM video WHERE title LIKE '%" + searchQuery + "%' OR des LIKE '%" + searchQuery + "%' OR des LIKE '%" + searchQuery + "%'";
        rs = stmt.executeQuery(sql);

        while (rs.next()) {
            int id = rs.getInt("id");
            String url = rs.getString("url");
            String title = rs.getString("title");
            String des = rs.getString("des");
            

            Video user = new Video(id, url, title, des);
            video.add(user);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    return video;
}
}
