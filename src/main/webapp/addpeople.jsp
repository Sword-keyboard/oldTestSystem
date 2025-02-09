<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>填写被评估者的基本信息</title>
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

        #othernation, #otherreligion, #othermedical, #otherincome {
            display: none;
        }

        .scrollable-container {
            max-height: 500px;
            overflow-y: auto;
        }
    </style>
    <script>
        function showAdditionalFields() {
            const nationSelect = document.getElementById('nation');
            const religionSelect = document.getElementById('religion');
            const medicalSelect = document.getElementById('medical');
            const incomeSelect = document.getElementById('income');

            const othernation = document.getElementById('othernation');
            const otherreligion = document.getElementById('otherreligion');
            const othermedical = document.getElementById('othermedical');
            const otherincome = document.getElementById('otherincome');

            if (nationSelect.value === '少数民族') {
                othernation.style.display = 'block';
            } else {
                othernation.style.display = 'none';
            }

            if (religionSelect.value === '有') {
                otherreligion.style.display = 'block';
            } else {
                otherreligion.style.display = 'none';
            }

            if (medicalSelect.value === '其他') {
                othermedical.style.display = 'block';
            } else {
                othermedical.style.display = 'none';
            }

            if (incomeSelect.value === '其他补贴') {
                otherincome.style.display = 'block';
            } else {
                otherincome.style.display = 'none';
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            const nationSelect = document.getElementById('nation');
            const religionSelect = document.getElementById('religion');
            const medicalSelect = document.getElementById('medical');
            const incomeSelect = document.getElementById('income');

            nationSelect.addEventListener('change', showAdditionalFields);
            religionSelect.addEventListener('change', showAdditionalFields);
            medicalSelect.addEventListener('change', showAdditionalFields);
            incomeSelect.addEventListener('change', showAdditionalFields);

            showAdditionalFields();
        });
    </script>
