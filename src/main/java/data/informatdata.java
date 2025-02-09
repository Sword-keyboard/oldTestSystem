package data;

public class informatdata {
    private String name;
    private String relation;
    private String contacts;
    private String phone;
    private String number;
    private String idnumber;

    public informatdata(String name, String relation, String contacts, String phone,String number,String idnumber) {
        this.name = name;
        this.relation = relation;
        this.contacts = contacts;
        this.phone = phone;
        this.number = number;
        this.idnumber = idnumber;
    }

    public String getName() {
        return name;
    }

    public String getRelation() {
        return relation;
    }

    public String getContacts() {
        return contacts;
    }

    public String getPhone() {
        return phone;
    }

    public String getNumber() {return number;}

    public String getIdnumber() {return idnumber;}
}
