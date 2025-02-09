package data;

import java.sql.Date;
public class peopledata {
    private String name;
    private String sex;
    private Date birthday;
    private String idnumber;
    private String socialid;
    private String nation;//民族
    private String education;//文化程度
    private String religion;//宗教信仰
    private String marriage;//婚姻状况
    private String reside;//居住情况
    private String medical;//医疗费用开支
    private String income;//经济来源
    private String stupid;//痴呆
    private String mental;//精神疾病
    private String chronic;//慢性疾病
    private String tumble;//跌倒
    private String lost;//走失
    private String dysphoria;//噎食
    private String suicide;//自杀
    private String other;//其他
    private String number;

    public peopledata(String name, String sex, Date birthday, String idnumber, String socialid, String nation, String education, String religion,
                      String marriage, String reside, String medical, String income, String stupid, String mental, String chronic, String tumble,
                      String lost, String dysphoria, String suicide, String other,String number) {
        this.name = name;
        this.sex = sex;
        this.birthday = birthday;
        this.idnumber = idnumber;
        this.socialid = socialid;
        this.nation = nation;
        this.education = education;
        this.religion = religion;
        this.marriage = marriage;
        this.reside = reside;
        this.medical = medical;
        this.income = income;
        this.stupid = stupid;
        this.mental = mental;
        this.chronic = chronic;
        this.tumble = tumble;
        this.lost = lost;
        this.dysphoria = dysphoria;
        this.suicide = suicide;
        this.other = other;
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public String getSex() {
        return sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public String getIdnumber() {
        return idnumber;
    }

    public String getSocialid() {
        return socialid;
    }

    public String getNation() {
        return nation;
    }

    public String getEducation() {
        return education;
    }

    public String getReligion() {
        return religion;
    }

    public String getMarriage() {
        return marriage;
    }

    public String getReside() {
        return reside;
    }

    public String getMedical() {
        return medical;
    }

    public String getIncome() {
        return income;
    }

    public String getStupid() {
        return stupid;
    }

    public String getMental() {
        return mental;
    }

    public String getTumble() {
        return tumble;
    }

    public String getChronic() {
        return chronic;
    }

    public String getLost() {
        return lost;
    }

    public String getDysphoria() {
        return dysphoria;
    }

    public String getSuicide() {
        return suicide;
    }

    public String getOther() {
        return other;
    }

    public String getNumber() {return number;}
}
