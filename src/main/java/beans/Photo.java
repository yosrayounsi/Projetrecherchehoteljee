package beans;

import java.io.Serializable;



public class Photo implements Serializable {

    private Long id;

    private String label;
    private String path;

    private Hotel hotel;

	public Photo(Long id, String label, String path, Hotel hotel) {
		super();
		this.id = id;
		this.label = label;
		this.path = path;
		this.hotel = hotel;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
    

}
