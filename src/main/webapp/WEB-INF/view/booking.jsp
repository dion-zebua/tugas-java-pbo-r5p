<%@ page import="java.util.List" %>
    <%@ page import="com.myapp.model.Booking" %>

        <%@ page import="java.time.format.DateTimeFormatter, java.util.Locale" %>
            <%@ page import="java.time.LocalDateTime, java.time.LocalDate" %>

                <% DateTimeFormatter dateTimeFormatter=DateTimeFormatter.ofPattern("yyyy-MMM-dd HH:mm:ss", new
                    Locale("id")); DateTimeFormatter dateFormatter=DateTimeFormatter.ofPattern("yyyy-MMM-dd", new
                    Locale("id")); %>

                    <%@ include file="layout/header.jsp" %>

                        <h1>Halaman Booking
                            <a href="#!" class="tombol">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke-width="1.5" stroke="currentColor" class="size-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                                </svg>
                            </a>
                        </h1>

                        <div class="px-5">

                            <% List<com.myapp.model.Booking> bookings =
                                (List<com.myapp.model.Booking>) request.getAttribute("bookings");


                                    if (bookings != null && !bookings.isEmpty()) { %>
                                    <div class="relative overflow-x-auto w-full max-w-full">
                                        <table class="min-w-[1500px]">
                                            <thead>
                                                <tr>
                                                    <th style="width: 10px;">
                                                        No
                                                    </th>
                                                    <th>
                                                        Model
                                                    </th>
                                                    <th>
                                                        Plat
                                                    </th>
                                                    <th>
                                                        Type
                                                    </th>
                                                    <th>
                                                        Harga Awal
                                                    </th>
                                                    <th>
                                                        Catatan
                                                    </th>
                                                    <th>
                                                        Harga Total
                                                    </th>
                                                    <th>
                                                        Nama
                                                    </th>
                                                    <th>
                                                        Whatsapp
                                                    </th>
                                                    <th>
                                                        Tanggal Pemesanan
                                                    </th>
                                                    <th>
                                                        Tanggal Mulai
                                                    </th>
                                                    <th>
                                                        Tanggal Berakhir
                                                    </th>
                                                    <th>

                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <% int index=1; for (com.myapp.model.Booking b : bookings) { %>
                                                    <tr>
                                                        <td>
                                                            <%= index %>
                                                        </td>
                                                        <td>
                                                            <%= b.getTransportation().getModel() %>
                                                        </td>
                                                        <td class="whitespace-nowrap">
                                                            <%= b.getTransportation().getPlate() %>
                                                        </td>
                                                        <td>
                                                            <%= b.getTransportation().getType() %>
                                                        </td>
                                                        <td>
                                                            Rp<%= b.getPriceTotal() %>
                                                        </td>
                                                        <td>
                                                            <%= b.getTransportation().getDriverInfo() %>
                                                                (Rp<%= b.getTransportation().getDriverPricePerDay() %>
                                                                    /hari)
                                                        </td>
                                                        <td>
                                                            Rp<%= b.getfinalPrice() %>
                                                        </td>
                                                        <td class="whitespace-nowrap">
                                                            <%= b.getName() %>
                                                        </td>
                                                        <td>
                                                            <%= b.getWhatsapp() %>
                                                        </td>
                                                        <td>
                                                            <%= b.getBookingDate().format(dateTimeFormatter) %>
                                                        </td>

                                                        <td class="whitespace-nowrap">
                                                            <%= b.getStartDate().format(dateFormatter) %>
                                                        </td>

                                                        <td class="whitespace-nowrap">
                                                            <%= b.getEndDate().format(dateFormatter) %>
                                                        </td>
                                                        <td>
                                                            <form
                                                                action="<%= request.getContextPath() %>/booking/destroy"
                                                                method="post">
                                                                <input type="hidden" name="id" value="<%= b.getId() %>">
                                                                <button type="submit" class="tombol"
                                                                    onclick="return confirm('Apakah Anda yakin ingin menghapus pesanan ini?')">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none"
                                                                        viewBox="0 0 24 24" stroke-width="1.5"
                                                                        stroke="currentColor" class="size-6">
                                                                        <path stroke-linecap="round"
                                                                            stroke-linejoin="round"
                                                                            d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                                                                    </svg>

                                                                </button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                    <% index++; } %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <% } else { %>
                                        <p class="col-span-full text-center">Data transportasi tidak tersedia.</p>
                                        <% } %>

                        </div>

                        <%@ include file="layout/footer.jsp" %>