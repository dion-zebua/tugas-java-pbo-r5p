<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

    <style type="text/tailwindcss">
        @theme {
            --color-primary: #3498db;
        }
        body {
            @apply bg-slate-100;
        }
        h1 {
            @apply text-3xl px-5 text-center mb-5 flex justify-center items-center gap-5;
        }
        select, input {
            @apply w-full appearance-none rounded-md mt-2 py-1.5 pr-7 pl-3 text-base text-slate-600 outline-1 outline-slate-500 placeholder:text-gray-500 focus:outline-2 focus:outline-primary sm:text-sm/6;
        }

        .tombol {
            @apply rounded-md bg-primary px-3 py-2 text-sm font-semibold text-white shadow-xs hover:bg-primary focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary cursor-pointer;
        }

        .delete {
            @apply rounded-md bg-transparent border-2 border-primary *:stroke-slate-600 hover:*:stroke-slate-100 px-3 py-2 text-sm font-semibold text-white shadow-xs hover:bg-primary focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary cursor-pointer;
        }


        table {
            @apply w-full border-collapse border border-gray-400 bg-white text-sm table-auto;
        }
        
        thead {
            @apply bg-slate-200;
        }
        
        th {
            @apply border border-gray-300 p-4 text-left font-semibold text-slate-800;
        }

        tbody tr {
            @apply odd:bg-white even:bg-gray-50 hover:bg-gray-100;
        }

        tbody td {
            @apply border border-gray-300 p-4;
        }

        .modalElement {
            @apply fixed inset-0 bg-black/90 z-[99]! hidden place-items-center;
        }

        .modalElement > div {
            @apply max-w-96 w-full p-5 bg-white rounded-lg;
        }

        .modalElement > div h3 {
            @apply font-semibold mb-5;
        }
        
    </style>

</head>

<body>
    <% String email=(String) session.getAttribute("email"); String uri=request.getRequestURI(); if (email==null &&
        !uri.contains("/login")) { response.sendRedirect(request.getContextPath() + "/login" ); return; } %>

        <header class="flex justify-between items-center bg-white px-5 py-4 mb-10">
            <a href="<%= request.getContextPath() %>/">
                <img src="<%= request.getContextPath() %>/img/logo.png" class="w-46" alt="Logo">
            </a>

            <div class="flex justify-end items-center gap-x-5">
                <ul class="flex justify-end items-center gap-x-5 [&_a]:text-slate-600 [&_a]:hover:text-primary">
                    <li>
                        <a href="<%= request.getContextPath() %>/">Dashboard</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/transportation">Transportasi</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/booking">Pesanan</a>
                    </li>
                </ul>
                <% if (email==null) { %>
                    <a class="tombol" href="<%= request.getContextPath() %>/login">Login</a>
                    <% } else { %>
                        <form action="<%= request.getContextPath() %>/logout-post" method="post">
                            <button class="tombol" type="submit">

                                Logout
                            </button>
                        </form>
                        <% } %>
            </div>
        </header>



        <% String error=(String) request.getAttribute("error"); if (error !=null && !uri.contains("/login")) { %>
            <div class="max-w-96 mx-auto mb-7">
                <p class="bg-red-50 p-3 text-center col-span-full rounded-lg border border-red-300 opacity-80">
                    <%= error %>
                </p>
            </div>
            <% } %>