package org.example.hw22.dao;

import org.example.hw22.bean.PlayerVO;
import org.example.hw22.util.JDBCUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlayerDAO {
    String PLAYER_BY_ID = "SELECT id, name, birthyear, club, country, position, mainfoot FROM Player WHERE id = ?";
    String PLAYER_ALL = "SELECT id, name, birthyear, club, country, position, mainfoot FROM Player";
    String DELETE = "DELETE FROM Player WHERE id = ?";
    String UPDATE = "UPDATE Player SET name = ?, birthyear = ?, club = ?, country = ?, position = ?, mainfoot = ? WHERE id = ?";
    String INSERT = "INSERT INTO Player (name, birthyear, club, country, position, mainfoot) VALUES (?, ?, ?, ?, ?, ?)";
    String PLAYER_BY_POSITION = "SELECT id, name, birthyear, club, country, position, mainfoot FROM Player WHERE position = ?";

    public List<PlayerVO> getAllUsers() {
        List<PlayerVO> users = new ArrayList<>();

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(PLAYER_ALL);
             ResultSet rs = stmt.executeQuery()) {

            // 결과를 List로 변환
            while (rs.next()) {
                PlayerVO user = new PlayerVO();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setBirthyear(rs.getString("birthyear"));
                user.setClub(rs.getString("club"));
                user.setCountry(rs.getString("country"));
                user.setPosition(rs.getString("position"));
                user.setMainfoot(rs.getString("mainfoot"));

                // List에 user 객체 추가
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public PlayerVO getPlayerById(int id) {
        PlayerVO player = null;

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(PLAYER_BY_ID)) {

            stmt.setInt(1, id);  // PreparedStatement에 id를 세팅
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    player = new PlayerVO(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("birthyear"),
                            rs.getString("club"),
                            rs.getString("country"),
                            rs.getString("position"),
                            rs.getString("mainfoot")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return player;
    }

    public void deletePlayerById(int id) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(DELETE)) {

            stmt.setInt(1, id);  // id를 쿼리에 설정
            int rowsAffected = stmt.executeUpdate();  // DELETE 실행

            if (rowsAffected > 0) {
                System.out.println("Player with id " + id + " was deleted.");
            } else {
                System.out.println("No player found with id " + id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error deleting player with id " + id, e);
        }
    }

    // update 메서드 추가
    public void updatePlayer(PlayerVO player) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE)) {

            // PreparedStatement에 값을 설정
            stmt.setString(1, player.getName());
            stmt.setString(2, player.getBirthyear());
            stmt.setString(3, player.getClub());
            stmt.setString(4, player.getCountry());
            stmt.setString(5, player.getPosition());
            stmt.setString(6, player.getMainfoot());
            stmt.setInt(7, player.getId());

            // 업데이트 실행
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Player with id " + player.getId() + " was updated.");
            } else {
                System.out.println("No player found with id " + player.getId());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error updating player with id " + player.getId(), e);
        }
    }

    public void addPlayer(String name, String birthyear, String club, String country, String position, String mainfoot) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT)) {

            // PreparedStatement에 값을 설정
            stmt.setString(1, name);
            stmt.setString(2, birthyear);
            stmt.setString(3, club);
            stmt.setString(4, country);
            stmt.setString(5, position);
            stmt.setString(6, mainfoot);

            // INSERT 실행
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Player " + name + " was added.");
            } else {
                System.out.println("Failed to add the player.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error adding player: " + name, e);
        }
    }

    public List<PlayerVO> getPlayersByPosition(String position) {
        List<PlayerVO> players = new ArrayList<>();

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(PLAYER_BY_POSITION)) {

            stmt.setString(1, position); // position 매개변수 설정
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    PlayerVO player = new PlayerVO();
                    player.setId(rs.getInt("id"));
                    player.setName(rs.getString("name"));
                    player.setBirthyear(rs.getString("birthyear"));
                    player.setClub(rs.getString("club"));
                    player.setCountry(rs.getString("country"));
                    player.setPosition(rs.getString("position"));
                    player.setMainfoot(rs.getString("mainfoot"));

                    // 리스트에 추가
                    players.add(player);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error retrieving players for position: " + position, e);
        }
        return players;
    }
}
