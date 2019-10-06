package model;

import java.sql.Date;

public class Records {
    private int recordsID;
    private int recordsTotal;
//    private int recordsAM;
//    private int recordsPM;
    private Date recordsDate;
//    private int sessionsID;

    public int getRecordsID() {
        return recordsID;
    }

    public void setRecordsID(int recordsID) {
        this.recordsID = recordsID;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

//    public int getRecordsAM() {
//        return recordsAM;
//    }
//
//    public void setRecordsAM(int recordsAM) {
//        this.recordsAM = recordsAM;
//    }
//
//    public int getRecordsPM() {
//        return recordsPM;
//    }
//
//    public void setRecordsPM(int recordsPM) {
//        this.recordsPM = recordsPM;
//    }

    public Date getRecordsDate() {
        return recordsDate;
    }

    public void setRecordsDate(Date recordsDate) {
        this.recordsDate = recordsDate;
    }

//    public int getSessionsID() {
//        return sessionsID;
//    }
//
//    public void setSessionsID(int sessionsID) {
//        this.sessionsID = sessionsID;
//    }
    
}
