<%@ page import="java.util.List" %>
<%@ page import="data.informatdata" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看信息提供者及联系人信息表</title>
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
    <script>
        function showAdditionalFields() {
            const relationSelect = document.getElementById('relation');

            const otherrelation = document.getElementById('otherrelation');

            if (relationSelect.value === '其他') {
                otherrelation.style.display = 'block';
            } else {
                otherrelation.style.display = 'none';
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            const relationSelect=document.getElementById("relation")

            relationSelect.addEventListener('change',showAdditionalFields);

            showAdditionalFields();
        });
    </script>
</head>
<body>
<div class="container">
    <h2>查看信息提供者及联系人信息表</h2>
    <form action="checkinformat" method="get">
        <%
            String type=request.getParameter("type");
            String idnumber=request.getParameter("idnumber");
            if(type.equals("评估员")||type.equals("管理员")){%>
        <label for="checknumber">评估编号：</label>
        <input name="number" type="text" id="checknumber">
        <%}else{%>
        <input name="idnumber" type="hidden" value="<%=idnumber%>">
        <%}%>

        <input name="type" type="hidden" value="<%=type%>">

        <input type="submit" value="查看">
    </form>
    <div style="overflow: auto;">
        <table border="1" class="scrollable-container">
            <tr>
                <th>信息提供者的姓名</th>
                <th>信息提供者与老人的关系</th>
                <th>联系人姓名</th>
                <th>联系人电话</th>
            </tr>
            <%
                List<informatdata> data=(List<informatdata>)request.getAttribute("data");
                if(data!=null&&!data.isEmpty())
                    for(informatdata d:data){%>
            <tr>
                <td><%=d.getName()%></td>
                <td><%=d.getRelation()%></td>
                <td><%=d.getContacts()%></td>
                <td><%=d.getPhone()%></td>
                    <td>
                        <!--
                    <form action="deleteinformat" method="post" class="delete-form">
                        <input name="number" type="hidden" value="<%=d.getNumber()%>" >

                        <input type="submit" value="删除">
                    </form>
                    -->
                        <form action="editinformat" method="post" class="edit-form">
                            <input name="number" type="hidden" value="<%= d.getNumber() %>">

                            <label for="name">信息提供者的姓名：</label>
                            <input name="name" type="text" id="name" value="<%= d.getName() %>">

                            <label for="relation">信息提供者与老人的关系：</label>
                            <select name="relation" id="relation" onchange="showAdditionalFields()">
                                <option value="配偶" <%= "配偶".equals(d.getRelation()) ? "selected" : "" %>>配偶</option>
                                <option value="子女" <%= "子女".equals(d.getRelation()) ? "selected" : "" %>>子女</option>
                                <option value="其他亲属" <%= "其他亲属".equals(d.getRelation()) ? "selected" : "" %>>其他亲属</option>
                                <option value="雇佣照顾者" <%= "雇佣照顾者".equals(d.getRelation()) ? "selected" : "" %>>雇佣照顾者</option>
                                <option value="其他" <%= "其他".equals(d.getRelation()) ? "selected" : "" %>>其他</option>
                            </select>
                            <input name="otherrelation" type="text" id="otherrelation" style="display: <%= "其他".equals(d.getRelation()) ? "block" : "none" %>;">

                            <label for="contacts">联系人姓名：</label>
                            <input name="contacts" type="text" id="contacts" value="<%= d.getContacts() %>">

                            <label for="phone">联系人电话：</label>
                            <input name="phone" type="text" id="phone" value="<%= d.getPhone() %>">

                            <input type="submit" value="修改">
                    </form>
                        </td>
            </tr>
                <%}
                else { %>
            <tr>
                <td colspan="4" style="text-align:center;">暂无数据</td>
            </tr>
            <% } %>
            %>
        </table>
    </div>
</div>
</body>
</html>
