package com.zust.FileShare.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Filetype entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "filetype", catalog = "fileshare")

public class Filetype implements java.io.Serializable {

	// Fields

	private Integer id;
	private String typeName;
	private Set<File> files = new HashSet<File>(0);

	// Constructors

	/** default constructor */
	public Filetype() {
	}

	/** full constructor */
	public Filetype(String typeName, Set<File> files) {
		this.typeName = typeName;
		this.files = files;
	}

	// Property accessors
	@Id
	@GeneratedValue

	@Column(name = "Id", unique = true, nullable = false)

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "typeName")

	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "filetype")

	public Set<File> getFiles() {
		return this.files;
	}

	public void setFiles(Set<File> files) {
		this.files = files;
	}

}