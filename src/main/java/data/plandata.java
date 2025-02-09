package data;

import java.sql.Date;
public class plandata {
    private String number;
    private Date date;
    private String reason;

    public plandata(String number, Date date, String reason) {
        this.number = number;
        this.date = date;
        this.reason = reason;
    }

    public Date getDate() {
        return date;
    }

    public String getNumber() {
        return number;
    }

    public String getReason() {
        return reason;
    }
}
