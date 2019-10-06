package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Day_Record;

public final class Controller_Day_RecordDao {
    private static final Controller_Day_RecordDao dr = new Controller_Day_RecordDao();
    
    private Controller_Day_RecordDao (){ }
    
    public static Controller_Day_RecordDao getDay_RecordDao(){
        return dr;
    }
    
    public int insert(Day_Record s){
        int i = 0;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps;
            PreparedStatement ps1;
            ps = con.prepareStatement("insert into day_record(day_record_id, day_record_time, cadet_id, records_id, day_record_attendance_status) values(?, ?, ?, ?, ?)");
            ps.setInt(1, s.getDay_record_id());
            ps.setString(2, s.getDay_record_time());
            ps.setInt(3, s.getDay_record_cadet_id());
            ps.setInt(4, s.getDay_record_records_id());
            ps.setDouble(5, s.getDay_record_attendance_status());
            
            Day_Record findCadet = dr.fetchArchive(s.getDay_record_id(), s.getDay_record_records_id());
            if (findCadet == null) {
                // Insertion Query as they say
                ps1 = con.prepareStatement("insert into day_record_archive(day_record_archive_id, day_record_archive_time, day_record_archive_cadet_id, day_record_archive_records_id, day_record_archive_attendance_status) values(?, ?, ?, ?, ?)");
                ps1.setInt(1, s.getDay_record_id());
                ps1.setString(2, s.getDay_record_time());
                ps1.setInt(3, s.getDay_record_cadet_id());
                ps1.setInt(4, s.getDay_record_records_id());
                ps1.setDouble(5, s.getDay_record_attendance_status());
            }else{
                ps1 = con.prepareStatement("update day_record_archive set day_record_archive_id=?, day_record_archive_time=?, day_record_archive_cadet_id=?, day_record_archive_records_id=?, day_record_archive_attendance_status=? where day_record_archive_id=? and day_record_archive_records_id = ?");
                ps1.setInt(1, s.getDay_record_id());
                ps1.setString(2, s.getDay_record_time());
                ps1.setInt(3, s.getDay_record_cadet_id());
                ps1.setInt(4, s.getDay_record_records_id());
                ps1.setDouble(5, s.getDay_record_attendance_status());
                ps1.setInt(6, s.getDay_record_id());
                ps1.setInt(7, s.getDay_record_records_id());
            }
            
            i = ps.executeUpdate();
            ps1.executeUpdate();
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }
    
    public int update (Day_Record d){
        int i = 0;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps, ps1;
            ps = con.prepareStatement("update day_record set day_record_attendance_status=? where cadet_id=?");
            ps.setDouble(1, d.getDay_record_attendance_status());
            ps.setInt(2, d.getDay_record_cadet_id());
            
            ps1 = con.prepareStatement("update day_record_archive set day_record_archive_id=?, day_record_archive_time=?, day_record_archive_cadet_id=?, day_record_archive_records_id=?, day_record_archive_attendance_status=? where day_record_archive_id=? and day_record_archive_records_id = ?");
//            update day_record_archive set day_record_archive_id=1, day_record_archive_time='19:28', day_record_archive_cadet_id=5, day_record_archive_records_id=1, day_record_archive_attendance_status=2.0 where cadet_id=5;
            ps1.setInt(1, d.getDay_record_id());
            ps1.setString(2, d.getDay_record_time());
            ps1.setInt(3, d.getDay_record_cadet_id());
            ps1.setInt(4, d.getDay_record_records_id());
            ps1.setDouble(5, d.getDay_record_attendance_status());
            ps1.setInt(6, d.getDay_record_cadet_id());
            ps1.setInt(7, d.getDay_record_records_id());
            i = ps.executeUpdate();
            ps1.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }
    
