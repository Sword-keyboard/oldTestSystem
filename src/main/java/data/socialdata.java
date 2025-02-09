package data;

public class socialdata {
    private int live;//生活能力
    private int work;//工作能力
    private int timespace;//时间/空间定向
    private int relation;//人物定向
    private int socialing;//社会交往能力
    private int total;//社会参与总分
    private int level;//社会参与分级
    private String number;
    private String idnumber;

    public socialdata(int live, int work, int timespace, int relation, int socialing, int total, int level, String number, String idnumber) {
        this.live = live;
        this.work = work;
        this.timespace = timespace;
        this.relation = relation;
        this.socialing = socialing;
        this.total = total;
        this.level = level;
        this.number = number;
        this.idnumber = idnumber;
    }

    public int getLive() {
        return live;
    }

    public int getWork() {
        return work;
    }

    public int getTimespace() {
        return timespace;
    }

    public int getRelation() {
        return relation;
    }

    public int getSocialing() {
        return socialing;
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
