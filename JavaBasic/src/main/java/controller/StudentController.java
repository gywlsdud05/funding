package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connector.DBConnector;
import model.StudentDTO;

public class StudentController {
	private Connection connection;

	public StudentController(DBConnector connector) {
		connection = connector.makeConnection();
	}

	public void insert(StudentDTO s) {
		String query = "INSERT INTO `student`(`name`, `korean`, `english`, `math`) VALUES(?, ?, ?, ?)";

		try {
			PreparedStatement pstmt = connection.prepareStatement(query);

			pstmt.setString(1, s.getName());
			pstmt.setInt(2, s.getKorean());
			pstmt.setInt(3, s.getEnglish());
			pstmt.setInt(4, s.getMath());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void update(StudentDTO s) {
		String query = "UPDATE `student` SET `korean` = ?, `english` = ?, `math` = ? WHERE `id` = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);

			pstmt.setInt(1, s.getKorean());
			pstmt.setInt(2, s.getEnglish());
			pstmt.setInt(3, s.getMath());
			pstmt.setInt(4, s.getId());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(int id) {
		String query = "DELETE FROM `student` WHERE `id` = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, id);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<StudentDTO> selectAll() {
		ArrayList<StudentDTO> list = new ArrayList<>();
		String query = "SELECT * FROM `student`";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				StudentDTO s = new StudentDTO();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setKorean(rs.getInt("korean"));
				s.setEnglish(rs.getInt("english"));
				s.setMath(rs.getInt("math"));

				list.add(s);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public StudentDTO selectOne(int id) {
		StudentDTO s = null;
		String query = "SELECT * FROM `student` WHERE `id` = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				s = new StudentDTO();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setKorean(rs.getInt("korean"));
				s.setEnglish(rs.getInt("english"));
				s.setMath(rs.getInt("math"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return s;
	}
}
