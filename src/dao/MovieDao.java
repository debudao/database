package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import java.util.ArrayList;

import entity.Actor;
import entity.Area;
import entity.Director;
import entity.Movie;
import entity.Picture;
import entity.Playwright;
import entity.Tag;
import entity.Type;

public class MovieDao extends DaoBase implements MovieDaoable{

	
	private static final String ADD_MOVIE_SQL="insert movie(mname,alias,intro,imdbUrl,language,releaseDate,duration) "
			+ "values(?,?,?,?,?,?,?)";
	
	@Override
	public boolean addMovie(Movie m) throws SQLException {
		conn=getConnection();
		ps=conn.prepareStatement(ADD_MOVIE_SQL);
		ps.setString(1, m.getMname());
		ps.setString(2, m.getAlias());
		ps.setString(3, m.getIntro());
		ps.setString(4, m.getImdbUrl());
		ps.setString(5, m.getLanguage());
		ps.setString(6, m.getReleaseDate());
		ps.setInt(7, m.getDuration());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;	
	}

	private static final String ADD_MOVIE_PICTURE_SQL="insert picturemovie(mid,picid) "
			+ "values(?,?)";
	
	@Override
	public boolean addMoviePicture(Movie m, Picture picture)
			throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(ADD_MOVIE_PICTURE_SQL);
		ps.setInt(1, m.getMid());
		ps.setInt(2, picture.getPicid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String DELETE_MOVIE_PICTURE_SQL="delete from picturemovie "
			+ "where mid=? and picid=?";
	
	@Override
	public boolean deleteMoviePicture(Movie m, Picture picture)
			throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(DELETE_MOVIE_PICTURE_SQL);
		ps.setInt(1, m.getMid());
		ps.setInt(2, picture.getPicid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
		
	}

	private static final String GET_ALL_MOVIE_PICTURE_SQL="select p.piclocation,p.picid from picture as p,picturemovie as pm "
			+ "where pm.mid=? and pm.picid=p.picid";
	
	@Override
	public ArrayList<Picture> getAllPictures(Movie movie) throws SQLException {

		conn=getConnection();
		ps=conn.prepareStatement(GET_ALL_MOVIE_PICTURE_SQL);
		ps.setInt(1, movie.getMid());
		rs=ps.executeQuery();

		ArrayList<Picture> pictures=new ArrayList<Picture>();
		while(rs.next()){
			Picture p=new Picture();
			p.setPicid(rs.getInt("p.picid"));
			p.setPiclocation(rs.getString("p.piclocation"));
			pictures.add(p);
		}
		
		release(conn, ps, rs);
		return pictures;
	}
	
	private static final String ADD_MOVIE_TYPE_SQL="insert typemovie(mid,typeid) "
			+ "values(?,?)";

	@Override
	public boolean addMovieType(Movie m, Type type) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(ADD_MOVIE_TYPE_SQL);
		ps.setInt(1, m.getMid());
		ps.setInt(2, type.getTypeid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}
	
	private static final String DELETE_MOVIE_TYPE_SQL="delete from typemovie "
			+ "where mid=? and typeid=?";

	@Override
	public boolean deleteMovieType(Movie m, Type type) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(DELETE_MOVIE_TYPE_SQL);
		ps.setInt(1, m.getMid());
		ps.setInt(2, type.getTypeid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String SEARCH_MOVIE_TYPE_SQL="select m.mid,m.mname,m.alias,m.intro,m.imdbUrl,m.language,"
			+ "m.releaseDate,m.duration from movie as m,typemovie as tm where m.mid=tm.mid and tm.typeid=?";
	
	@Override
	public ArrayList<Movie> searchMovieByType(Type type) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(SEARCH_MOVIE_TYPE_SQL);
		ps.setInt(1, type.getTypeid());
		rs=ps.executeQuery();
		
		ArrayList<Movie> movies=new ArrayList<Movie>();
		while(rs.next()){
			Movie m=new Movie();
			m.setMid(rs.getInt("m.mid"));
			m.setMname(rs.getString("m.mname"));
			m.setAlias(rs.getString("m.alias"));
			m.setIntro(rs.getString("m.intro"));
			m.setImdbUrl(rs.getString("m.imdbUrl"));
			m.setLanguage(rs.getString("m.language"));
			m.setReleaseDate(rs.getString("m.releaseDate"));
			m.setDuration(rs.getInt("m.duration"));
			movies.add(m);
		}

		release(conn, ps, rs);
		return movies;
	}

	private static final String GET_ALL_MOVIE_TYPE_SQL="select t.typeid,t.typename from type as t,"
			+ "typemovie as tm where tm.mid=? and tm.typeid=t.typeid";
	
	@Override
	public ArrayList<Type> getAllType(Movie movie) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(GET_ALL_MOVIE_TYPE_SQL);
		ps.setInt(1, movie.getMid());
		rs=ps.executeQuery();
		
		ArrayList<Type> types=new ArrayList<Type>();
		while(rs.next()){
			Type t=new Type();
			t.setTypeid(rs.getInt("t.typeid"));
			t.setTypename(rs.getString("t.typename"));
			types.add(t);
		}
		
		release(conn, ps, rs);
		return types;
	}

