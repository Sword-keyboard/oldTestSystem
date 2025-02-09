<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url("117a94c5-8e45-42c8-947f-6085fb41242b.jpg");
            background-size: cover;
            background-position: center;
        }
        .login-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: left;
        }
        .login-container h2 {
            font-size: 1.5em;
            margin-bottom: 20px;
            text-align: center;
        }
        .login-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .login-container input[type="text"], .login-container select, .login-container input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .login-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .login-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .login-container a {
            display: block;
            margin-top: 15px;
            color: #007BFF;
            text-decoration: none;
            text-align: center;
        }
        .login-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<form action="index" method="post" target="_self">
    <div class="login-container">
        <h2>欢迎登录</h2>
        <label for="type">角色：</label>
        <select id="type" name="type">
            <option value="管理员">管理员</option>
            <option value="评估员">评估员</option>
            <option value="被评估者">老年人或其照顾者</option>
        </select><br>

        <label for="id">账号：</label>
        <input name="id" type="text" id="id"><br>

        <label for="password">密码：</label>
        <input name="password" type="password" id="password"><br>

        <input type="submit" value="登录">
        <a href="registe.jsp" target="_self">注册</a>
    </div>
</form>
</body>
</html>

