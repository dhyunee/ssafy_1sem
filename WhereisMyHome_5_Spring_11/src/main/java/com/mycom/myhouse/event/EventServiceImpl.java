package com.mycom.myhouse.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.myhouse.event.dto.EventDto;
import com.mycom.myhouse.event.dto.EventResultDto;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventDao eventDao;
	
	private final int SUCCESS = 1;
	private final int FAIL = -1;

	@Override
	public EventResultDto insertEvent(EventDto eventDto) {
		EventResultDto eventResultDto = new EventResultDto();
		
		try {
			eventDao.insertEvent(eventDto);
			eventResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			eventResultDto.setResult(FAIL);
		}
		
		return eventResultDto;
	}

//	@Override
//	public EventResultDto updateEvent(EventDto eventDto) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public EventResultDto deleteEvent(int eventId) {
		EventResultDto eventResultDto = new EventResultDto();
		
		try {
			eventDao.deleteEvent(eventId);
			eventResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			eventResultDto.setResult(FAIL);
		}
		
		return eventResultDto;
	}

	@Override
	public EventResultDto getEvent(int eventId) {
		EventResultDto eventResultDto = new EventResultDto();
		
		try {
			EventDto eventDto = eventDao.getEvent(eventId);
			eventResultDto.setEvent(eventDto);
			eventResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			eventResultDto.setResult(FAIL);
		}
		
		return eventResultDto;
	}

	@Override
	public EventResultDto getEventList() {
		EventResultDto eventResultDto = new EventResultDto();
		
		try {
			List<EventDto> eventList = eventDao.getEventList();
			eventResultDto.setEventList(eventList);
			eventResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			eventResultDto.setResult(FAIL);
		}
		
		return eventResultDto;
	}

}
