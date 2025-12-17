<%@ page import="java.util.List" %>
    <%@ page import="com.myapp.model.Transportation" %>

        <%@ include file="layout/header.jsp" %>

            <h1>Halaman Transportasi
                <a href="#!" class="tombol open-modal" data-modal="add-transportation">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="size-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                    </svg>
                </a>
            </h1>


            <div class="modalElement" id="add-transportation">
                <div>
                    <h3>Tambah Transportasi</h3>

                    <form action="<%= request.getContextPath() %>/transportation/create"
                        class="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-4 [&_label.required]:after:content-['*'] [&_label.required]:after:ml-0.5 [&_label.required]:after:text-red-500 [&_label]:line-clamp-1 [&_button]:overflow-hidden"
                        method="POST">

                        <div class="col-span-full">
                            <label class="required" for="model">Model
                            </label>
                            <input id="model" required type="text" name="model" autocomplete="model">
                        </div>

                        <div class="col-span-full">
                            <label class="required" for="type">Type
                            </label>
                            <select name="type" id="type" required autocomplete="type">
                                <option value="">Pilih type</option>
                                <option value="Car">Car</option>
                                <option value="Motorcycle">Motorcycle</option>
                            </select>
                        </div>

                        <div class="col-span-full">
                            <label class="required" for="plate">Plat
                            </label>
                            <input id="plate" required type="text" name="plate" autocomplete="plate">
                        </div>

                        <div class="col-span-full">
                            <label class="required" for="price_per_day">Harga per hari
                            </label>
                            <input id="price_per_day" required type="number" name="price_per_day"
                                autocomplete="price_per_day">
                        </div>

                        <div class="w-full col-span-full text-right mt-2">
                            <button type="submit" class="tombol">Submit</button>
                        </div>

                    </form>
                </div>
            </div>

            <div class="gap-10 px-5 grid grid-cols-3">

                <% List<com.myapp.model.Transportation> transportations =
                    (List<com.myapp.model.Transportation>) request.getAttribute("transportations");


                        if (transportations != null && !transportations.isEmpty()) {
                        for (com.myapp.model.Transportation t : transportations) {
                        %>


                        <div
                            class="border flex flex-col justify-between hover:shadow-lg relative bg-slate-50 border-slate-200 rounded-lg overflow-hidden">

                            <div
                                class="text-sm absolute top-2.5 left-2.5 bg-slate-100 inset-shadow rounded-lg border-2 px-4 py-0.5 flex items-center text-slate-600 border-slate-400 gap-x-2">
                                <%= t.getType() %>
                            </div>
                            <img class="col-span-2 aspect-video rounded-lg" src='<%= request.getContextPath() %>/img/<%= "Car".equals(t.getType()) ? "mobil"
                                : "motor" %>.jpg'>


                            <div
                                class="h-full p-5 col-span-3 flex flex-col justify-between [&_p]:text-sm [&_p]:opacity-85 [&_span]:line-clamp-1 [&_p]:flex [&_p]:items-center">
                                <div class="flex flex-col gap-y-1">

                                    <h3 class="text-base opacity-80 mb-2 line-clamp-2! font-semibold">
                                        <%= t.getModel() %>
                                    </h3>
                                    <div class="flex space-x-2 items-center mb-2 line-clamp-1">

                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                            stroke-width="1.5" stroke="currentColor"
                                            class="size-4 min-w-4 stroke-primary">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M15.666 3.888A2.25 2.25 0 0 0 13.5 2.25h-3c-1.03 0-1.9.693-2.166 1.638m7.332 0c.055.194.084.4.084.612v0a.75.75 0 0 1-.75.75H9a.75.75 0 0 1-.75-.75v0c0-.212.03-.418.084-.612m7.332 0c.646.049 1.288.11 1.927.184 1.1.128 1.907 1.077 1.907 2.185V19.5a2.25 2.25 0 0 1-2.25 2.25H6.75A2.25 2.25 0 0 1 4.5 19.5V6.257c0-1.108.806-2.057 1.907-2.185a48.208 48.208 0 0 1 1.927-.184" />
                                        </svg>


                                        <p class="text-sm">Plat : <%= t.getPlate() %>
                                        </p>
                                    </div>

                                    <div class="flex space-x-2 items-center mb-2 line-clamp-1">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                            stroke-width="1.5" stroke="currentColor"
                                            class="size-4 min-w-4 stroke-primary">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M2.25 18.75a60.07 60.07 0 0 1 15.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 0 1 3 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 0 0-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 0 1-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 0 0 3 15h-.75M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm3 0h.008v.008H18V10.5Zm-12 0h.008v.008H6V10.5Z" />
                                        </svg>


                                        <p class="text-sm">Rp<%= t.getPricePerDay() %>
                                        </p>
                                    </div>

                                    <div class="flex space-x-2 items-center mb-2 line-clamp-1">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                            stroke-width="1.5" stroke="currentColor"
                                            class="size-4 min-w-4 stroke-primary">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z" />
                                        </svg>



                                        <p class="text-sm">Note: <%= t.getDriverInfo() %> (Rp<%=
                                                    t.getDriverPricePerDay() %>/hari)
                                        </p>
                                    </div>

                                    <div class="flex justify-between gap-x-5">
                                        <a href="#!" class="tombol w-full text-center text-base! open-modal"
                                            data-modal="add-booking-<%= t.getId() %>">Buat Pesanan</a>
                                        <form action="<%= request.getContextPath() %>/transportation/destroy"
                                            method="post">
                                            <input type="hidden" name="id" value="<%= t.getId() %>">
                                            <button type="submit" class="delete"
                                                onclick="return confirm('Apakah Anda yakin ingin menghapus transportasi ini?')">
                                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                                    stroke-width="1.5" stroke="currentColor" class="size-6">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                                                </svg>

                                            </button>
                                        </form>
                                    </div>

                                    <div class="modalElement" id="add-booking-<%= t.getId() %>">
                                        <div>
                                            <h3>Tambah Pesanan</h3>
                                            <p>Model : <%= t.getModel() %>
                                            </p>
                                            <p>Plat : <%= t.getPlate() %>
                                            </p>
                                            <p>Harga per hari : <%= t.getPricePerDay() %>
                                            </p>

                                            <form action="<%= request.getContextPath() %>/booking/create"
                                                class="mt-3 grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-4 [&_label.required]:after:content-['*'] [&_label.required]:after:ml-0.5 [&_label.required]:after:text-red-500 [&_label]:line-clamp-1 [&_button]:overflow-hidden"
                                                method="POST">

                                                <input required type="hidden" value="<%= t.getId() %>"
                                                    name="transportation_id">

                                                <div class="col-span-full">
                                                    <label class="required" for="name">Nama
                                                    </label>
                                                    <input id="name" required type="text" name="name"
                                                        autocomplete="name">
                                                </div>

                                                <div class="col-span-full">
                                                    <label class="required" for="whatsapp">Whatsapp
                                                    </label>
                                                    <input id="whatsapp" required type="number" name="whatsapp"
                                                        autocomplete="whatsapp">
                                                </div>

                                                <div class="col-span-full">
                                                    <label class="required" for="start_date">Tanggal mulai
                                                    </label>
                                                    <input id="start_date" required type="date" name="start_date"
                                                        autocomplete="start_date">
                                                </div>

                                                <div class="col-span-full">
                                                    <label class="required" for="end_date">Tanggal selesai
                                                    </label>
                                                    <input id="end_date" required type="date" name="end_date"
                                                        autocomplete="end_date">
                                                </div>


                                                <div class="w-full col-span-full text-right mt-2">
                                                    <button type="submit" class="tombol">Submit</button>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>


                        </div>


                        <% } } else { %>
                            <p class="col-span-full text-center">Data transportasi tidak tersedia.</p>
                            <% } %>

            </div>

            <%@ include file="layout/footer.jsp" %>