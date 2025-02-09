<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>填写日常生活活动评估表</title>
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
<form action="adddaily" method="post">
    <div class="container">
        <h2>填写日常生活活动评估表</h2>

        <div class="form-group">
            <label for="idnumber">被评估者的身份证号：</label>
            <input name="idnumber" type="text" id="idnumber">
        </div>

        <div class="form-group">
            <label for="eat">进食(指用餐具将食物由容器送到口中、咀嚼、吞咽等过程)：</label>
            <select id="eat" name="eat">
                <option value="10">10 分，可独立进食</option>
                <option value="5">5 分，需部分帮助</option>
                <option value="0">0 分，需极大帮助或完全依赖他人，或有留置营养管</option>
            </select>
        </div>

        <div class="form-group">
            <label for="bath">洗澡：</label>
            <select id="bath" name="bath">
                <option value="5">5 分，准备好洗澡水后，可自己独立完成洗澡过程</option>
                <option value="0">0 分，在洗澡过程中需他人帮助</option>
            </select>
        </div>

        <div class="form-group">
            <label for="wash">修饰(指洗脸、刷牙、梳头、刮脸等)：</label>
            <select id="wash" name="wash">
                <option value="5">5 分，可自己独立完成</option>
                <option value="0">0 分，需他人帮助</option>
            </select>
        </div>

        <div class="form-group">
            <label for="cloth">穿衣(指穿脱衣服、系扣、拉拉链、穿脱鞋袜、系鞋带)：</label>
            <select id="cloth" name="cloth">
                <option value="10">10 分，可独立完成</option>
                <option value="5">5 分，需部分帮助</option>
                <option value="0">0 分，需极大帮助或完全依赖他人</option>
            </select>
        </div>

        <div class="form-group">
            <label for="stool">大便控制：</label>
            <select id="stool" name="stool">
                <option value="10">10 分，可控制大便</option>
                <option value="5">5 分，偶尔失控（每周<1 次），或需要他人提示</option>
                <option value="0">0 分，完全失控</option>
            </select>
        </div>

        <div class="form-group">
            <label for="urinal">小便控制：</label>
            <select id="urinal" name="urinal">
                <option value="10">10 分，可控制小便</option>
                <option value="5">5 分，偶尔失控（每天<1 次，但每周>1 次），或需要他人提示</option>
                <option value="0">0 分，完全失控，或留置导尿管</option>
            </select>
        </div>

        <div class="form-group">
            <label for="toilet">如厕(包括去厕所、解开衣裤、擦净、整理衣裤、冲水)：</label>
            <select id="toilet" name="toilet">
                <option value="10">10 分，可独立完成</option>
                <option value="5">5 分，需部分帮助</option>
                <option value="0">0 分，需极大帮助或完全依赖他人</option>
            </select>
        </div>

        <div class="form-group">
            <label for="move">床椅转移：</label>
            <select id="move" name="move">
                <option value="15">15 分，可独立完成</option>
                <option value="10">10 分，需部分帮助</option>
                <option value="5">5 分，需极大帮助</option>
                <option value="0">0 分，完全依赖他人</option>
            </select>
        </div>

        <div class="form-group">
            <label for="walk">平地行走：</label>
            <select id="walk" name="walk">
                <option value="15">15 分，可独立在平地上行走 45m</option>
                <option value="10">10 分，需部分帮助</option>
                <option value="5">5 分，需极大帮助</option>
                <option value="0">0 分，完全依赖他人</option>
            </select>
        </div>

        <div class="form-group">
            <label for="floor">上下楼梯：</label>
            <select id="floor" name="floor">
                <option value="10">10 分，可独立上下楼梯（连续上下 10-15 个台阶）</option>
                <option value="5">5 分，需部分帮助</option>
                <option value="0">0 分，需极大帮助或完全依赖他人</option>
            </select>
        </div>

        <div class="form-group">
            <input type="submit" value="提交">
        </div>

    </div>
</form>
</body>
</html>