	private static final String ADD_MOVIE_AREA_SQL="insert areamovie(mid,areaid) "
			+ "values(?,?)";
	
	@Override
	public boolean addMovieArea(Movie m, Area area) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(ADD_MOVIE_AREA_SQL);
		ps.setInt(1, m.getMid());
		ps.setInt(2, area.getAreaid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String DELETE_MOVIE_AREA_SQL="delete from areamovie "
			+ "where mid=? and areaid=?";
	
	@Override
	public boolean deleteMovieArea(Movie m, Area area) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(DELETE_MOVIE_AREA_SQL);
		ps.setInt(1, m.getMid());
		ps.setInt(2, area.getAreaid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String SEARCH_MOVIE_AREA_SQL="select m.mid,m.mname,m.alias,m.intro,m.imdbUrl,m.language,"
			+ "m.releaseDate,m.duration from movie as m,areamovie as am where m.mid=am.mid and am.areaid=?";
	
	@Override
	public ArrayList<Movie> searchMovieByArea(Area area) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(SEARCH_MOVIE_AREA_SQL);
		ps.setInt(1, area.getAreaid());
		rs=ps.executeQuery();
		
		ArrayList<Movie> movies=new ArrayList<Movie>();
		while(rs.next()){
			Movie m=new Movie();
			m.setMid(rs.getInt("m.mid"));
			m.setMname(rs.getString("m.mname"));
			m.setAlias(rs.getString("m.alias"));
			m.setIntro(rs.getString("m.intro"));
			m.setImdbUrl(rs.getString("m.imdbUrl"));
			m.setLanguage(rs.getString("m.language"));
			m.setReleaseDate(rs.getString("m.releaseDate"));
			m.setDuration(rs.getInt("m.duration"));
			movies.add(m);
		}

		release(conn, ps, rs);
		return movies;
	}

	private static final String GET_ALL_MOVIE_AREA_SQL="select a.areaid,a.areaname from area as a,"
			+ "areamovie as am where am.mid=? and am.areaid=a.areaid";
	
	@Override
	public ArrayList<Area> getAllArea(Movie movie) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(GET_ALL_MOVIE_AREA_SQL);
		ps.setInt(1, movie.getMid());
		rs=ps.executeQuery();
		
		ArrayList<Area> areas=new ArrayList<Area>();
		while(rs.next()){
			Area a=new Area();
			a.setAreaid(rs.getInt("a.areaid"));
			a.setAreaname(rs.getString("a.areaname"));
			areas.add(a);
		}
		
		release(conn, ps, rs);
		return areas;
	}

	private static final String ADD_MOVIE_DIRECTOR_SQL="insert directormovie(mid,directorid) "
			+ "values(?,?)";
	
