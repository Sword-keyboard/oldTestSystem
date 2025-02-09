package data;

public class indexdata {
    private String id;
    private String password;

    public indexdata(String password, String id) {
        this.password = password;
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }
}
