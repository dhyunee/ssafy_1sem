package dto;

public class EventDto {
	public int eventId;
	public String eventName;
	public String eventFrom;
	public String eventTo;
	
	@Override
	public String toString() {
		return "EventDto [eventId=" + eventId + ", eventName=" + eventName + ", eventFrom=" + eventFrom + ", eventTo="
				+ eventTo + "]";
	}
	
	
	
}
