package com.mycom.myhouse.event.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class EventDto {
	
	private int eventId;
	private String eventName;
	private String eventFrom;
	private String eventTo;
	
}
