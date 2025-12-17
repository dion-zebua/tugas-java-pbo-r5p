package com.myapp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import com.myapp.config.DBConnection;
import com.myapp.dao.interfaces.BookingDAOInterface;
import com.myapp.model.Booking;
import com.myapp.model.Car;
import com.myapp.model.Motorcycle;
import com.myapp.model.Transportation;

public class BookingDAO implements BookingDAOInterface {

    public int getCount() {
        int count = 0;

        String sql = "SELECT COUNT(*) FROM bookings";

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

    public void create(Booking booking) throws Exception {
        String sql = "INSERT INTO bookings VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, booking.getTransportationId());
            ps.setString(2, booking.getName());
            ps.setString(3, booking.getWhatsapp());
            ps.setTimestamp(4, Timestamp.valueOf(booking.getBookingDate()));
            ps.setDate(5, Date.valueOf(booking.getStartDate()));
            ps.setDate(6, Date.valueOf(booking.getEndDate()));

            TransportationDAO transportationDAO = new TransportationDAO();

            Transportation transportation = transportationDAO.getById(booking.getTransportationId());
            if (transportation == null) {
                throw new RuntimeException(
                        "Transportasi tidak ditemukan");
            }

            boolean conflict = isDateConflict(
                    transportation.getPlate(),
                    booking.getStartDate(),
                    booking.getEndDate());

            if (conflict) {
                throw new RuntimeException(
                        "Jadwal bentrok! Kendaraan dengan plat "
                                + transportation.getPlate()
                                + " sudah dibooking pada tanggal tersebut");
            }

            Transportation t;

            String type = transportation.getType();

            if ("Car".equalsIgnoreCase(type)) {
                t = new Car();
            } else {
                t = new Motorcycle();
            }

            long days = ChronoUnit.DAYS.between(booking.getStartDate(), booking.getEndDate()) + 1;

            int totalPrice = (transportation.getPricePerDay() * (int) days);
            ps.setInt(7, totalPrice);

            ps.executeUpdate();
        }
    }

    public List<Booking> all() {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT b.*, t.model, t.type, t.plate, t.price_per_day FROM bookings AS b JOIN transportations AS t ON b.transportation_id = t.id ORDER BY b.id DESC;";

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

                Booking b = new Booking();
                b.setId(rs.getInt("id"));
                b.setTransportationId(rs.getInt("transportation_id"));
                b.setName(rs.getString("name"));
                b.setWhatsapp(rs.getString("whatsapp"));
                b.setPriceTotal(rs.getInt("price_total"));
                b.setBookingDate(rs.getTimestamp("booking_date").toLocalDateTime());
                b.setStartDate(rs.getDate("start_date").toLocalDate());
                b.setEndDate(rs.getDate("end_date").toLocalDate());

                t.setModel(rs.getString("model"));
                t.setType(rs.getString("type"));
                t.setPlate(rs.getString("plate"));
                t.setPricePerDay(rs.getInt("price_per_day"));

                b.setTransportation(t);

                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void delete(int id) {
        String sql = "DELETE FROM bookings WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isDateConflict(
            String plate,
            LocalDate startDate,
            LocalDate endDate) throws Exception {

        String sql = "SELECT COUNT(*) " +
                "FROM bookings b " +
                "JOIN transportations t ON b.transportation_id = t.id " +
                "WHERE t.plate = ? " +
                "AND b.start_date <= ? " +
                "AND b.end_date >= ?";

        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, plate);
            ps.setDate(2, Date.valueOf(endDate));
            ps.setDate(3, Date.valueOf(startDate));

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }
}
