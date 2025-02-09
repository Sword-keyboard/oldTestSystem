<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>填写信息提供者及联系人信息</title>
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

        #otherrelation {
            display: none;
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
<form action="addinformat" method="post">
    <div class="container">
        <h2>填写信息提供者及联系人信息表</h2>

        <div class="form-group">
            <label for="name">信息提供者的姓名：</label>
            <input name="name" type="text" id="name">
        </div>

        <div class="form-group">
            <label for="relation">信息提供者与老人的关系：</label>
            <select name="relation" id="relation">
                <option value="配偶">配偶</option>
                <option value="子女">子女</option>
                <option value="其他亲属">其他亲属</option>
                <option value="雇佣照顾者">雇佣照顾者</option>
                <option value="其他">其他</option>
            </select>

            <label for="otherrelation"></label>
            <input name="otherrelation" type="text" id="otherrelation" style="display: none">
        </div>

        <div class="form-group">
            <label for="contacts">联系人姓名：</label>
            <input name="contacts" type="text" id="contacts">
        </div>

        <div class="form-group">
            <label for="phone">联系人电话：</label>
            <input name="phone" type="text" id="phone">
        </div>

    <input type="hidden" name="number" value="<%=session.getAttribute("number")%>">
    <input type="hidden" name="idnumber" value="<%=session.getAttribute("idnumber")%>">

        <div class="form-group">
            <input type="submit" value="完成">
        </div>

    </div>
</form>
</body>
</html>
