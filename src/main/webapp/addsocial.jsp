<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>填写社会参与评估表</title>
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
<form action="addsocial" method="post">
    <div class="container">
        <h2>填写社会参与评估表</h2>

        <div class="form-group">
            <label for="live">生活能力：</label>
            <select name="live" id="live">
                <option value="0">0 分，除个人生活自理外，能料理家务或当家管理事务</option>
                <option value="1">1 分，除个人生活自理外，能做家务，但欠好，家庭事务安排欠条理</option>
                <option value="2">2 分，个人生活能自理；只有在他人帮助下才能做些家务，但质量不好</option>
                <option value="3">3 分，个人基本生活事务能自理（如饮食、二便），在督促下可洗漱</option>
                <option value="4">4 分，个人基本生活事务（如饮食、二便）需要部分帮助或完全依赖他人帮助</option>
            </select>
        </div>

        <div class="form-group">
            <label for="work">工作能力：</label>
            <select name="work" id="work">
                <option value="0">0 分，原来熟练的脑力工作或体力技巧性工作可照常进行</option>
                <option value="1">1 分，原来熟练的脑力工作或体力技巧性工作能力有所下降</option>
                <option value="2">2 分，原来熟练的脑力工作或体力技巧性工作明显不如以往，部分遗忘</option>
                <option value="3">3 分，对熟练工作只有一些片段保留，技能全部遗忘</option>
                <option value="4">4 分，对以往的知识或技能全部磨灭</option>
            </select>
        </div>

        <div class="form-group">
            <label for="timespace">时间/空间定向：</label>
            <select name="timespace" id="timespace">
                <option value="0">0 分，时间观念（年、月、日、时）清楚；可单独出远门，能很快掌握新环境的方位</option>
                <option value="1">1 分，时间观念有些下降，年、月、日清楚，但有时相差几天；可单独来往于近街，知道现住地的名称和方位，但不知回家路线</option>
                <option value="2">2 分，时间观念较差，年、月、日不清楚，可知上半年或下半年；只能单独在家附近行动，对现住地只知名称，不知道方位</option>
                <option value="3">3 分，时间观念很差，年、月、日不清楚，可知上午或下午；只能在左邻右舍间串门，对现住地不知名称和方位</option>
                <option value="4">4 分，无时间观念；不能单独外出</option>
            </select>
        </div>

        <div class="form-group">
            <label for="relation">人物定向：</label>
            <select name="relation" id="relation">
                <option value="0">0 分，知道周围人们的关系，知道祖孙、叔伯、姑姨、侄子侄女等称谓的意义；可分辨陌生人的大致年龄和身份，可用适当称呼</option>
                <option value="1">1 分，只知家中亲密近亲的关系，不会分辨陌生人的大致年龄，不能称呼陌生人</option>
                <option value="2">2 分，只能称呼家中人，或只能照样称呼，不知其关系，不辨辈分</option>
                <option value="3">3 分，只认识常同住的亲人，可称呼子女或孙子女，可辨熟人和生人</option>
                <option value="4">4 分，只认识保护人，不辨熟人和生人</option>
            </select>
        </div>

        <div class="form-group">
            <label for="socialing">社会交往能力：</label>
            <select name="socialing" id="socialing">
                <option value="0">0 分，参与社会，在社会环境有一定的适应能力，待人接物恰当</option>
                <option value="1">1 分，能适应单纯环境，主动接触人，初见面时难让人发现智力问题，不能理解隐喻语</option>
                <option value="2">2 分，脱离社会，可被动接触，不会主动待人，谈话中很多不适词句，容易上当受骗</option>
                <option value="3">3 分，勉强可与人交往，谈吐内容不清楚，表情不恰当</option>
                <option value="4">4 分，难以与人接触</option>
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
