<%@ include file="layout/header.jsp" %>
    <% Integer totalTransportations=(Integer) request.getAttribute("totalTransportations"); %>
        <% Integer bookings=(Integer) request.getAttribute("totalBookings"); %>

            <h1>Halaman Dashboard</h1>


            <div class="mb-6 px-5 text-center">Berhasil login menggunakan email: <b>
                    <%= email %>
                </b></div>
            <div class="flex gap-10 px-5">
                <div class="shadow p-5 border-t-8 border-primary bg-white rounded-md w-full max-w-96 mx-auto">
                    <div class="grid place-items-center text-center">
                        <span
                            class="grid place-items-center text-center text-[50px] bg-primary rounded-full size-25 my-5 text-white">
                            <%= totalTransportations !=null ? totalTransportations : 0 %>
                        </span>
                        <h2 class="text-lg text-slate-500">
                            Transportasi
                        </h2>
                    </div>

                </div>
                <div class="shadow p-5 border-t-8 border-primary bg-white rounded-md w-full max-w-96 mx-auto">
                    <div class="grid place-items-center text-center">
                        <span
                            class="grid place-items-center text-center text-[50px] bg-primary rounded-full size-25 my-5 text-white">
                            <%= bookings !=null ? bookings : 0 %>
                        </span>
                        <h2 class="text-lg text-slate-500">
                            Pesanan
                        </h2>
                    </div>

                </div>
            </div>

            <%@ include file="layout/footer.jsp" %>