	@Override
	public boolean addMovieDirector(Movie m, Director director)
			throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(ADD_MOVIE_DIRECTOR_SQL);
		ps.setInt(1, m.getMid());
		ps.setInt(2, director.getDirectorid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String DELETE_MOVIE_DIRECTOR_SQL="delete from directormovie "
			+ "where mid=? and directorid=?";
	
	@Override
	public boolean deleteMovieDirector(Movie m, Director director)
			throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(DELETE_MOVIE_DIRECTOR_SQL);
		ps.setInt(1, m.getMid());
		ps.setInt(2, director.getDirectorid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String SEARCH_MOVIE_DIRECTOR_SQL="select m.mid,m.mname,m.alias,m.intro,m.imdbUrl,m.language,"
			+ "m.releaseDate,m.duration from movie as m,directormovie as dm where m.mid=dm.mid and dm.directorid=?";
	
	@Override
	public ArrayList<Movie> searchMovieByDirector(Director director)
			throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(SEARCH_MOVIE_DIRECTOR_SQL);
		ps.setInt(1, director.getDirectorid());
		rs=ps.executeQuery();
		
		ArrayList<Movie> movies=new ArrayList<Movie>();
		while(rs.next()){
			Movie m=new Movie();
			m.setMid(rs.getInt("m.mid"));
			m.setMname(rs.getString("m.mname"));
			m.setAlias(rs.getString("m.alias"));
			m.setIntro(rs.getString("m.intro"));
			m.setImdbUrl(rs.getString("m.imdbUrl"));
			m.setLanguage(rs.getString("m.language"));
			m.setReleaseDate(rs.getString("m.releaseDate"));
			m.setDuration(rs.getInt("m.duration"));
			movies.add(m);
		}

		release(conn, ps, rs);
		return movies;
	}

	private static final String GET_ALL_MOVIE_DIRECTOR_SQL="select d.directorid,d.directorname from director as d,"
			+ "directormovie as dm where dm.mid=? and dm.directorid=d.directorid";
	
	@Override
	public ArrayList<Director> getAllDirector(Movie movie) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(GET_ALL_MOVIE_DIRECTOR_SQL);
		ps.setInt(1, movie.getMid());
		rs=ps.executeQuery();
		
		ArrayList<Director> directors=new ArrayList<Director>();
		while(rs.next()){
			Director d=new Director();
			d.setDirectorid(rs.getInt("d.directorid"));
			d.setDirectorname(rs.getString("d.directorname"));
			directors.add(d);
		}
		
		release(conn, ps, rs);
		return directors;
	}

	private static final String ADD_MOVIE_ACTOR_SQL="insert actormovie(mid,aid) "
			+ "values(?,?)";
	
	@Override
	public boolean addMovieActor(Movie m, Actor actor) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(ADD_MOVIE_ACTOR_SQL);
		ps.setInt(1, m.getMid());
		ps.setInt(2, actor.getAid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String DELETE_MOVIE_ACTOR_SQL="delete from actormovie "
			+ "where mid=? and aid=?";
	
	@Override
	public boolean deleteMovieActor(Movie m, Actor actor) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(DELETE_MOVIE_ACTOR_SQL);
		ps.setInt(1, m.getMid());
		ps.setInt(2, actor.getAid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String SEARCH_MOVIE_ACTOR_SQL="select m.mid,m.mname,m.alias,m.intro,m.imdbUrl,m.language,"
			+ "m.releaseDate,m.duration from movie as m,actormovie as am where m.mid=am.mid and am.aid=?";
	
	@Override
	public ArrayList<Movie> searchMovieByActor(Actor actor) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(SEARCH_MOVIE_ACTOR_SQL);
		ps.setInt(1, actor.getAid());
		rs=ps.executeQuery();
		
		ArrayList<Movie> movies=new ArrayList<Movie>();
		while(rs.next()){
			Movie m=new Movie();
			m.setMid(rs.getInt("m.mid"));
			m.setMname(rs.getString("m.mname"));
			m.setAlias(rs.getString("m.alias"));
			m.setIntro(rs.getString("m.intro"));
			m.setImdbUrl(rs.getString("m.imdbUrl"));
			m.setLanguage(rs.getString("m.language"));
			m.setReleaseDate(rs.getString("m.releaseDate"));
			m.setDuration(rs.getInt("m.duration"));
			movies.add(m);
		}

		release(conn, ps, rs);
		return movies;
	}

	private static final String GET_ALL_MOVIE_ACTOR_SQL="select a.aid,a.aname,a.asex,a.aBirthday from actor as a,"
			+ "actormovie as am where am.mid=? and am.aid=a.aid";
	
	@Override
	public ArrayList<Actor> getAllActor(Movie movie) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(GET_ALL_MOVIE_ACTOR_SQL);
		ps.setInt(1, movie.getMid());
		rs=ps.executeQuery();
		
		ArrayList<Actor> actors=new ArrayList<Actor>();
		while(rs.next()){
			Actor a=new Actor();
			a.setAid(rs.getInt("a.aid"));
			a.setAname(rs.getString("a.aname"));
			a.setAsex(rs.getString("a.asex"));
			a.setaBirthday(rs.getString("a.aBirthday"));
			actors.add(a);
		}
		
		release(conn, ps, rs);
		return actors;
	}

