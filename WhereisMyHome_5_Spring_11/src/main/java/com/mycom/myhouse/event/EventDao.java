package com.mycom.myhouse.event;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycom.myhouse.event.dto.EventDto;

@Mapper
public interface EventDao {

	int insertEvent(EventDto eventDto);
	// int updateEvent(EventDto eventDto);
	int deleteEvent(int eventId);
	
	EventDto getEvent(int eventId);
	List<EventDto> getEventList();
	
}
