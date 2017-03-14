<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 

<style>
	h3{ color:red; }
	p ,h4{ color:black}
</style>
<table>
  	<tr>
    	<td>
			<img src="${movie.getBannerUrl()}" width="150" height="200" alt="No Movie Image" id="movie_poster"/>
		</td>
		<td>

			<a  href="MovieInfo?MovieId=${movie.getMovieID()}"  data-placement="right" title="Title:${movie.getTitle()}&#013;Year:${movie.getYear()}" >  <h3>${movie.getTitle()}</h3></a> &nbsp; &nbsp;<br> 
			<hr>
	
			<h4>Year Released:  &nbsp; &nbsp;<em>${movie.getYear()}</em></h4><br>
			<h4>Director:  &nbsp; &nbsp;<em>${movie.getDirector()}</em></h4><br>
			<h4>Stars:  &nbsp; &nbsp;
				<c:forEach items="${stars}" var="star">
					<a href="StarInfo?id=${star.getId()}"><h4><em>${star.getFirst_name()} ${star.getLast_name()}</em></h4></a>, 
				</c:forEach>
				<br>
			<h4>Genres:  &nbsp; &nbsp;
				<c:forEach items="${genres}" var="genre">
					 <h4><em>${genre.getName() }</em>,
				</c:forEach>
			<br><br><br>
			 <a href="ShoppingCartServlet?title=${movie.getTitle()}&year=${movie.getYear()}" class="btn btn-success">  Add to Cart </a>	<br>
			<br><br><br>
			

    	</td>
	</tr>
</table>




