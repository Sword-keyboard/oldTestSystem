<%@ page import="java.util.List" %>
<%@ page import="data.plandata" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看老年人能力评估基本信息表</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
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
            width: 80%;
            max-width: 800px;
            text-align: left;
            position: absolute;
            top: 20px;
            left: 20px;
        }
        h2 {
            font-size: 1.0em;
            margin-bottom: 20px;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            display: inline-block;
            width: 150px;
            margin-right: 10px;
            font-weight: bold;
        }
        input[type="text"], input[type="submit"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size:0.8em;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #eaeaea;
        }
        .delete-form {
            display: inline-block;
        }
        .delete-form input[type="submit"], .edit-form input[type="submit"] {
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 6px 12px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .delete-form input[type="submit"]:hover, .edit-form input[type="submit"]:hover {
            background-color: #c82333;
        }
        .edit-form select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            width: calc(100% - 162px);
        }
        .scrollable-container {
            max-height: 500px;
            overflow-y: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>查看老年人能力评估基本信息表</h2>
    <form action="checkplan" method="get">
        <label for="number" > 评估编号：</label >
        <input name = "number" type = "text" id = "number" ><br>

        <input type="submit" value="查看">
    </form>
    <div style="overflow: auto">
        <table class="scrollable-container">
            <tr>
                <th>评估编号</th>
                <th>评估基准日期</th>
                <th>评估原因</th>
                <th>操作</th>
            </tr>
            <%
                List<plandata> data = (List<plandata>) request.getAttribute("data");
                if (data != null && !data.isEmpty())
                    for (plandata d : data) { %>
            <tr>
                <td><%= d.getNumber() %></td>
                <td><%= d.getDate() %></td>
                <td><%= d.getReason() %></td>
                <td>
                    <form action="deleteplan" method="post" class="delete-form">
                        <input name="number" type="hidden" value="<%= d.getNumber() %>">
                        <input type="submit" value="删除">
                    </form>
                    <form action="editplan" method="post" class="edit-form">
                        <input name="number" type="hidden" value="<%= d.getNumber() %>">
                        <label for="date">评估基准日期:</label>
                        <input name="date" type="text" id="date" value="<%= d.getDate() %>">
                        <label for="reason">评估原因</label>
                        <select name="reason" id="reason">
                            <option value="接受服务前初评" <%= "接受服务前初评".equals(d.getReason()) ? "selected" : "" %>>接受服务前初评</option>
                            <option value="接受服务后的常规评估" <%= "接受服务后的常规评估".equals(d.getReason()) ? "selected" : "" %>>接受服务后的常规评估</option>
                            <option value="状况发生变化后的即时评估" <%= "状况发生变化后的即时评估".equals(d.getReason()) ? "selected" : "" %>>状况发生变化后的即时评估</option>
                            <option value="因评估结果有疑问进行的复评" <%= "因评估结果有疑问进行的复评".equals(d.getReason()) ? "selected" : "" %>>因评估结果有疑问进行的复评</option>
                        </select>
                        <input type="submit" value="修改">
                    </form>
                </td>
            </tr>
            <% }
             else { %>
            <tr>
                <td colspan="4" style="text-align:center;">暂无数据</td>
            </tr>
            <% } %>
        </table>
    </div>
</div>
</body>
</html>

