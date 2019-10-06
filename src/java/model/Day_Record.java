/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author mckee
 */
public class Day_Record {
    private int day_record_id;
    private String day_record_time;
    private int day_record_cadet_id;
    private String day_record_cadet_name;
    private int day_record_records_id;
    private double day_record_attendance_status;

    public String getDay_record_cadet_name() {
        return day_record_cadet_name;
    }

    public void setDay_record_cadet_name(String day_record_cadet_name) {
        this.day_record_cadet_name = day_record_cadet_name;
    }
    
    public double getDay_record_attendance_status() {
        return day_record_attendance_status;
    }

    public void setDay_record_attendance_status(double day_record_attendance_status) {
        this.day_record_attendance_status = day_record_attendance_status;
    }


    public int getDay_record_id() {
        return day_record_id;
    }

    public void setDay_record_id(int day_record_id) {
        this.day_record_id = day_record_id;
    }

    public String getDay_record_time() {
        return day_record_time;
    }

    public void setDay_record_time(String day_record_time) {
        this.day_record_time = day_record_time;
    }

    public int getDay_record_cadet_id() {
        return day_record_cadet_id;
    }

    public void setDay_record_cadet_id(int day_record_cadet_id) {
        this.day_record_cadet_id = day_record_cadet_id;
    }

    public int getDay_record_records_id() {
        return day_record_records_id;
    }

    public void setDay_record_records_id(int day_record_records_id) {
            this.day_record_records_id = day_record_records_id;
    }
    
}
