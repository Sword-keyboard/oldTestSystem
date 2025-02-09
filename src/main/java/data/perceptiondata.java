package data;

public class perceptiondata {
    private int consciousness;//意识水平
    private int vision;//视力：若平日带老花镜或近视镜，应在佩戴眼镜的情况下评估
    private int hearing;//听力：若平时佩戴助听器，应在佩戴助听器的情况下评估
    private int communication;//沟通交流：包括非语言沟通
    private int level;//感知觉与沟通分级
    private String number;
    private String idnumber;

    public perceptiondata(int consciousness, int vision, int hearing, int communication, int level, String number, String idnumber) {
        this.consciousness = consciousness;
        this.vision = vision;
        this.hearing = hearing;
        this.communication = communication;
        this.level = level;
        this.number = number;
        this.idnumber = idnumber;
    }

    public int getConsciousness() {
        return consciousness;
    }

    public int getVision() {
        return vision;
    }

    public int getHearing() {
        return hearing;
    }

    public int getCommunication() {
        return communication;
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
