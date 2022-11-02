package com.mycom.myhouse.event;

import com.mycom.myhouse.event.dto.EventDto;
import com.mycom.myhouse.event.dto.EventResultDto;

public interface EventService {

	EventResultDto insertEvent(EventDto eventDto);
	// EventResultDto updateEvent(EventDto eventDto);
	EventResultDto deleteEvent(int eventId);
	
	EventResultDto getEvent(int eventId);
	EventResultDto getEventList();
	
}
