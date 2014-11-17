package models;

import play.*;
import play.data.validation.MaxSize;
import play.db.jpa.*;

import javax.persistence.*;

import java.util.*;

@Entity
@Table(name = "T_INFORMATIONS")
public class Information extends Standard {
	
    @Column(name="INFORMATION_TYPE")
    public String informationType;
   
    
    @ManyToOne
    public Submenu submenu;
    
    @Lob
    @Column(name = "CONTENT")
    @MaxSize(10000)
    public String content;
    
    public Information() {
		super();
	}
    
    @Override
    public String toString() {
    	return submenu + "";
    }
}
