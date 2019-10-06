/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Day_Record;

/**
 *
 * @author mckee
 */
public class test {
    public static void main(String[] args) {
        Controller_Day_RecordDao dr = Controller_Day_RecordDao.getDay_RecordDao();
//        dr.transferToDay_Record(1);
        System.out.println(dr.fetchAll());
//        int updateRes = dr.updateToArchive();
//        Day_Record waw = dr.fetchArchive(1);
//        Day_Record waw = dr.fetchRecord( 4);
//        Day_Record updateRecord = dr.fetchArchive(2, 1);
//        System.out.println(updateRecord.getDay_record_cadet_id());
        
//        System.out.println(waw);
//        System.out.println(waw.getDay_record_time());
        
//        System.out.println(dr.fetchAllArchive(1));

//        System.out.println(updateRes);
        
        //Mag fetch ko sa id ug records id sa archive na day_record.
        
//        int insertRes = dr.insertToArchive();
//        System.out.println(insertRes);
        
//        if (updateRes == 0) {
//            System.out.println(insertRes);
//        }else{
//            System.out.println( "UPDATED "+ updateRes);
//        }
        
//        List<Day_Record> listDR = dr.fetchAll(1);
//        Day_Record rcd = listDR.get(3);
//        rcd.setDay_record_attendance_status(2.0);
//        dr.update(rcd);
        
//        System.out.println(rcd.getDay_record_cadet_id());
    }
}
