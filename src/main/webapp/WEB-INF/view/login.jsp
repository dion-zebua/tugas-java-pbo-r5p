<%@ include file="layout/header.jsp" %>

    <h1>Halaman Login</h1>


    <div class="shadow p-5 border-t-8 border-primary bg-white rounded-md max-w-96 mx-auto">
        <div class="[&>div]:justify-center text-center">
            <div class="flex items-center py-3">
                <!-- <img class="w-48 h-auto mb-5" title="Rental" src="<%= request.getContextPath() %>/img/logo.png"
                    alt="Logo Rentalin" width="300" height="60"> -->
            </div>
        </div>

        <form action="<%= request.getContextPath() %>/login-post"
            class="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-4 [&_label.required]:after:content-['*'] [&_label.required]:after:ml-0.5 [&_label.required]:after:text-red-500 [&_label]:line-clamp-1 [&_button]:overflow-hidden"
            method="POST">


            <% if (error !=null) { %>
                <p class="bg-red-50 p-3 col-span-full rounded-lg border border-red-300 opacity-80">
                    <%= error %>
                </p>
                <% } %>



                    <!-- Email -->
                    <div class="col-span-full">
                        <label class="required" for="email">Email
                        </label>
                        <input id="email" value="" required type="email" name="email" autocomplete="email">
                    </div>

                    <!-- Password -->
                    <div class="col-span-full">
                        <label class="required" for="password">Password
                        </label>

                        <div class="relative">
                            <input placeholder="" required type="password" name="password" autocomplete="off">
                        </div>
                    </div>


                    <div class="w-full col-span-full text-right mt-2">
                        <button type="submit" class="tombol">Submit</button>
                    </div>

        </form>
    </div>

    <%@ include file="layout/footer.jsp" %>