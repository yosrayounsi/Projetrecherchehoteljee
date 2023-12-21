package beans;
import java.io.Serializable;
import java.util.List;

public class Hotel implements Serializable {
    
    private Long id;

    private String name;
    private String city;
    private int stars;
    private String description;
    private String Path;

 
    @Override
	public String toString() {
		return "Hotel [name=" + name + ", city=" + city + ", stars=" + stars + ", description=" + description
				+ ", Path=" + Path + "]";
	}


	public String getPath() {
		return Path;
	}


	public void setPath(String path) {
		Path = path;
	}


	private List<RoomType> roomTypes;

  
    private List<Photo> photos;


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public int getStars() {
		return stars;
	}


	public void setStars(int stars) {
		this.stars = stars;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public List<RoomType> getRoomTypes() {
		return roomTypes;
	}


	public void setRoomTypes(List<RoomType> roomTypes) {
		this.roomTypes = roomTypes;
	}


	public List<Photo> getPhotos() {
		return photos;
	}


	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}


	public Hotel() {
		super();
	}


}
