<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>老年人能力评估界面</title>
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
            text-align: center;
            max-width: 100%;
            margin: 0 auto;
        }
        h2 {
            font-size: 1.5em;
            margin-bottom: 20px;
        }
        a {
            display: inline-block;
            margin: 10px 0;
            color: #007BFF;
            text-decoration: none;
            font-size: 16px;
            padding: 10px 20px;
            background-color: #f1f1f1;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #d1d1d1;
            text-decoration: none;
        }
    </style>
</head>
<body>
<%
    String type = (String) session.getAttribute("type");
    String idnumber=(String) session.getAttribute("id");
    if("管理员".equals(type)){%>
    <a href="adduser.jsp" target="_blank">添加评估员</a>
    <a href="checkplan.jsp?" target="_blank">查看老年人能力评估基本信息表</a>
<%} else if ("评估员".equals(type)) {%>
<div class="container">
    <h2>操作界面</h2>
    <a href="addplan.jsp" target="_blank">填写信息</a>
    <a href="checkplan.jsp?" target="_blank">查看老年人能力评估基本信息表</a>
    <a href="adddaily.jsp" target="_blank">能力评估</a>
<%}%>
    <a href="checkpeople.jsp?idnumber=<%=idnumber%>&type=<%=type%>"  target="_blank" >查看被评估者的基本信息表</a>
    <a href="checkinformat.jsp?idnumber=<%=idnumber%>&type=<%=type%>" target="_blank">查看信息提供者及联系人信息表</a>
    <a href="checksummary.jsp?idnumber=<%=idnumber%>&type=<%=type%>" target="_blank">查看老年人能力评估结果</a>
</div>
</body>
</html>