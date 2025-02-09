package data;

public class mooddata {
    private int cogintion;//认知功能
    private int attack;//攻击行为
    private int depression;//抑郁症状
    private int total;//精神状态总分
    private int level;//精神状态分级
    private String number;
    private String idnumber;

    public mooddata(int cogintion, int attack, int depression, int total, int level, String number, String idnumber) {
        this.cogintion = cogintion;
        this.attack = attack;
        this.depression = depression;
        this.total = total;
        this.level = level;
        this.number = number;
        this.idnumber = idnumber;
    }

    public int getCogintion() {
        return cogintion;
    }

    public int getAttack() {
        return attack;
    }

    public int getDepression() {
        return depression;
    }

    public int getTotal() {
        return total;
    }

    public int getLevel() {
        return level;
    }

    public String getNumber() {
        return number;
    }

    public String getIdnumber() {
        return idnumber;
    }
}