    public void transferToDay_Record(int id){
        try (Connection con = Dao.getCon();){
            PreparedStatement ps;
            ps = con.prepareStatement("insert into day_record(day_record_id, day_record_time, cadet_id, records_id, day_record_attendance_status) select day_record_archive_id, day_record_archive_time, day_record_archive_cadet_id, day_record_archive_records_id, day_record_archive_attendance_status from day_record_archive where day_record_archive_records_id=?");
            
            ps.setInt(1, id);
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void truncateSession(){
        try (Connection con = Dao.getCon();){
            PreparedStatement ps;
            ps = con.prepareStatement("truncate table day_record");
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public List<Day_Record> fetchAll(int id){
        List<Day_Record> list = new ArrayList<>();
        Day_Record s = null;
        
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from day_record where records_id=? order by day_record_id asc");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                s = new Day_Record();
                s.setDay_record_records_id(rs.getInt(1));
                s.setDay_record_time(rs.getString(2));
                s.setDay_record_cadet_id(rs.getInt(3));
                s.setDay_record_id(rs.getInt(4));
                s.setDay_record_attendance_status(rs.getInt(5));
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Day_Record fetchAll(){
        Day_Record s = null;
        
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from day_record");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                s = new Day_Record();
                s.setDay_record_records_id(rs.getInt(1));
                s.setDay_record_time(rs.getString(2));
                s.setDay_record_cadet_id(rs.getInt(3));
                s.setDay_record_id(rs.getInt(4));
                s.setDay_record_attendance_status(rs.getInt(5));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return s;
    }
    
    public List<Day_Record> fetchAllArchive(int id){
        List<Day_Record> list = new ArrayList<>();
        Day_Record s = null;
        
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from day_record_archive where day_record_archive_records_id = ? order by day_record_archive_records_id asc");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                s = new Day_Record();
                s.setDay_record_records_id(rs.getInt(1));
                s.setDay_record_time(rs.getString(2));
                s.setDay_record_cadet_id(rs.getInt(3));
                s.setDay_record_id(rs.getInt(4));
                s.setDay_record_attendance_status(rs.getInt(5));
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Day_Record fetchRecord(int recordsId){
        Day_Record s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement(" select * from Day_Record where records_id = ?");
//            ps.setInt(1, id);
            ps.setInt(1, recordsId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                s = new Day_Record();
                s.setDay_record_id(rs.getInt(1));
                s.setDay_record_time(rs.getString(2));
                s.setDay_record_cadet_id(rs.getInt(3));
                s.setDay_record_records_id(rs.getInt(4));
                s.setDay_record_attendance_status(rs.getDouble(5));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return s;
    }
    
    public Day_Record fetch(int id){
        Day_Record s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from Day_Record where Day_Record_id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                s = new Day_Record();
                s.setDay_record_id(rs.getInt(1));
                s.setDay_record_time(rs.getString(2));
                s.setDay_record_cadet_id(rs.getInt(3));
                s.setDay_record_records_id(rs.getInt(4));
                s.setDay_record_attendance_status(rs.getDouble(5));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return s;
    }
    
    public Day_Record fetchArchive(int id, int recordsId){
        Day_Record s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from day_record_archive where day_record_archive_id = ? and day_record_archive_records_id = ?");
            ps.setInt(1, id);
            ps.setInt(2, recordsId);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                s = new Day_Record();
                s.setDay_record_id(rs.getInt(1));
                s.setDay_record_time(rs.getString(2));
                s.setDay_record_cadet_id(rs.getInt(3));
                s.setDay_record_records_id(rs.getInt(4));
                s.setDay_record_attendance_status(rs.getDouble(5));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return s;
    }
    
    public Day_Record fetchArchive(int recordsId){
        Day_Record s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from day_record_archive where day_record_archive_records_id = ?");
            ps.setInt(1, recordsId);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                s = new Day_Record();
                s.setDay_record_id(rs.getInt(1));
                s.setDay_record_time(rs.getString(2));
                s.setDay_record_cadet_id(rs.getInt(3));
                s.setDay_record_records_id(rs.getInt(4));
                s.setDay_record_attendance_status(rs.getDouble(5));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return s;
    }
}

//    public int updateToArchive(){
//        int i = 0;
//        try (Connection con = Dao.getCon();){
//            PreparedStatement ps;
////            ps = con.prepareStatement("insert into day_record_archive(day_record_archive_id, day_record_archive_time, day_record_archive_cadet_id, day_record_archive_records_id, day_record_archive_attendance_status) select day_record_id, day_record_time, cadet_id, records_id, day_record_attendance_status from day_record");
//            ps = con.prepareStatement("update day_record_archive set day_record_archive_id = day_record_id,day_record_archive_time = day_record_time,day_record_archive_cadet_id = cadet_id,day_record_archive_records_id = records_id,day_record_archive_attendance_status = day_record_attendance_status from day_record where day_record_archive.day_record_archive_id = day_record.records_id");
////            ps = con.prepareStatement("insert into day_record_archive (day_record_archive_id, day_record_archive_time, day_record_archive_cadet_id, day_record_archive_records_id, day_record_archive_attendance_status )select day_record_id,day_record_time,cadet_id,records_id, day_record_attendance_status from day_record on conflict (day_record_archive_id) do update set day_record_archive_attendance_status = EXCLUDED.day_record_archive_attendance_status");
//            i = ps.executeUpdate();
////            int id
////            ps.setInt(1, id);
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return i;
//    }

//    public int insertToArchive(){
//        int i = 0;
//        try (Connection con = Dao.getCon();){
//            PreparedStatement ps;
//            ps = con.prepareStatement("insert into day_record_archive(day_record_archive_id, day_record_archive_time, day_record_archive_cadet_id, day_record_archive_records_id, day_record_archive_attendance_status) select day_record_id, day_record_time, cadet_id, records_id, day_record_attendance_status from day_record");
////            ps = con.prepareStatement("update day_record_archive set day_record_archive_id = day_record_id,day_record_archive_time = day_record_time,day_record_archive_cadet_id = cadet_id,day_record_archive_records_id = records_id,day_record_archive_attendance_status = day_record_attendance_status from day_record where day_record_archive.day_record_archive_id = ?");
////            ps = con.prepareStatement("insert into day_record_archive (day_record_archive_id, day_record_archive_time, day_record_archive_cadet_id, day_record_archive_records_id, day_record_archive_attendance_status )select day_record_id,day_record_time,cadet_id,records_id, day_record_attendance_status from day_record on conflict (day_record_archive_id) do update set day_record_archive_attendance_status = EXCLUDED.day_record_archive_attendance_status;");
//            i = ps.executeUpdate();
////            int id
////            ps.setInt(1, id);
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return i;
//    }