	private static final String ADD_MOVIE_PLAYWRIGHT_SQL="insert playwrightmovie(mid,playwrightid) "
			+ "values(?,?)";
	
	@Override
	public boolean addMoviePlaywright(Movie m, Playwright playwright)
			throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(ADD_MOVIE_PLAYWRIGHT_SQL);
		ps.setInt(1, m.getMid());
		ps.setInt(2, playwright.getPlaywrightid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String DELETE_MOVIE_PLAYWRIGHT_SQL="delete from playwrightmovie "
			+ "where mid=? and playwrightid=?";
	
	@Override
	public boolean deleteMoviePlaywright(Movie m, Playwright playwright)
			throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(DELETE_MOVIE_PLAYWRIGHT_SQL);
		ps.setInt(1, m.getMid());
		ps.setInt(2, playwright.getPlaywrightid());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String SEARCH_MOVIE_PLAYWRIGHT_SQL="select m.mid,m.mname,m.alias,m.intro,m.imdbUrl,m.language,"
			+ "m.releaseDate,m.duration from movie as m,playwrightmovie as pm where m.mid=pm.mid and pm.playwrightid=?";
	
	@Override
	public ArrayList<Movie> searchMovieByPlaywright(Playwright playwright)
			throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(SEARCH_MOVIE_PLAYWRIGHT_SQL);
		ps.setInt(1, playwright.getPlaywrightid());
		rs=ps.executeQuery();
		
		ArrayList<Movie> movies=new ArrayList<Movie>();
		while(rs.next()){
			Movie m=new Movie();
			m.setMid(rs.getInt("m.mid"));
			m.setMname(rs.getString("m.mname"));
			m.setAlias(rs.getString("m.alias"));
			m.setIntro(rs.getString("m.intro"));
			m.setImdbUrl(rs.getString("m.imdbUrl"));
			m.setLanguage(rs.getString("m.language"));
			m.setReleaseDate(rs.getString("m.releaseDate"));
			m.setDuration(rs.getInt("m.duration"));
			movies.add(m);
		}

		release(conn, ps, rs);
		return movies;
	}

	private static final String GET_ALL_MOVIE_PLAYWRIGHT_SQL="select p.playwrightid,p.playwrightname "
			+ "from playwright as p,playwrightmovie as pm where pm.mid=? and pm.playwrightid=p.playwrightid";
	
	@Override
	public ArrayList<Playwright> getAllPlaywright(Movie movie) throws SQLException {
		conn=getConnection();
		ps=conn.prepareStatement(GET_ALL_MOVIE_PLAYWRIGHT_SQL);
		ps.setInt(1, movie.getMid());
		rs=ps.executeQuery();
		
		ArrayList<Playwright> playwrights=new ArrayList<Playwright>();
		while(rs.next()){
			Playwright p=new Playwright();
			p.setPlaywrightid(rs.getInt("p.playwrightid"));
			p.setPlaywrightname(rs.getString("p.playwrightname"));
			playwrights.add(p);
		}
		
		release(conn, ps, rs);
		return playwrights;
	}

