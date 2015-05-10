package kr.or.kosta.user.dao;
import java.util.List;

import kr.or.kosta.user.domain.Article;


public interface ArticleDao {
public void add(Article article) throws Exception;
public List<Article> getArticleAllList(int pageNum) throws Exception;
public int getPage() throws Exception;
public List<Article> searchArticle(String searchType, String searchValue) throws Exception;
public Article getArticleInfo(int getArticleId) throws Exception;
public void reArticleAdd(Article article) throws Exception;

}
