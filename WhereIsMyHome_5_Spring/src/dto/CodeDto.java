package dto;

public class CodeDto {
	private String codeName;
	private String code;
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "CodeDto [codeName=" + codeName + ", code=" + code + "]";
	}
	
	
}
