<%@ page import="data.summarydata" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看老年人能力评估结果</title>
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
    </style>
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
    <table>
        <tbody>
        <%
            List<summarydata> data = (List<summarydata>) request.getAttribute("data");
            if (data != null && !data.isEmpty())
                for (summarydata d : data) { %>
        <tr>
            <th colspan="2">C.1 一级指标</th>
        </tr>
        <tr>
            <th>分级</th>
            <th></th>
        </tr>
        <tr>
            <td>C.1.1 日常生活活动：</td>
            <td><%=d.getLevel1()%>级</td>
        </tr>
        <tr>
            <td>C.1.2 精神状态：</td>
            <td><%=d.getLevel2()%>级</td>
        </tr>
        <tr>
            <td>C.1.3 感知觉与沟通：</td>
            <td><%=d.getLevel3()%>级</td>
        </tr>
        <tr>
            <td>C.1.4 社会参与：</td>
            <td><%=d.getLevel4()%>级</td>
        </tr>
        <tr>
            <td colspan="2">C.2 老年人能力初步等级</td>
        </tr>
        <tr>
            <td><%=d.getLevel5()%> <%
                if (d.getLevel5() == 0) {%>
                能力完好
                <% } else if (d.getLevel5() == 1) {%>
                轻度失能
                <% } else if (d.getLevel5() == 2) {%>
                中度失能
                <% } else if (d.getLevel5() == 3) {%>
                重度失能
                <% }%>
            </td>
        </tr>
        <tr>
            <td colspan="2">C.3 等级变更条款</td>
        </tr>
        <tr>
            <td colspan="2">
                <%=d.getLevel6()%>
                <% if (d.getLevel6() == 1) {%>
                有认知障碍/痴呆、精神疾病者，在原有能力级别上提高一个等级
                <% } else if (d.getLevel6() == 2) {%>
                近 30 天内发生过 2 次及以上跌倒、噎食、自杀、走失者，在原有能力级别上提高一个等级；
                <% } else if (d.getLevel6() == 3) {%>
                处于昏迷状态者，直接评定为重度失能
                <% } else if (d.getLevel6() == 4) {%>
                有认知障碍/痴呆、精神疾病者，在原有能力级别上提高一个等级
                <% }%>
            </td>
        </tr>
        <tr>
            <td colspan="2">C.4 老年人能力最终等级</td>
        </tr>
        <tr>
            <td><%=d.getLevel7()%> <%
                if (d.getLevel7() == 0) {%>
                能力完好
                <% } else if (d.getLevel7() == 1) {%>
                轻度失能
                <% } else if (d.getLevel7() == 2) {%>
                中度失能
                <% } else if (d.getLevel7() == 3) {%>
                重度失能
                <% }%>
            </td>
        </tr>
        <tr>
            <td>评估员签名</td>
            <td><%=d.getName1()%>、<%=d.getName2()%></td>
        </tr>
        <tr>
            <td>日期</td>
            <td><%=d.getDate1()%></td>
        </tr>
        <tr>
            <td>信息提供者签名</td>
            <td><%=d.getName3()%></td>
        </tr>
        <tr>
            <td>日期</td>
            <td><%=d.getDate2()%></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
