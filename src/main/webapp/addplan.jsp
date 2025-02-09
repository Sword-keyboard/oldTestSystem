<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>填写老年人能力评估基本信息表</title>
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
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: left;
            max-width: 100%;
            margin: 0 auto;
        }
        h2 {
            font-size: 1.5em;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: inline-block;
            width: 120px;
            font-weight: bold;
            vertical-align: top;
        }
        .form-group input,
        .form-group select {
            width: calc(100% - 130px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            vertical-align: top;
        }
        .form-group select {
            width: calc(100% - 130px + 15px);
        }
        .form-group input[type="text"],
        .form-group input[type="date"] {
            width: calc(100% - 130px);
        }
        .form-group input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .form-group input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form action="addplan" method="post">
        <div class="container">
            <h2>填写老年人能力评估基本信息表</h2>

            <div class="form-group">
                <label for="number">评估编号：</label>
                <input name="number" type="text" id="number">
            </div>

            <div class="form-group">
                <label for="date">评估基准日期：</label>
                <input name="date" type="date" id="date">
            </div>

            <div class="form-group">
                <label for="reason">评估原因：</label>
                <select name="reason" id="reason">
                    <option value="接受服务前初评">接受服务前初评</option>
                    <option value="接受服务后的常规评估">接受服务后的常规评估</option>
                    <option value="状况发生变化后的即时评估">状况发生变化后的即时评估</option>
                    <option value="因评估结果有疑问进行的复评">因评估结果有疑问进行的复评</option>
                </select>
            </div>

            <div class="form-group">
                <input type="submit" value="完成">
            </div>
        </div>
    </form>
</body>
</html>
