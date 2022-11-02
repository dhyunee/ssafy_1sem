package com.mycom.myhouse.event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mycom.myhouse.event.dto.EventDto;
import com.mycom.myhouse.event.dto.EventResultDto;

@RestController
public class EventController {
	
	@Autowired
	EventService eventService;
	
	// insert
	@PostMapping("/events")
	public EventResultDto insertEvent(EventDto eventDto) {
		return eventService.insertEvent(eventDto);
	}
	
	// delete
	@DeleteMapping("/events/{eventId}")
	public EventResultDto deleteEvent(@PathVariable int eventId) {
		return eventService.deleteEvent(eventId);
	}
	
	// getEvent
	@GetMapping("/events/{eventId}")
	public EventResultDto getEvent(@PathVariable int eventId) {
		return eventService.getEvent(eventId);
	}
	
	// getEventList
	@GetMapping("/events")
	public EventResultDto getEventList() {
		return eventService.getEventList();
	}
}
