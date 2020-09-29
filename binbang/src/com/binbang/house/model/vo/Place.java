package com.binbang.house.model.vo;

public class Place {
	private String placeLocation;
	private String placeTitle;
	private String placeContents;
	private String placeCategory;
	
	public Place() {
		// TODO Auto-generated constructor stub
	}

	public Place(String placeLocation, String placeTitle, String placeContents, String placeCategory) {
		super();
		this.placeLocation = placeLocation;
		this.placeTitle = placeTitle;
		this.placeContents = placeContents;
		this.placeCategory = placeCategory;
	}

	public String getPlaceLocation() {
		return placeLocation;
	}

	public void setPlaceLocation(String placeLocation) {
		this.placeLocation = placeLocation;
	}

	public String getPlaceTitle() {
		return placeTitle;
	}

	public void setPlaceTitle(String placeTitle) {
		this.placeTitle = placeTitle;
	}

	public String getPlaceContents() {
		return placeContents;
	}

	public void setPlaceContents(String placeContents) {
		this.placeContents = placeContents;
	}

	public String getPlaceCategory() {
		return placeCategory;
	}

	public void setPlaceCategory(String placeCategory) {
		this.placeCategory = placeCategory;
	}

	@Override
	public String toString() {
		return "Place [placeLocation=" + placeLocation + ", placeTitle=" + placeTitle + ", placeContents="
				+ placeContents + ", placeCategory=" + placeCategory + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((placeCategory == null) ? 0 : placeCategory.hashCode());
		result = prime * result + ((placeContents == null) ? 0 : placeContents.hashCode());
		result = prime * result + ((placeLocation == null) ? 0 : placeLocation.hashCode());
		result = prime * result + ((placeTitle == null) ? 0 : placeTitle.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Place other = (Place) obj;
		if (placeCategory == null) {
			if (other.placeCategory != null)
				return false;
		} else if (!placeCategory.equals(other.placeCategory))
			return false;
		if (placeContents == null) {
			if (other.placeContents != null)
				return false;
		} else if (!placeContents.equals(other.placeContents))
			return false;
		if (placeLocation == null) {
			if (other.placeLocation != null)
				return false;
		} else if (!placeLocation.equals(other.placeLocation))
			return false;
		if (placeTitle == null) {
			if (other.placeTitle != null)
				return false;
		} else if (!placeTitle.equals(other.placeTitle))
			return false;
		return true;
	}
	
	
	
	
}
