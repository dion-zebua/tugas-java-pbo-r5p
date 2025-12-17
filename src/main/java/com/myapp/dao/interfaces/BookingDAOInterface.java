package com.myapp.dao.interfaces;

import java.util.List;
import com.myapp.model.Booking;

public interface BookingDAOInterface {

    public int getCount();

    public void create(Booking booking) throws Exception;

    public List<Booking> all();

    public void delete(int id);
}
