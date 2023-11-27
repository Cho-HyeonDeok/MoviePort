package com.movieport.mapper;

import java.util.List;

import com.movieport.model.Criteria;
import com.movieport.model.MovieVO;

public interface MovieMapper {
	
	/* 영화 목록 */	
	public List<MovieVO> moviesGetList(Criteria cri);

	/* 영화 상세 */
	public MovieVO movieGetDetail(String m_code);
	
}