<%@ page import="java.util.List" %>
<%@ page import="data.peopledata" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看被评估者的基本信息表</title>
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
<div class="container">
    <h2>查看被评估者的基本信息表</h2>
    <form action="checkpeople" method="get">
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
                <th>姓名</th>
                <th>性别</th>
                <th>出生日期</th>
                <th>身份证号</th>
                <th>社保卡号</th>
                <th>民族</th>
                <th>文化程度</th>
                <th>宗教信仰</th>
                <th>婚姻状况</th>
                <th>居住情况</th>
                <th>医疗费用支付方式</th>
                <th>经济来源</th>
                <th>痴呆</th>
                <th>精神疾病</th>
                <th>慢性疾病</th>
                <th>跌倒</th>
                <th>走失</th>
                <th>噎食</th>
                <th>自杀</th>
                <th>其他</th>
            </tr>
            <%
                List<peopledata> data=(List<peopledata>) request.getAttribute("data");
                if(data!=null&&!data.isEmpty())
                    for(peopledata d:data){%>
            <tr>
                <td><%=d.getName()%></td>
                <td><%=d.getSex()%></td>
                <td><%=d.getBirthday()%></td>
                <td><%=d.getIdnumber()%></td>
                <td><%=d.getSocialid()%></td>
                <td><%=d.getNation()%></td>
                <td><%=d.getEducation()%></td>
                <td><%=d.getReligion()%></td>
                <td><%=d.getMarriage()%></td>
                <td><%=d.getReside()%></td>
                <td><%=d.getMedical()%></td>
                <td><%=d.getIncome()%></td>
                <td><%=d.getStupid()%></td>
                <td><%=d.getMental()%></td>
                <td><%=d.getChronic()%></td>
                <td><%=d.getTumble()%></td>
                <td><%=d.getLost()%></td>
                <td><%=d.getDysphoria()%></td>
                <td><%=d.getSuicide()%></td>
                <td><%=d.getOther()%></td>
                <td>
                    <!--
                    <form action="deletepeople" method="post" class="delete-form">
                        <input name="number" type="hidden" value="<%=d.getNumber()%>" >

                        <input type="submit" value="删除">
                    </form>
                    -->
                    <form action="editplan" method="post" class="edit-form">
                        <div class="scrollable-container">
                            <input name="number" type="hidden" value="<%=d.getNumber()%>">

                            <label for="name">姓名：</label>
                            <input name="name" type="text" id="name" value="<%=d.getName()%>">

                            <label for="sex">性别：</label>
                            <select name="sex" id="sex" onchange="showAdditionalFields()">
                                <option value="男" <%= "男".equals(d.getSex()) ? "selected" : "" %>>男</option>
                                <option value="女" <%= "女".equals(d.getSex()) ? "selected" : "" %>>女</option>
                            </select>

                            <label for="birthday">出生日期：</label>
                            <input name="birthday" type="date" id="birthday" value="<%=d.getBirthday()%>">

                            <label for="idnumber">身份证号：</label>
                            <input name="idnumber" type="text" id="idnumber" value="<%=d.getIdnumber()%>">

                            <label for="socialid">社保卡号：</label>
                            <input name="socialid" type="text" id="socialid" value="<%=d.getSocialid()%>">

                            <label for="nation">民族：</label>
                            <select name="nation" id="nation" onchange="showAdditionalFields()">
                                <option value="汉族" <%= "汉族".equals(d.getNation()) ? "selected" : "" %>>汉族</option>
                                <option value="少数民族" <%= "少数民族".equals(d.getNation()) ? "selected" : "" %>>少数民族</option>
                            </select>
                            <input name="othernation" type="text" id="othernation" style="display: <%= "少数民族".equals(d.getNation()) ? "block" : "none" %>;">

                            <label for="education">文化程度：</label>
                            <select name="education" id="education">
                                <option value="文盲" <%= "文盲".equals(d.getEducation()) ? "selected" : "" %>>文盲</option>
                                <option value="小学" <%= "小学".equals(d.getEducation()) ? "selected" : "" %>>小学</option>
                                <option value="初中" <%= "初中".equals(d.getEducation()) ? "selected" : "" %>>初中</option>
                                <option value="高中/技校/中专" <%= "高中/技校/中专".equals(d.getEducation()) ? "selected" : "" %>>高中/技校/中专</option>
                                <option value="大学专科及以上" <%= "大学专科及以上".equals(d.getEducation()) ? "selected" : "" %>>大学专科及以上</option>
                                <option value="不详" <%= "不详".equals(d.getEducation()) ? "selected" : "" %>>不详</option>
                            </select>

                            <label for="religion">宗教信仰：</label>
                            <select name="religion" id="religion" onchange="showAdditionalFields()">
                                <option value="无" <%= "无".equals(d.getReligion()) ? "selected" : "" %>>无</option>
                                <option value="有" <%= "有".equals(d.getReligion()) ? "selected" : "" %>>有</option>
                            </select>
                            <input name="otherreligion" type="text" id="otherreligion" style="display: <%= "有".equals(d.getReligion()) ? "block" : "none" %>;">

                            <label for="marriage">婚姻状况：</label>
                            <select name="marriage" id="marriage">
                                <option value="未婚" <%= "未婚".equals(d.getMarriage()) ? "selected" : "" %>>未婚</option>
                                <option value="已婚" <%= "已婚".equals(d.getMarriage()) ? "selected" : "" %>>已婚</option>
                                <option value="丧偶" <%= "丧偶".equals(d.getMarriage()) ? "selected" : "" %>>丧偶</option>
                                <option value="离婚" <%= "离婚".equals(d.getMarriage()) ? "selected" : "" %>>离婚</option>
                                <option value="未说明的婚姻状况" <%= "未说明的婚姻状况".equals(d.getMarriage()) ? "selected" : "" %>>未说明的婚姻状况</option>
                            </select>

                            <label for="reside">居住情况：</label>
                            <select name="reside" id="reside">
                                <option value="独居" <%= "独居".equals(d.getReside()) ? "selected" : "" %>>独居</option>
                                <option value="与配偶/伴侣居住" <%= "与配偶/伴侣居住".equals(d.getReside()) ? "selected" : "" %>>与配偶/伴侣居住</option>
                                <option value="与子女居住" <%= "与子女居住".equals(d.getReside()) ? "selected" : "" %>>与子女居住</option>
                                <option value="与父母居住" <%= "与父母居住".equals(d.getReside()) ? "selected" : "" %>>与父母居住</option>
                                <option value="与兄弟姐妹居住" <%= "与兄弟姐妹居住".equals(d.getReside()) ? "selected" : "" %>>与兄弟姐妹居住</option>
                                <option value="与其他亲属居住" <%= "与其他亲属居住".equals(d.getReside()) ? "selected" : "" %>>与其他亲属居住</option>
                                <option value="与非亲属关系的人居住" <%= "与非亲属关系的人居住".equals(d.getReside()) ? "selected" : "" %>>与非亲属关系的人居住</option>
                                <option value="养老机构" <%= "养老机构".equals(d.getReside()) ? "selected" : "" %>>养老机构</option>
                            </select>

                            <label for="medical">医疗费用支付方式：</label>
                            <select name="medical" id="medical" onchange="showAdditionalFields()">
                                <option value="城镇职工基本医疗保险" <%= "城镇职工基本医疗保险".equals(d.getMedical()) ? "selected" : "" %>>城镇职工基本医疗保险</option>
                                <option value="城镇居民基本医疗保险" <%= "城镇居民基本医疗保险".equals(d.getMedical()) ? "selected" : "" %>>城镇居民基本医疗保险</option>
                                <option value="新型农村合作医疗" <%= "新型农村合作医疗".equals(d.getMedical()) ? "selected" : "" %>>新型农村合作医疗</option>
                                <option value="贫困救助" <%= "贫困救助".equals(d.getMedical()) ? "selected" : "" %>>贫困救助</option>
                                <option value="商业医疗保险" <%= "商业医疗保险".equals(d.getMedical()) ? "selected" : "" %>>商业医疗保险</option>
                                <option value="全公费" <%= "全公费".equals(d.getMedical()) ? "selected" : "" %>>全公费</option>
                                <option value="全自费" <%= "全自费".equals(d.getMedical()) ? "selected" : "" %>>全自费</option>
                                <option value="其他" <%= "其他".equals(d.getMedical()) ? "selected" : "" %>>其他</option>
                            </select>
                            <input name="othermedical" type="text" id="othermedical" style="display: <%= "其他".equals(d.getMedical()) ? "block" : "none" %>;">

                            <label for="income">经济来源：</label>
                            <select name="income" id="income" onchange="showAdditionalFields()">
                                <option value="退休金/养老金" <%= "退休金/养老金".equals(d.getIncome()) ? "selected" : "" %>>退休金/养老金</option>
                                <option value="子女补贴" <%= "子女补贴".equals(d.getIncome()) ? "selected" : "" %>>子女补贴</option>
                                <option value="亲友资助" <%= "亲友资助".equals(d.getIncome()) ? "selected" : "" %>>亲友资助</option>
                                <option value="其他补贴" <%= "其他补贴".equals(d.getIncome()) ? "selected" : "" %>>其他补贴</option>
                            </select>
                            <input name="otherincome" type="text" id="otherincome" style="display: <%= "其他补贴".equals(d.getIncome()) ? "block" : "none" %>;">

                            <label for="stupid">痴呆：</label>
                            <select name="stupid" id="stupid">
                                <option value="无" <%= "无".equals(d.getStupid()) ? "selected" : "" %>>无</option>
                                <option value="轻度" <%= "轻度".equals(d.getStupid()) ? "selected" : "" %>>轻度</option>
                                <option value="中度" <%= "中度".equals(d.getStupid()) ? "selected" : "" %>>中度</option>
                                <option value="重度" <%= "重度".equals(d.getStupid()) ? "selected" : "" %>>重度</option>
                            </select>

                            <label for="mental">精神疾病：</label>
                            <select name="mental" id="mental">
                                <option value="无" <%= "无".equals(d.getMental()) ? "selected" : "" %>>无</option>
                                <option value="精神分裂症" <%= "精神分裂症".equals(d.getMental()) ? "selected" : "" %>>精神分裂症</option>
                                <option value="双相情感障碍" <%= "双相情感障碍".equals(d.getMental()) ? "selected" : "" %>>双相情感障碍</option>
                                <option value="偏执性精神障碍" <%= "偏执性精神障碍".equals(d.getMental()) ? "selected" : "" %>>偏执性精神障碍</option>
                                <option value="分裂情感性障碍" <%= "分裂情感性障碍".equals(d.getMental()) ? "selected" : "" %>>分裂情感性障碍</option>
                                <option value="癫痫所致精神障碍" <%= "癫痫所致精神障碍".equals(d.getMental()) ? "selected" : "" %>>癫痫所致精神障碍</option>
                                <option value="精神发育迟滞伴发精神障碍" <%= "精神发育迟滞伴发精神障碍".equals(d.getMental()) ? "selected" : "" %>>精神发育迟滞伴发精神障碍</option>
                            </select>

                            <label for="chronic">慢性疾病：</label>
                            <input name="chronic" type="text" id="chronic" value="<%=d.getChronic()%>">

                            <label for="tumble">跌倒：</label>
                            <select name="tumble" id="tumble">
                                <option value="无" <%= "无".equals(d.getTumble()) ? "selected" : "" %>>无</option>
                                <option value="发生过 1 次" <%= "发生过 1 次".equals(d.getTumble()) ? "selected" : "" %>>发生过 1 次</option>
                                <option value="发生过 2 次" <%= "发生过 2 次".equals(d.getTumble()) ? "selected" : "" %>>发生过 2 次</option>
                                <option value="发生过 3 次及以上" <%= "发生过 3 次及以上".equals(d.getTumble()) ? "selected" : "" %>>发生过 3 次及以上</option>
                            </select>

                            <label for="lost">走失：</label>
                            <select name="lost" id="lost">
                                <option value="无" <%= "无".equals(d.getLost()) ? "selected" : "" %>>无</option>
                                <option value="发生过 1 次" <%= "发生过 1 次".equals(d.getLost()) ? "selected" : "" %>>发生过 1 次</option>
                                <option value="发生过 2 次" <%= "发生过 2 次".equals(d.getLost()) ? "selected" : "" %>>发生过 2 次</option>
                                <option value="发生过 3 次及以上" <%= "发生过 3 次及以上".equals(d.getLost()) ? "selected" : "" %>>发生过 3 次及以上</option>
                            </select>

                            <label for="dysphoria">噎食：</label>
                            <select name="dysphoria" id="dysphoria">
                                <option value="无" <%= "无".equals(d.getDysphoria()) ? "selected" : "" %>>无</option>
                                <option value="发生过 1 次" <%= "发生过 1 次".equals(d.getDysphoria()) ? "selected" : "" %>>发生过 1 次</option>
                                <option value="发生过 2 次" <%= "发生过 2 次".equals(d.getDysphoria()) ? "selected" : "" %>>发生过 2 次</option>
                                <option value="发生过 3 次及以上" <%= "发生过 3 次及以上".equals(d.getDysphoria()) ? "selected" : "" %>>发生过 3 次及以上</option>
                            </select>

                            <label for="suicide">自杀：</label>
                            <select name="suicide" id="suicide">
                                <option value="无" <%= "无".equals(d.getSuicide()) ? "selected" : "" %>>无</option>
                                <option value="发生过 1 次" <%= "发生过 1 次".equals(d.getSuicide()) ? "selected" : "" %>>发生过 1 次</option>
                                <option value="发生过 2 次" <%= "发生过 2 次".equals(d.getSuicide()) ? "selected" : "" %>>发生过 2 次</option>
                                <option value="发生过 3 次及以上" <%= "发生过 3 次及以上".equals(d.getSuicide()) ? "selected" : "" %>>发生过 3 次及以上</option>
                            </select>

                            <label for="other">其他：</label>
                            <input name="other" type="text" id="other" value="<%=d.getOther()%>">

                            <input name="number" type="hidden" value="<%=d.getNumber()%>">

                            <input type="submit" value="修改">
                        </div>
                    </form>
                </td>
            </tr>
                    <%}
                else { %>
            <tr>
                <td colspan="20" style="text-align:center;">暂无数据</td>
            </tr>
            <% } %>
        </table>
    </div>
</div>
</body>
</html>
