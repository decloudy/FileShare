package com.zust.FileShare.dto;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import com.zust.FileShare.entity.File;
import com.zust.FileShare.entity.Notice;
import com.zust.FileShare.entity.User;

public class DepartmentDto {
	// Fields

		private Integer id;
		private String departName;



		public Integer getId() {
			return this.id;
		}

		public void setId(Integer id) {
			this.id = id;
		}


		public String getDepartName() {
			return this.departName;
		}

		public void setDepartName(String departName) {
			this.departName = departName;
		}



}
