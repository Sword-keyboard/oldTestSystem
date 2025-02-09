<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>填写精神状态评估表</title>
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
<form action="addmood" method="post">
    <div class="container">
        <h2>填写精神状态评估表</h2>

        <div class="form-group">
            <label for="cogintion">认知功能：</label>
            <p>测验：       记忆测验：“我说三样东西，请重复一遍，并记住，一会儿会问您”：苹果、手表、国旗
                           画钟测验：“请您画一个圆形的时钟，在时钟上标出 10 点 45 分”</p>
            <select name="cogintion" id="cogintion">
                <option value="0">0 分，画钟正确（画出一个闭锁圆，指针位置准确），且能回忆出 2-3 个词</option>
                <option value="1">1 分，画钟错误（画的圆不闭锁，或指针位置不准确），或只回忆出 0-1 个词</option>
                <option value="2">2 分，已确诊为认知障碍，如老年痴呆</option>
            </select>
        </div>

        <div class="form-group">
            <label for="attack">攻击行为：</label>
            <select name="attack" id="attack">
                <option value="0">0 分，无身体攻击行为和语言攻击行为</option>
                <option value="1">1 分，每月有几次身体攻击行为，或每周有几次语言攻击行为</option>
                <option value="2">2 分，每周有几次身体攻击行为，或每日有语言攻击行为</option>
            </select>
        </div>

        <div class="form-group">
            <label for="depression">抑郁症状：</label>
            <select name="depression" id="depression">
                <option value="0">0 分，无</option>
                <option value="1">1 分，情绪低落、不爱说话、不爱梳洗、不爱活动</option>
                <option value="2">2 分，有自杀念头或自杀行为</option>
            </select>
        </div>

        <div class="form-group">
            <label for="total">精神状态总分：</label>
            <input name="total" type="text" id="total" readonly>
        </div>

        <div class="form-group">
            <label for="level">精神状态分级：</label>
            <select name="level" id="level">
                <option value="0">0 能力完好：总分为 0 分</option>
                <option value="1">1 轻度受损：总分为 1 分</option>
                <option value="2">2 中度受损：总分 2-3 分</option>
                <option value="3">3 重度受损：总分 4-6 分</option>
            </select>
        </div>

        <%
            String idnumber=(String)session.getAttribute("idnumber");
        %>

        <input name="idnumber" type="hidden" value="<%=idnumber%>">

        <div class="form-group">
            <input type="submit" value="完成">
        </div>
    </div>
</form>
</body>
</html>