</head>
<body>
<form action="addpeople" method="post">
    <div class="container">
        <h2>填写被评估者的基本信息</h2>
        <div class="scrollable-container">
            <div class="form-group">
                <label for="name">姓名：</label>
                <input name="name" type="text" id="name">
            </div>

            <div class="form-group">
                <label for="sex">性别：</label>
                <select name="sex" id="sex">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>

            <div class="form-group">
                <label for="birthday">出生日期：</label>
                <input name="birthday" type="date" id="birthday">
            </div>

            <div class="form-group">
                <label for="idnumber">身份证号：</label>
                <input name="idnumber" type="text" id="idnumber">
            </div>

            <div class="form-group">
                <label for="socialid">社保卡号：</label>
                <input name="socialid" type="text" id="socialid">
            </div>

            <div class="form-group">
                <label for="nation">民族：</label>
                <select name="nation" id="nation">
                    <option value="汉族">汉族</option>
                    <option value="少数民族">少数民族</option>
                </select>

                <label for="othernation"></label>
                <input name="othernation" type="text" id="othernation"  style="display: none">
            </div>

            <div class="form-group">
                <label for="education">文化程度：</label>
                <select name="education" id="education">
                    <option value="文盲">文盲</option>
                    <option value="小学">小学</option>
                    <option value="初中">初中</option>
                    <option value="高中/技校/中专">高中/技校/中专</option>
                    <option value="大学专科及以上">大学专科及以上</option>
                    <option value="不详">不详</option>
                </select>
            </div>

            <div class="form-group">
                <label for="religion">宗教信仰：</label>
                <select name="religion" id="religion">
                    <option value="无">无</option>
                    <option value="有">有</option>
                </select>

                <label for="otherreligion"></label>
                <input name="otherreligion" type="text" id="otherreligion" style="display: none;">
            </div>

            <div class="form-group">
                <label for="marriage">婚姻状况：</label>
                <select name="marriage" id="marriage">
                    <option value="未婚">未婚</option>
                    <option value="已婚">已婚</option>
                    <option value="丧偶">丧偶</option>
                    <option value="离婚">离婚</option>
                    <option value="未说明的婚姻状况">未说明的婚姻状况</option>
                </select>
            </div>

            <div class="form-group">
                <label for="reside">居住情况：</label>
                <select name="reside" id="reside">
                    <option value="独居">独居</option>
                    <option value="与配偶/伴侣居住">与配偶/伴侣居住</option>
                    <option value="与子女居住">与子女居住</option>
                    <option value="与父母居住">与父母居住</option>
                    <option value="与兄弟姐妹居住">与兄弟姐妹居住</option>
                    <option value="与其他亲属居住">与其他亲属居住</option>
                    <option value="与非亲属关系的人居住">与非亲属关系的人居住</option>
                    <option value="养老机构">养老机构</option>
                </select>
            </div>

            <div class="form-group">
                <label for="medical">医疗费用支付方式：</label>
                <select name="medical" id="medical">
                    <option value="城镇职工基本医疗保险">城镇职工基本医疗保险</option>
                    <option value="城镇居民基本医疗保险">城镇居民基本医疗保险</option>
                    <option value="新型农村合作医疗">新型农村合作医疗</option>
                    <option value="贫困救助">贫困救助</option>
                    <option value="商业医疗保险">商业医疗保险</option>
                    <option value="全公费">全公费</option>
                    <option value="全自费">全自费</option>
                    <option value="其他">其他</option>
                </select>

                <label for="othermedical"></label>
                <input name="othermedical" type="text" id="othermedical" style="display: none;">
            </div>

            <div class="form-group">
                <label for="income">经济来源：</label>
                <select name="income" id="income">
                    <option value="退休金/养老金">退休金/养老金</option>
                    <option value="子女补贴">子女补贴</option>
                    <option value="亲友资助">亲友资助</option>
                    <option value="其他补贴">其他补贴</option>
                </select>

                <label for="otherincome"></label>
                <input name="otherincome" type="text" id="otherincome" style="display: none;">
            </div>

            <div class="form-group">
                <label for="stupid">痴呆：</label>
                <select name="stupid" id="stupid">
                    <option value="无">无</option>
                    <option value="轻度">轻度</option>
                    <option value="中度">中度</option>
                    <option value="重度">重度</option>
                </select>
            </div>

            <div class="form-group">
                <label for="mental">精神疾病：</label>
                <select name="mental" id="mental">
                    <option value="无">无</option>
                    <option value="精神分裂症">精神分裂症</option>
                    <option value="双相情感障碍">双相情感障碍</option>
                    <option value="偏执性精神障碍">偏执性精神障碍</option>
                    <option value="分裂情感性障碍">分裂情感性障碍</option>
                    <option value="癫痫所致精神障碍">癫痫所致精神障碍</option>
                    <option value="精神发育迟滞伴发精神障碍">精神发育迟滞伴发精神障碍</option>
                </select>
            </div>

            <div class="form-group">
                <label for="chronic">慢性疾病：</label>
                <input name="chronic" type="text" id="chronic">
            </div>

            <div class="form-group">
                <label for="tumble">跌倒：</label>
                <select name="tumble" id="tumble">
                    <option value="无">无</option>
                    <option value="发生过 1 次">发生过 1 次</option>
                    <option value="发生过 2 次">发生过 2 次</option>
                    <option value="发生过 3 次及以上">发生过 3 次及以上</option>
                </select>
            </div>

            <div class="form-group">
                <label for="lost">走失：</label>
                <select name="lost" id="lost">
                    <option value="无">无</option>
                    <option value="发生过 1 次">发生过 1 次</option>
                    <option value="发生过 2 次">发生过 2 次</option>
                    <option value="发生过 3 次及以上">发生过 3 次及以上</option>
                </select>
            </div>

            <div class="form-group">
                <label for="dysphoria">噎食：</label>
                <select name="dysphoria" id="dysphoria">
                    <option value="无">无</option>
                    <option value="发生过 1 次">发生过 1 次</option>
                    <option value="发生过 2 次">发生过 2 次</option>
                    <option value="发生过 3 次及以上">发生过 3 次及以上</option>
                </select>
            </div>

            <div class="form-group">
                <label for="suicide">自杀：</label>
                <select name="suicide" id="suicide">
                    <option value="无">无</option>
                    <option value="发生过 1 次">发生过 1 次</option>
                    <option value="发生过 2 次">发生过 2 次</option>
                    <option value="发生过 3 次及以上">发生过 3 次及以上</option>
                </select>
            </div>

            <div class="form-group">
                <label for="other">其他：</label>
                <input name="other" type="text" id="other">
            </div>

                <input type="hidden" name="number" value="<%=session.getAttribute("number").toString()%>">

            <div class="form-group">
                <input type="submit" value="完成">
            </div>
            </div>
    </div>
</form>
</body>
</html>
