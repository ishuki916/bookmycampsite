package com.muwei.demo.camp.model;

import java.util.List;
import java.util.Map;

public interface CampsiteRepositoryCustom {

	public List<Campsite> selectByCheck(Map<String,String> checks,boolean campervanAVL);
	
}
