package data;

public enum Rank {
	R5D("5D"), R5C("5C"), R5B("5B"), R5A("5A"), 
	R4D("4D"), R4C("4C"), R4B("4B"), R4A("4A"), 
	R3D("3D"), R3C("3C"), R3B("3B"), R3A("3A"), 
	R2D("2D"), R2C("2C"), R2B("2B"), R2A("2A");
	
	Rank(String aName) {
		this.name = aName;
	}
	
	public String name;
}
