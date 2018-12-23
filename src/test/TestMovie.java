package test;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.MovieDao;
import entity.Actor;
import entity.Area;
import entity.Director;
import entity.Movie;
import entity.Picture;
import entity.Playwright;
import entity.Tag;
import entity.Type;

public class TestMovie {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		MovieDao md = new MovieDao();
		Movie m = new Movie();
		Picture p = new Picture();
		Type t = new Type();
		Area a = new Area();
		Director d = new Director();
		Actor act = new Actor();
		Playwright pl = new Playwright();
		Tag tg = new Tag();
		
		//test add movie
		/*m.setMname("无名之辈");
		m.setDuration(108);
		m.setAlias("慌枪走板");
		m.setImdbUrl("http://www.imdb.com/title/tt9282616");
		m.setIntro("在一座山间小城中，一对低配劫匪、一个落魄的泼皮保安、一个身体残疾却性格彪悍的毒舌女以及一系列生活在社会不同轨迹上的小人物，在一个貌似平常的日子里，因为一把丢失的老枪和一桩当天发生在城中的乌龙劫案，从而被阴差阳错地拧到一起，发生的一幕幕令人啼笑皆非的荒诞喜剧。");
		m.setLanguage("汉语普通话 / 贵州话");
		m.setReleaseDate("2018-11-16");
		if(md.addMovie(m) == true){
			System.out.println("add movie successful!");
		}
		else System.out.println("add movie failed!");*/
		
		//test delete movie
		/*m.setMid(13);
		if(md.deleteMovie(m) == true){
			System.out.println("delete movie successful!");
		}
		else System.out.println("delete movie failed!");*/
		
		//test add picture of the movie
		/*m.setMid(13);
		p.setPicid(15);
		if(md.addMoviePicture(m,p) == true){
			System.out.println("add picture successful!");
		}
		else System.out.println("add picture failed!");*/
		
		//test delete picture of the movie
		/*m.setMid(12);
		p.setPicid(15);
		if(md.deleteMoviePicture(m,p) == true){
			System.out.println("delete picture successful!");
		}
		else System.out.println("delete picture failed!");*/
		
		//test get all the pictures of the movie
		/*m.setMid(5);
		ArrayList<Picture> pics = md.getAllPictures(m);
		for(int i=0;i<pics.size();i++){
			System.out.println(pics.get(i).getPicid()+" "+pics.get(i).getPiclocation());
		}*/
		
		
		//test add type of the movie
		/*t.setTypeid(3);
		m.setMid(1);
		if(md.addMovieType(m,t) == true){
			System.out.println("add type successful!");
		}
		else System.out.println("add type failed!");*/
		
		//test delete type of the movie
		/*t.setTypeid(3);
		m.setMid(1);
		if(md.deleteMovieType(m,t) == true){
			System.out.println("delete type successful!");
		}
		else System.out.println("delete type failed!");*/
		
		//test search the movies by type
		/*t.setTypeid(1);
		ArrayList<Movie> ms = md.searchMovieByType(t);
		for(int i=0;i<ms.size();i++){
			System.out.println(ms.get(i).getMid()+" "+ms.get(i).getMname()+" "+ms.get(i).getAlias()+" "+ms.get(i).getLanguage()+" "+ms.get(i).getImdbUrl()+" "+ms.get(i).getDuration()+" "+ms.get(i).getReleaseDate());
			System.out.println(ms.get(i).getIntro());
		}*/
		
		//test search the type of movie
		/*m.setMid(1);
		ArrayList<Type> ms = md.getAllType(m);
		for(int i=0;i<ms.size();i++){
			System.out.println(ms.get(i).getTypeid()+" "+ms.get(i).getTypename());
		}*/
		
		//test add area of the movie
		/*a.setAreaid(9);
		m.setMid(1);
		if(md.addMovieArea(m,a) == true){
			System.out.println("add area successful!");
		}
		else System.out.println("add area failed!");*/
				
		//test delete area of the movie
		/*a.setAreaid(9);
		m.setMid(1);
		if(md.deleteMovieArea(m,a) == true){
			System.out.println("delete area successful!");
		}
		else System.out.println("delete area failed!");*/
				
		//test search the movies by area
		/*a.setAreaid(1);
		ArrayList<Movie> ms = md.searchMovieByArea(a);
		for(int i=0;i<ms.size();i++){
			System.out.println(ms.get(i).getMid()+" "+ms.get(i).getMname()+" "+ms.get(i).getAlias()+" "+ms.get(i).getLanguage()+" "+ms.get(i).getImdbUrl()+" "+ms.get(i).getDuration()+" "+ms.get(i).getReleaseDate());
			System.out.println(ms.get(i).getIntro());
		}*/
				
		//test search the area of movie
		/*m.setMid(11);
		ArrayList<Area> ms = md.getAllArea(m);
		for(int i=0;i<ms.size();i++){
			System.out.println(ms.get(i).getAreaid()+" "+ms.get(i).getAreaname());
		}*/
		
		//test add director of the movie
		/*d.setDirectorid(6);
		m.setMid(4);
		if(md.addMovieDirector(m,d) == true){
			System.out.println("add director successful!");
		}
		else System.out.println("add director failed!");*/
						
