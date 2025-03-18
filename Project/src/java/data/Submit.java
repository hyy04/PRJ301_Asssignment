/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;
import java.sql.Date;
/**
 *
 * @author Admin
 */
public class Submit {
    private String title;
    private Date start_date;
    private Date end_date;
    private String created_by;
    private String status;
    private String processed_by;

    public Submit() {
    }

    public String getStatus() {
        return status;
    }

    public Submit(String title, Date start_date, Date end_date, String created_by, String status, String processed_by) {
        this.title = title;
        this.start_date = start_date;
        this.end_date = end_date;
        this.created_by = created_by;
        this.status = status;
        this.processed_by = processed_by;
    }

    

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProcessed_by() {
        return processed_by;
    }

    public void setProcessed_by(String processed_by) {
        this.processed_by = processed_by;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    

    public String getCreated_by() {
        return created_by;
    }

    public void setCreated_by(String created_by) {
        this.created_by = created_by;
    }
    
    
}

