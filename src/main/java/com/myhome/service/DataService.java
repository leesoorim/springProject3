package com.myhome.service;

import java.util.List;

import com.myhome.dto.DataDto;
import com.myhome.dto.DefaultDto;

public interface DataService {

	int insertDataBoard(DataDto dto) throws Exception;

	int selectDataboardTotal(DefaultDto defaultDto) throws Exception;

	List<?> selectDataboardList(DefaultDto defaultDto)throws Exception;

	void updateDataboardHits(int seqid) throws Exception;

	DataDto selectDataboardDetail(int seqid) throws Exception;

	int updateDataboardFilename(DataDto dto)throws Exception;

	int updateDataboard(DataDto dto) throws Exception;

	int deleteDataboard(DataDto dto) throws Exception;
}
