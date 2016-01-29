package ujm.wi.enums;

public enum Paths {
	VAR("C:\\FullRLFAP\\CELAR\\scen06\\var.txt"), DOM("C:\\FullRLFAP\\CELAR\\scen06\\dom.txt"), 
	CTR("C:\\FullRLFAP\\CELAR\\scen06\\ctr.txt"), JCM("C:\\FullRLFAP\\outFiles\\file.jcm"),
	ASL("C:\\FullRLFAP\\outFiles\\file.jcm");

	private String name = "";

	Paths(String name) {
		this.name = name;
	}

	public String toString() {
		return name;
	}
}
