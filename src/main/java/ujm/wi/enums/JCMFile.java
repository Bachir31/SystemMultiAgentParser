package ujm.wi.enums;

public enum JCMFile {
	PROJECT_NAME("helloworld"),
	MAS("mas"),
	AGENT("agent"),
	BELIEFS("beliefs"),
	ASL_FILE_NAME("aslFile.asl"),
	NEIGHBORS("neighbors")
	;
	private String name = "";

	JCMFile(String name) {
		this.name = name;
	}

	public String toString() {
		return name;
	}

}
