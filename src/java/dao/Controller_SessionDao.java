package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Session;

public class Controller_SessionDao {
    private static Controller_SessionDao sd = new Controller_SessionDao();
    
    private Controller_SessionDao (){ }
    
    public static Controller_SessionDao getSessionDao(){
        return sd;
    }
    
    public int insert(Session s){
        int i = 0;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps;
            ps = con.prepareStatement("insert into sessions(sessions_id, sessions_time, sessions_date, cadet_id) values(?, ?, ?, ?)");
            ps.setInt(1, s.getSessions_id());
            ps.setString(2, s.getSessions_time());
            ps.setString(3, s.getSessions_date());
            ps.setInt(4, s.getCadet_id());
            
            i = ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }
    
    public Session fetch(int id){
        Session s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from sessions where sessions_id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                s = new Session();
                s.setSessions_id(rs.getInt(1));
                s.setSessions_time(rs.getString(2));
                s.setSessions_date(rs.getString(3));
                s.setCadet_id(rs.getInt(3));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return s;
    }
    
    public List<Session> fetchAll(){
        List<Session> list = new ArrayList<>();
        Session s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from sessions");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                s = new Session();
                s.setSessions_id(rs.getInt(1));
                s.setSessions_time(rs.getString(2));
                s.setSessions_date(rs.getString(3));
                s.setCadet_id(rs.getInt(4));
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}

