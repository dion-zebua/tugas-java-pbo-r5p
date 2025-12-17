package com.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.myapp.config.DBConnection;
import com.myapp.model.Car;
import com.myapp.model.Motorcycle;
import com.myapp.model.Transportation;

public class TransportationDAO {

    public int getCount() {
        int count = 0;

        String sql = "SELECT COUNT(*) FROM transportations";

        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public List<Transportation> all() {
        List<Transportation> list = new ArrayList<>();
        String sql = "SELECT * FROM transportations ORDER BY id DESC";
        // String sql = "SELECT t.id, t.model, t.type, t.plate, t.price_per_day,
        // GROUP_CONCAT(" +
        // "IF(b.id IS NOT NULL, " +
        // "JSON_OBJECT(" +
        // "'id', b.id, " +
        // "'name', b.name, " +
        // "'whatsapp', b.whatsapp, " +
        // "'start_date', b.start_date, " +
        // "'end_date', b.end_date, " +
        // "'price_total', b.price_total" +
        // "), NULL)) AS booking " +
        // "FROM transportations t " +
        // "LEFT JOIN bookings b " +
        // "ON t.id = b.transportation_id " +
        // "AND b.end_date >= CURDATE() " +
        // "GROUP BY t.id " +
        // "ORDER BY t.id DESC";

        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Transportation t;

                String type = rs.getString("type");

                if ("Car".equalsIgnoreCase(type)) {
                    t = new Car();
                } else {
                    t = new Motorcycle();
                }

                t.setId(rs.getInt("id"));
                t.setModel(rs.getString("model"));
                t.setType(rs.getString("type"));
                t.setPlate(rs.getString("plate"));
                t.setPricePerDay(rs.getInt("price_per_day"));

                list.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void delete(int id) {
        String sql = "DELETE FROM transportations WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Transportation getById(int transportationId) {
        Transportation t = null;
        String sql = "SELECT * FROM transportations WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, transportationId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String type = rs.getString("type");

                    if ("Car".equalsIgnoreCase(type)) {
                        t = new Car();
                    } else if ("Motorcycle".equalsIgnoreCase(type)) {
                        t = new Motorcycle();
                    } else {
                        t = new Transportation();
                    }

                    t.setId(rs.getInt("id"));
                    t.setModel(rs.getString("model"));
                    t.setType(type);
                    t.setPlate(rs.getString("plate"));
                    t.setPricePerDay(rs.getInt("price_per_day"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return t;
    }

    public void create(Transportation transportation) throws Exception {
        String sql = "INSERT INTO transportations VALUES (NULL, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, transportation.getModel());
            ps.setString(2, transportation.getType());
            ps.setString(3, transportation.getPlate());
            ps.setInt(4, transportation.getPricePerDay());
            ps.executeUpdate();
        }
    }
}