package com.zust.FileShare.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zust.FileShare.dao.DepartmentDao;
import com.zust.FileShare.dto.DepartmentDto;
import com.zust.FileShare.entity.Department;
import com.zust.FileShare.service.DepartmentService;



@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
    private DepartmentDao departmentDao;
	
	
	@Override
	public List<DepartmentDto> findAllDepart() {
		// TODO Auto-generated method stub
		String hql="from Department";
		List<Department> departmentList=departmentDao.find(hql);
		if(departmentList != null && departmentList.size()!=0){
			List<DepartmentDto> departmentDtoList =new ArrayList<DepartmentDto>();
			for(int i = 0;i<departmentList.size();i++){
				DepartmentDto departmentDto = new DepartmentDto();
                BeanUtils.copyProperties(departmentList.get(i),departmentDto);
                departmentDtoList.add(departmentDto);
            }
            return departmentDtoList;
			
		}
		else{
			return null;
		}	
		
	}

}
