package model;
public class Session {
    private int sessions_id;
    private String sessions_time;
    private String sessions_date;
    private int cadet_id;

    public String getSessions_date() {
        return sessions_date;
    }

    public void setSessions_date(String sessions_date) {
        this.sessions_date = sessions_date;
    }
    
    public int getSessions_id() {
        return sessions_id;
    }

    public void setSessions_id(int sessions_id) {
        this.sessions_id = sessions_id;
    }

    public String getSessions_time() {
        return sessions_time;
    }

    public void setSessions_time(String sessions_time) {
        this.sessions_time = sessions_time;
    }
    
    public int getCadet_id() {
        return cadet_id;
    }

    public void setCadet_id(int cadet_id) {
        this.cadet_id = cadet_id;
    }
    
    
}
