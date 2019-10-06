package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Records;

public class Controller_RecordsDao {
    private static final Controller_RecordsDao rd = new Controller_RecordsDao();
    
    private Controller_RecordsDao (){ }
    
    public static Controller_RecordsDao getRecordsDao(){
        return rd;
    }
    
    public int insert(Records s){
        int i = 0;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps;
//            ps = con.prepareStatement("insert into records(records_id, records_total, records_am, records_pm, records_date, sessions_id) values(?, ?, ?, ?, ?, ?)");
//            ps = con.prepareStatement("insert into records(records_id, records_total, records_am, records_pm, records_date) values(?, ?, ?, ?, ?)");
            ps = con.prepareStatement("insert into records(records_id, records_total, records_date) values(?, ?, ?)");
            ps.setInt(1, s.getRecordsID());
            ps.setInt(2, s.getRecordsTotal());
//            ps.setInt(3, s.getRecordsAM());
//            ps.setInt(4, s.getRecordsPM());
            ps.setDate(3, s.getRecordsDate());
//            ps.setInt(6, s.getSessionsID());
            
            i = ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }
    
    public List<Records> fetchAll(){
        List<Records> list = new ArrayList<>();
        Records s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from records");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                s = new Records();
                s.setRecordsID(rs.getInt(1));
                s.setRecordsTotal(rs.getInt(2));
//                s.setRecordsAM(rs.getInt(3));
//                s.setRecordsPM(rs.getInt(4));
                s.setRecordsDate(rs.getDate(3));
//                s.setSessionsID(rs.getInt(6));
                
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Records fetch(int id){
        Records s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from records where records_id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                s = new Records();
                s.setRecordsID(rs.getInt(1));
                s.setRecordsTotal(rs.getInt(2));
//                s.setRecordsAM(rs.getInt(3));
//                s.setRecordsPM(rs.getInt(4));
                s.setRecordsDate(rs.getDate(3));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return s;
    }
}
