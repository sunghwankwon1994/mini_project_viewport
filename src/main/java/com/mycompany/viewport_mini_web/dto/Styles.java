package com.mycompany.viewport_mini_web.dto;

import java.sql.Blob;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Styles {
	private int stid;
	private Blob stimage;
	private byte[] stattachdata;
	private String stattachoname;
	private String stattachsname;
	private String stattachtype;
	private int stpnum;
	private int stuserid;
	private Date sdate;
	
	private MultipartFile stattach;	
	}
