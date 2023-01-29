package com.muwei.demo.model;

import java.util.List;
import java.util.Map;

public interface CampsiteRepositoryCustom {

	public List<Campsite> selectByCheck(Map<String,String> checks,boolean campervanAVL);
	
}
