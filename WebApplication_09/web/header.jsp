

<!--<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .header {
        background-color: #2c3e50;
        padding: 1rem 0;
        width: 100%;
        top: 0;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
    }

    .nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        color: #fff;
        font-size: 1.5rem;
        font-weight: bold;
        text-decoration: none;
    }

    .menu {
        display: flex;
        list-style: none;
        gap: 2rem;
    }

    .menu-item a {
        color: #fff;
        text-decoration: none;
        font-size: 1rem;
        transition: color 0.3s ease;
    }

    .menu-item a:hover {
        color: #3498db;
    }

    .search-bar {
        display: flex;
        align-items: center;
        background: #fff;
        border-radius: 20px;
        padding: 0.5rem 1rem;
    }

    .search-input {
        border: none;
        outline: none;
        padding: 0.2rem;
        width: 200px;
    }

    .search-button {
        background: none;
        border: none;
        cursor: pointer;
        color: #2c3e50;
    }
</style>

<header class="header">
    <%
        int x = 100;
    %>
    <div class="container">
        <nav class="nav">
            <a href="#" class="logo">SHOP ONLINE</a>
            <ul class="menu">
                <li class="menu-item"><a href="#">Trang chủ</a></li>
                <li class="menu-item"><a href="#">Sản phẩm</a></li>
                <li class="menu-item"><a href="#">Giỏ hàng</a></li>
                <li class="menu-item"><a href="#">Liên hệ</a></li>
            </ul>
            <div class="search-bar">
                <input type="text" class="search-input" placeholder="Tìm kiếm...">
                <button class="search-button">🔍</button>
            </div>
        </nav>
    </div>
</header>-->
    



<%-- 
    Document   : header
    Created on : Feb 17, 2025, 11:01:38 AM
    Author     : fuci
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">

<style>
    body {
        background-color: #1a1a1a;
        color: white;
        font-family: Arial, sans-serif;
        image-rendering: pixelated;
        margin: 0;
    }

    .pixel-text {
        font-family: 'Press Start 2P', cursive;
        text-transform: uppercase;
        color: #ffffff; /* đảm bảo chữ luôn màu trắng */
    }

    .pixel-border {
        border: 4px solid black;
        background-color: #f4c400;
        box-shadow: 4px 4px 0 black;
        padding: 10px;
        display: inline-block;
    }

    .header {
        background-color: #20232a;
        padding: 15px 0;
        color: white;
    }

    .header-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 90%;
        margin: auto;
    }

    .menu {
        display: flex;
        gap: 20px;
    }

    .menu a {
        color: white;
        text-decoration: none;
    }

    .menu a:hover {
        color: #ff5722;
    }

    .pixel-button {
        background-color: #0073e6;
        color: white;
        border: 4px solid black;
        padding: 8px 15px;
        border-radius: 5px;
        font-family: 'Press Start 2P', cursive;
        cursor: pointer;
        box-shadow: 4px 4px 0 black;
    }

    .pixel-button:hover {
        background-color: #ff5722;
    }

    /* Search Bar */
    .search-container {
        display: flex;
        align-items: center;
        background: white;
        border-radius: 30px;
        padding: 5px 15px;
        width: 45px;
        transition: width 0.3s ease-in-out;
        overflow: hidden;
        justify-content: center;
    }

    .search-container.expanded {
        width: 300px;
    }

    .search-icon {
        font-size: 18px;
        cursor: pointer;
        color: #5f6368;
    }

    .search-input {
        border: none;
        outline: none;
        font-size: 14px;
        margin-left: 10px;
        width: 100%;
        display: none;
    }

    .search-container.expanded .search-input {
        display: block;
    }

    /* Căn chỉnh header */
    .header-left {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    .header-right {
        display: flex;
        align-items: center;
        gap: 15px;
    }
</style>

<body>
    <header class="header">
        <div class="header-container">
            <!-- Bên trái -->
            <div class="header-left">
                <div class="pixel-border">
                    <h1 class="pixel-text">Game Store</h1>
                </div>
                <nav class="menu">
                    <a href="#">Store</a>
                    <a href="#">Genres</a>
                    <a href="#">Deals</a>
                    <a href="support.jsp">Support</a>
                </nav>
            </div>

            <!-- Bên phải -->
            <div class="header-right">
                <!-- Search Bar -->
                <div class="search-container" id="searchContainer">
                    <span class="search-icon" id="searchIcon">🔍</span>
                    <input type="text" class="search-input" id="searchInput" placeholder="Search for games">
                </div>
                <button class="pixel-button">Download</button>
                <a href="login.jsp" style="color: white;">Login</a> | 
                <a href="#" style="color: white;">Language ▼</a>
            </div>
        </div>
    </header>

    <script>
        const searchContainer = document.getElementById("searchContainer");
        const searchIcon = document.getElementById("searchIcon");
        const searchInput = document.getElementById("searchInput");

        searchIcon.addEventListener("click", () => {
            searchContainer.classList.toggle("expanded");
            if (searchContainer.classList.contains("expanded")) {
                searchInput.focus();
            }
        });

        document.addEventListener("click", (event) => {
            if (!searchContainer.contains(event.target)) {
                searchContainer.classList.remove("expanded");
            }
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const storeLink = document.querySelector(".menu a[href='#']");

            storeLink.addEventListener("click", function (event) {
                event.preventDefault();
                const isLoggedIn = <%= session.getAttribute("USER") != null%>;

                if (!isLoggedIn) {
                   alert("You need to log in to access the Store.");
                    window.location.href = "login.jsp";
                } else {
                    window.location.href = "store.jsp";
                }
            });
        });
    </script>


</body>