	private static final String GET_AVER_SCORE_SQL="select AVG(score) from comment where mid=?";
	
	@Override
	public float getAverScore(Movie m) throws SQLException {
		conn=getConnection();
		ps = conn.prepareStatement(GET_AVER_SCORE_SQL);	
		ps.setInt(1, m.getMid());
		ResultSet rs=ps.executeQuery();
		float f=0;
		
		if(rs.next())
			f=rs.getFloat("AVG(score)");
		
		release(conn, ps, rs);
		return f;
	}

	private static final String ADD_MOVIE_TAG_SQL="insert tag(mid,tagname) "
			+ "values(?,?)";
	
	@Override
	public boolean addMovieTag(Movie m, Tag tag) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(ADD_MOVIE_TAG_SQL);
		ps.setInt(1, m.getMid());
		ps.setString(2, tag.getTagname());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}

	private static final String DELETE_MOVIE_TAG_SQL="delete from tag "
			+ "where mid=? and tagname=?";
	
	@Override
	public boolean deleteMovieTag(Movie m, Tag tag) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(DELETE_MOVIE_TAG_SQL);
		ps.setInt(1, m.getMid());
		ps.setString(2, tag.getTagname());
		int flag=ps.executeUpdate();
		
		release(conn, ps, rs);
		return flag==1?true:false;
	}
	
	private static final String SEARCH_MOVIE_TAG_SQL="select mid from tag where tagname=?";

	@Override
	public ArrayList<Movie> searchMovieByTags(Tag[] tags) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(SEARCH_MOVIE_TAG_SQL);	
		ArrayList<ArrayList<Integer>> aa=new ArrayList<ArrayList<Integer>>();
		
		for(Tag t:tags){
			ps.setString(1, t.getTagname());
			rs=ps.executeQuery();
			ArrayList<Integer> a=new ArrayList<Integer>();
			while (rs.next())
				a.add(rs.getInt("mid"));
			
			aa.add(a);
		}
		
		ArrayList<Integer> res=new ArrayList<Integer>();
		if(aa.size()==1)
			res=aa.get(0);
		else{
			for(int i=0;i<aa.get(0).size();i++){
				int flag=1;
				for(int j=1;j<aa.size();j++){
					if(isContain(aa.get(0).get(i), aa.get(j)))
						continue;
					else{
						flag=0;
						break;
					}
						
				}
				if(flag==1)
					res.add(aa.get(0).get(i));
			}
		}
		
		ArrayList<Movie> movies=new ArrayList<Movie>();
		String sql="select * from movie where mid=?";
		for(int i=0;i<res.size();i++){
			ps=conn.prepareStatement(sql);
			ps.setInt(1, res.get(i));
			rs=ps.executeQuery();
			if(rs.next()){
				Movie m=new Movie();
				m.setMid(rs.getInt("mid"));
				m.setMname(rs.getString("mname"));
				m.setAlias(rs.getString("alias"));
				m.setIntro(rs.getString("intro"));
				m.setImdbUrl(rs.getString("imdbUrl"));
				m.setLanguage(rs.getString("language"));
				m.setReleaseDate(rs.getString("releaseDate"));
				m.setDuration(rs.getInt("duration"));
				movies.add(m);
			}
				
		}
		
		return movies;
		
	}
	
	private boolean isContain(int a,ArrayList<Integer> b){
		return b.contains(a);
	}

	private static final String GET_ALL_MOVIE_TAG_SQL="select mid,tagname "
			+ "from tag where mid=?";
	
	@Override
	public ArrayList<Tag> getAllTag(Movie movie) throws SQLException {
		
		conn=getConnection();
		ps=conn.prepareStatement(GET_ALL_MOVIE_TAG_SQL);
		ps.setInt(1, movie.getMid());
		rs=ps.executeQuery();
		
		ArrayList<Tag> tags=new ArrayList<Tag>();
		while(rs.next()){
			Tag t=new Tag();
			t.setMid(rs.getInt("mid"));
			t.setTagname(rs.getString("tagname"));
			tags.add(t);
		}
		
		release(conn, ps, rs);
		return tags;
	}



}
