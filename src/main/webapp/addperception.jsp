<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>填写感知觉与沟通评估表</title>
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
<form action="addperception" method="post">
    <div class="container">
        <h2>填写感知觉与沟通评估表</h2>

        <div class="form-group">
            <label for="consciousness">意识水平：</label>
            <select name="consciousness" id="consciousness">
                <option value="0">0 分，神志清醒</option>
                <option value="1">1 分，嗜睡</option>
                <option value="2">2 分，昏睡</option>
                <option value="3">3 分，昏迷</option>
            </select>
        </div>

        <div class="form-group">
            <label for="vision">视力：</label>
            <select name="vision" id="vision">
                <option value="0">0 分，能看清书报上的标准字体</option>
                <option value="1">1 分，能看清楚大字体，但看不清书报上的标准字体</option>
                <option value="2">2 分，视力有限，看不清报纸大标题，但能辨认物体</option>
                <option value="3">3 分，辨认物体有困难，但眼睛能跟随物体移动，只能看到光、颜色和形状</option>
                <option value="4">4 分，没有视力，眼睛不能跟随物体移动</option>
            </select>
        </div>

        <div class="form-group">
            <label for="hearing">听力：</label>
            <select name="hearing" id="hearing">
                <option value="0">0 分，可正常交谈</option>
                <option value="1">1 分，在轻声说话或说话距离超过 2 米时听不清</option>
                <option value="2">2 分，正常交流有些困难，需在安静的环境或大声说话才能听到</option>
                <option value="3">3 分，讲话者大声说话或说话很慢，才能部分听见</option>
                <option value="4">4 分，完全听不见</option>
            </select>
        </div>

        <div class="form-group">
            <label for="communication">沟通交流：</label>
            <select name="communication" id="communication">
                <option value="0">0 分，无困难，能与他人正常沟通和交流</option>
                <option value="1">1 分，能够表达自己的需要及理解别人的话，但需要增加时间或给予帮助</option>
                <option value="2">2 分，表达需要或理解有困难，需频繁重复或简化口头表达</option>
                <option value="3">3 分，不能表达需要或理解他人的话</option>
            </select>
        </div>

        <%
            String idnumber=(String)session.getAttribute("idnumber");
        %>

        <input name="idnumber" type="hidden" value="<%=idnumber%>">

        <div class="form-group">
            <input type="submit" value="提交">
        </div>
    </div>
</form>
</body>
</html>
