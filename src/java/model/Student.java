package model;

public class Student {
    private int idIncremental;
    private String idBarcode;
    private String idUic;
    private String name;
    private String password;
    private String position;
    private String platoon;
    private String religion;
    private String gender;
    private String age;
    private String DOB;
    private String course;
    private String section;
    private String status;
    private int points;
    private int absents;
    private int tardiness;
    
    public String getIdUic() {
        return idUic;
    }

    public void setIdUic(String id) {
        this.idUic = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPlatoon() {
        return platoon;
    }

    public void setPlatoon(String platoon) {
        this.platoon = platoon;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getCourse() {
        return course;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getAbsents() {
        return absents;
    }

    public void setAbsents(int absents) {
        this.absents = absents;
    }

    public int getTardiness() {
        return tardiness;
    }

    public void setTardiness(int tardiness) {
        this.tardiness = tardiness;
    }

    public int getIdIncremental() {
        return idIncremental;
    }

    public void setIdIncremental(int idIncremental) {
        this.idIncremental = idIncremental;
    }

    public String getIdBarcode() {
        return idBarcode;
    }

    public void setIdBarcode(String idBarcode) {
        this.idBarcode = idBarcode;
    }
    
}
