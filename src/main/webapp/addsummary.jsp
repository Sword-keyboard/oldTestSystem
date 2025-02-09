<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>老年人能力评估表</title>
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
    </style>
</head>
<body>
<form action="addsummary" method="post">
    <div class="container">
        <h2>填写老年人能力评估报告</h2>

        <div class="form-group">
            <label for="level1">日常生活活动：</label>
            <select id="level1" name="level1">
                <option value="0">0级</option>
                <option value="1">1级</option>
                <option value="2">2级</option>
                <option value="3">3级</option>
            </select>
        </div>

        <div class="form-group">
            <label for="level2">精神状态：</label>
            <select id="level2" name="level2">
                <option value="0">0级</option>
                <option value="1">1级</option>
                <option value="2">2级</option>
                <option value="3">3级</option>
            </select>
        </div>

        <div class="form-group">
            <label for="level3">感知觉与沟通：</label>
            <select id="level3" name="level3">
                <option value="0">0级</option>
                <option value="1">1级</option>
                <option value="2">2级</option>
                <option value="3">3级</option>
            </select>
        </div>

        <div class="form-group">
            <label for="level4">社会参与：</label>
            <select id="level4" name="level4">
                <option value="0">0级</option>
                <option value="1">1级</option>
                <option value="2">2级</option>
                <option value="3">3级</option>
            </select>
        </div>

        <div class="form-group">
            <label for="name1">老年人姓名：</label>
            <input type="text" id="name1" name="name1" placeholder="请输入老年人姓名">
        </div>

        <div class="form-group">
            <label for="level5">最终等级：</label>
            <select id="level5" name="level5">
                <option value="0">能力完好</option>
                <option value="1">轻度失能</option>
                <option value="2">中度失能</option>
                <option value="3">重度失能</option>
            </select>
        </div>

        <div class="form-group">
            <label for="name2">评估员签名：</label>
            <input type="text" id="name2" name="name2" placeholder="请输入评估员签名">
        </div>

        <div class="form-group">
            <label for="date1">评估日期：</label>
            <input type="date" id="date1" name="date1">
        </div>

        <div class="form-group">
            <label for="name3">信息提供者签名：</label>
            <input type="text" id="name3" name="name3" placeholder="请输入信息提供者签名">
        </div>

        <div class="form-group">
            <label for="date2">信息提供日期：</label>
            <input type="date" id="date2" name="date2">
        </div>

        <div class="form-group">
            <label for="idnumber">被评估者的身份证号：</label>
            <input name="idnumber" type="text" id="idnumber">
        </div>

        <div class="form-group">
            <input type="submit" value="提交">
        </div>

        <div class="form-group">
            <h3>老年人能力初步等级划分标准</h3>
            <p>0 能力完好：日常生活活动、精神状态、感知觉与沟通分级均为 0，社会参与分级为 0 或 1</p>
            <p>1 轻度失能：日常生活活动分级为 0，但精神状态、感知觉与沟通中至少一项分级为 1 及以上，或社会参与的分级为 2； 或日常生活活动分级为 1，精神状态、感知觉与沟通、社会参与中至少有一项的分级为 0 或 1</p>
            <p>2 中度失能：日常生活活动分级为 1，但精神状态、感知觉与沟通、社会参与均为 2，或有一项为 3； 或日常生活活动分级为 2，且精神状态、感知觉与沟通、社会参与中有 1-2 项的分级为 1 或 2</p>
            <p>3 重度失能：日常生活活动的分级为 3； 或日常生活活动、精神状态、感知觉与沟通、社会参与分级均为 2； 或日常生活活动分级为 2，且精神状态、感知觉与沟通、社会参与中至少有一项分级为 3</p>
            <img src="img.png" alt="老年人能力评估结果判定卡" style="width: auto;height: auto">
        </div>

    </div>
</form>
</body>
</html>