		//test delete director of the movie
		/*d.setDirectorid(6);
		m.setMid(4);
		if(md.deleteMovieDirector(m,d) == true){
			System.out.println("delete director successful!");
		}
		else System.out.println("delete director failed!");*/
						
		//test search the movies by director
		/*d.setDirectorid(1);
		ArrayList<Movie> ms = md.searchMovieByDirector(d);
		for(int i=0;i<ms.size();i++){
			System.out.println(ms.get(i).getMid()+" "+ms.get(i).getMname()+" "+ms.get(i).getAlias()+" "+ms.get(i).getLanguage()+" "+ms.get(i).getImdbUrl()+" "+ms.get(i).getDuration()+" "+ms.get(i).getReleaseDate());
			System.out.println(ms.get(i).getIntro());
		}*/
						
		//test search the director of movie
		/*m.setMid(1);
		ArrayList<Director> ms = md.getAllDirector(m);
		for(int i=0;i<ms.size();i++){
			System.out.println(ms.get(i).getDirectorid()+" "+ms.get(i).getDirectorname());
		}*/
		
		//test add actor of the movie
		/*act.setAid(5);
		m.setMid(1);
		if(md.addMovieActor(m,act) == true){
			System.out.println("add actor successful!");
		}
		else System.out.println("add actor failed!");*/
								
		//test delete actor of the movie
		/*act.setAid(5);
		m.setMid(1);
		if(md.deleteMovieActor(m,act) == true){
			System.out.println("delete actor successful!");
		}
		else System.out.println("delete actor failed!");*/
								
		//test search the movies by actor
		/*act.setAid(1);
		ArrayList<Movie> ms = md.searchMovieByActor(act);
		for(int i=0;i<ms.size();i++){
			System.out.println(ms.get(i).getMid()+" "+ms.get(i).getMname()+" "+ms.get(i).getAlias()+" "+ms.get(i).getLanguage()+" "+ms.get(i).getImdbUrl()+" "+ms.get(i).getDuration()+" "+ms.get(i).getReleaseDate());
			System.out.println(ms.get(i).getIntro());
		}*/
								
		//test search the actor of movie
		/*m.setMid(1);
		ArrayList<Actor> ms = md.getAllActor(m);
		for(int i=0;i<ms.size();i++){
			System.out.println(ms.get(i).getAid()+" "+ms.get(i).getAname()+" "+ms.get(i).getaBirthday()+" "+ms.get(i).getAsex());
		}*/
		
		//test add playwright of the movie
		/*pl.setPlaywrightid(30);
		m.setMid(1);
		if(md.addMoviePlaywright(m,pl) == true){
			System.out.println("add playwright successful!");
		}
		else System.out.println("add playwright failed!");*/
										
		//test delete playwright of the movie
		/*pl.setPlaywrightid(30);
		m.setMid(1);
		if(md.deleteMoviePlaywright(m,pl) == true){
			System.out.println("delete playwright successful!");
		}
		else System.out.println("delete playwright failed!");*/
										
		//test search the movies by playwright
		/*pl.setPlaywrightid(2);
		ArrayList<Movie> ms = md.searchMovieByPlaywright(pl);
		for(int i=0;i<ms.size();i++){
			System.out.println(ms.get(i).getMid()+" "+ms.get(i).getMname()+" "+ms.get(i).getAlias()+" "+ms.get(i).getLanguage()+" "+ms.get(i).getImdbUrl()+" "+ms.get(i).getDuration()+" "+ms.get(i).getReleaseDate());
			System.out.println(ms.get(i).getIntro());
		}*/
										
		//test search the playwright of movie
		/*m.setMid(1);
		ArrayList<Playwright> ms = md.getAllPlaywright(m);
		for(int i=0;i<ms.size();i++){
			System.out.println(ms.get(i).getPlaywrightid()+" "+ms.get(i).getPlaywrightname());
		}*/
		
		//test the get the avrege score of the movie
		/*m.setMid(1);
		System.out.println(md.getAverScore(m));*/
		
		//test add tag of the movie
		/*tg.setTagname("魔幻");
		m.setMid(1);
		if(md.addMovieTag(m, tg) == true){
			System.out.println("add tag successful!");
		}
		else System.out.println("add tag failed!");*/
												
		//test delete tag of the movie
		/*tg.setTagname("魔幻");
		m.setMid(1);
		if(md.deleteMovieTag(m, tg) == true){
			System.out.println("delete tag successful!");
		}
		else System.out.println("delete tag failed!");*/
												
		//test get all tags of movie and search the movies by tag
		/*m.setMid(1);
		ArrayList<Tag> tags = md.getAllTag(m);
		ArrayList<Movie> mv = md.searchMovieByTags(tags);
		for(int i=0;i<mv.size();i++){
			System.out.println(mv.get(i).getMid()+" "+mv.get(i).getMname()+" "+mv.get(i).getAlias()+" "+mv.get(i).getLanguage()+" "+mv.get(i).getImdbUrl()+" "+mv.get(i).getDuration()+" "+mv.get(i).getReleaseDate());
			System.out.println(mv.get(i).getIntro());
		}*/
		
	}

}
