package data;

public class dailydata {
    private int eat;//进食：指用餐具将食物由容器送到口中、咀嚼、吞咽等过程
    private int bath;//洗澡
    private int wash;//修饰：指洗脸、刷牙、梳头、刮脸等
    private int cloth;//穿衣：指穿脱衣服、系扣、拉拉链、穿脱鞋袜、系鞋带
    private int stool;//大便控制
    private int urinal;//小便控制
    private int toilet;//如厕：包括去厕所、解开衣裤、擦净、整理衣裤、冲水
    private int move;//床椅转移
    private int walk;//平地行走
    private int floor;//上下楼梯
    private int total;//日常生活活动总分
    private int level;//日常生活活动分级
    private String number;
    private String idnumber;

    public dailydata(int eat, int bath, int wash, int cloth, int stool, int urinal, int toilet, int walk, int move, int floor, int total, int level, String number, String idnumber) {
        this.eat = eat;
        this.bath = bath;
        this.wash = wash;
        this.cloth = cloth;
        this.stool = stool;
        this.urinal = urinal;
        this.toilet = toilet;
        this.walk = walk;
        this.move = move;
        this.floor = floor;
        this.total = total;
        this.level = level;
        this.number = number;
        this.idnumber = idnumber;
    }

    public int getEat() {
        return eat;
    }

    public int getBath() {
        return bath;
    }

    public int getWash() {
        return wash;
    }

    public int getCloth() {
        return cloth;
    }

    public int getStool() {
        return stool;
    }

    public int getUrinal() {
        return urinal;
    }

    public int getToilet() {
        return toilet;
    }

    public int getMove() {
        return move;
    }

    public int getWalk() {
        return walk;
    }

    public int getFloor() {
        return floor;
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
