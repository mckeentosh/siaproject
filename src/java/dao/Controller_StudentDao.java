package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Student;

/**
 *
 * @author mckee
 */
public final class Controller_StudentDao {
    private static final Controller_StudentDao sd = new Controller_StudentDao();
    
    private Controller_StudentDao (){ }
    
    public static Controller_StudentDao getStudentDao(){
        return sd;
    }
    
    public int insert(Student s){
        int i = 0;
        try (Connection con = Dao.getCon();){
//            Statement st = con.createStatement();
            PreparedStatement ps;
//            ps = con.prepareStatement("insert into cadet(id, name) values(?, ?)");
//            ps = con.prepareStatement("insert into cadet(idIncremental, idBarcode, idUic, name, password, position, platoon, religion, gender, age, dob, course, section, status, points, absents, tardiness) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps = con.prepareStatement("insert into cadet(cadet_idBarcode, cadet_idUic, cadet_name, cadet_password, cadet_position, cadet_platoon, cadet_religion, cadet_gender, cadet_age, cadet_dob, cadet_course, cadet_section, cadet_status, cadet_points, cadet_absents, cadet_tardiness) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
//            ps.setInt(1, s.getIdIncremental());
            ps.setString(1, s.getIdBarcode());
            ps.setString(2, s.getIdUic());
            ps.setString(3, s.getName());
            ps.setString(4, s.getPassword());
            ps.setString(5, s.getPosition());
            ps.setString(6, s.getPlatoon());
            ps.setString(7, s.getReligion());
            ps.setString(8, s.getGender());
            ps.setString(9, s.getAge());
            ps.setString(10, s.getDOB());
            ps.setString(11, s.getCourse());
            ps.setString(12, s.getSection());
            ps.setString(13, s.getStatus());
            ps.setInt(14, s.getPoints());
            ps.setInt(15, s.getAbsents());
            ps.setInt(16, s.getTardiness());
            i = ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }
    
    public int update(Student s){
        int i = 0;
        try (Connection con = Dao.getCon();){
//            PreparedStatement ps = con.prepareStatement("update cadet set name=?, idBarcode=?, platoon=?, religion=?, gender=?, age=?, dob=?, course=?, section=?, status=?, points=?, absents=?, tardiness=?, password=? where idUic=?");
//            PreparedStatement ps = con.prepareStatement("update cadet set name=?, idBarcode=?, password=? where idUic=?");
//            PreparedStatement ps = con.prepareStatement("update cadet set name=?, idBarcode=?, password=? where idUic=?");
//            PreparedStatement ps = con.prepareStatement("update cadet set name=?, idBarcode=?, password=?, platoon=? where idUic=?");
//            PreparedStatement ps = con.prepareStatement("update cadet set name=?, idBarcode=?, password=?, position=? where idUic=?");
            PreparedStatement ps = con.prepareStatement("update cadet set cadet_name=?, cadet_idBarcode=?, cadet_platoon=?, cadet_password=?, cadet_age=?, cadet_position=?, cadet_course=?, cadet_dob=?, cadet_religion=?, cadet_points=?, cadet_absents=?, cadet_tardiness=?, cadet_gender=?, cadet_status=? where cadet_idUic=?");
            ps.setString(1, s.getName());
            ps.setString(2, s.getIdBarcode());
            ps.setString(3, s.getPlatoon());
            ps.setString(4, s.getPassword());
            ps.setString(5, s.getAge());
            ps.setString(6, s.getPosition());
            ps.setString(7, s.getCourse());
            ps.setString(8, s.getDOB());
            ps.setString(9, s.getReligion());
            ps.setInt(10, s.getPoints());
            ps.setInt(11, s.getAbsents());
            ps.setInt(12, s.getTardiness());
            ps.setString(13, s.getGender());
            ps.setString(14, s.getStatus());
            ps.setString(15, s.getIdUic());

            i = ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }
    
    public int delete(String id){
        int i = 0;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("delete from cadet where cadet_idUic=?");
            ps.setString(1, id);
            i = ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return i;
    }
    
    public Student fetch(String id){
        Student s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from cadet where cadet_idUic=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                s = new Student();
                s.setIdBarcode(rs.getString(2));
                s.setIdUic(rs.getString(3));
                s.setName(rs.getString(4));
                s.setPassword(rs.getString(5));
                s.setPosition(rs.getString(6));
                s.setPlatoon(rs.getString(7));
                s.setReligion(rs.getString(8));
                s.setGender(rs.getString(9));
                s.setAge(rs.getString(10));
                s.setDOB(rs.getString(11));
                s.setCourse(rs.getString(12));
                s.setSection(rs.getString(13));
                s.setStatus(rs.getString(14));
                s.setPoints(rs.getInt(15));
                s.setAbsents(rs.getInt(16));
                s.setTardiness(rs.getInt(17));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return s;
    }
    
    public Student fetchIDInc(int id){
        Student s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from cadet where cadet_id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                s = new Student();
                s.setIdBarcode(rs.getString(2));
                s.setIdUic(rs.getString(3));
                s.setName(rs.getString(4));
                s.setPlatoon(rs.getString(7));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return s;
    }
    
    public Student fetchBarcode(String id){
        Student s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from cadet where cadet_idbarcode=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                s = new Student();
                s.setIdIncremental(rs.getInt(1));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return s;
    }
    
    public Student fetchUic(String id){
        Student s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from cadet where cadet_idUic=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                s = new Student();
                s.setIdIncremental(rs.getInt(1));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return s;
    }
    
    public List<Student> fetchAll(){
        List<Student> list = new ArrayList<>();
        Student s = null;
        try (Connection con = Dao.getCon();){
            PreparedStatement ps = con.prepareStatement("select * from cadet");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                s = new Student();
                s.setIdIncremental(rs.getInt(1));
                s.setIdBarcode(rs.getString(2));
                s.setIdUic(rs.getString(3));
                s.setName(rs.getString(4));
                s.setPassword(rs.getString(5));
                s.setPosition(rs.getString(6));
                s.setPlatoon(rs.getString(7));
                s.setReligion(rs.getString(8));
                s.setGender(rs.getString(9));
                s.setAge(rs.getString(10));
                s.setDOB(rs.getString(11));
                s.setCourse(rs.getString(12));
                s.setSection(rs.getString(13));
                s.setStatus(rs.getString(14));
                s.setPoints(rs.getInt(15));
                s.setAbsents(rs.getInt(16));
                s.setTardiness(rs.getInt(17));
                list.add(s);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
