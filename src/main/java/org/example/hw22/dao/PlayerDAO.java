package org.example.hw22.dao;

import org.example.hw22.bean.PlayerVO;
import org.example.hw22.util.JDBCUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlayerDAO {
    String PLAYER_BY_ID = "SELECT id, name, birthyear, club, country, position, mainfoot, filename FROM Player WHERE id = ?";
    String PLAYER_ALL = "SELECT id, name, birthyear, club, country, position, mainfoot, filename FROM Player";
    String DELETE = "DELETE FROM Player WHERE id = ?";
    String UPDATE = "UPDATE Player SET name = ?, birthyear = ?, club = ?, country = ?, position = ?, mainfoot = ?, filename = ? WHERE id = ?";
    String INSERT = "INSERT INTO Player (name, birthyear, club, country, position, mainfoot, filename) VALUES (?, ?, ?, ?, ?, ?, ?)";
    String PLAYER_BY_POSITION = "SELECT id, name, birthyear, club, country, position, mainfoot, filename FROM Player WHERE position = ?";
    String Get_Photo = "SELECT filename FROM Player WHERE id = ?";

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
                user.setFilename(rs.getString("filename"));
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
                            rs.getString("mainfoot"),
                            rs.getString("filename")
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
            System.out.println("Player ID: " + player.getId());
            System.out.println("Player Name: " + player.getName());
            System.out.println("Player FileName: " + player.getFilename());

            // PreparedStatement에 값을 설정
            stmt.setString(1, player.getName());
            stmt.setString(2, player.getBirthyear());
            stmt.setString(3, player.getClub());
            stmt.setString(4, player.getCountry());
            stmt.setString(5, player.getPosition());
            stmt.setString(6, player.getMainfoot());
            stmt.setString(7, player.getFilename());
            stmt.setInt(8, player.getId());

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

    public void addPlayer(PlayerVO playerVO) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT)) {

            // PreparedStatement에 값을 설정
            stmt.setString(1, playerVO.getName());
            stmt.setString(2, playerVO.getBirthyear());
            stmt.setString(3, playerVO.getClub());
            stmt.setString(4, playerVO.getCountry());
            stmt.setString(5, playerVO.getPosition());
            stmt.setString(6, playerVO.getMainfoot());
            stmt.setString(7, playerVO.getFilename());

            // INSERT 실행
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Player " + playerVO.getName() + " was added.");
            } else {
                System.out.println("Failed to add the player.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error adding player: " + playerVO.getName(), e);
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

    public String getPhotoFilename(int sid) {
        String filename = null;

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(Get_Photo)) {
            pstmt.setInt(1, sid);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                filename = rs.getString("filename");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return filename;
    }

    public List<PlayerVO> getPlayersSortedBy(String sortBy) {
        List<PlayerVO> players = new ArrayList<>();
        String query = "SELECT * FROM Player"; // 기본 쿼리

        // 정렬 기준에 따라 SQL 쿼리 수정
        if ("name".equals(sortBy)) {
            query += " ORDER BY name ASC";
        } else if ("age".equals(sortBy)) {
            query += " ORDER BY birthyear ASC";  // 나이 기준으로 정렬
        } else if ("regdate_desc".equals(sortBy)) {
            query += " ORDER BY regdate DESC";  // 등록일 기준 내림차순 정렬
        }

        // 쿼리 실행 코드 (예시)
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                PlayerVO player = new PlayerVO();
                player.setId(rs.getInt("id"));
                player.setCountry(rs.getString("country"));
                player.setBirthyear(rs.getString("birthyear"));
                player.setName(rs.getString("name"));
                player.setClub(rs.getString("club"));
                player.setPosition(rs.getString("position"));
                player.setMainfoot(rs.getString("mainfoot"));
                players.add(player);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return players;
    }

}
