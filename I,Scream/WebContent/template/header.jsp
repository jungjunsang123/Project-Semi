<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
<nav class="navbar">
  <div class="container-fluid">
    	<div class="row">
    		<!-- 로고 -->
    		<div class="col-sm-3">
    			<a class="navbar-brand" href="${pageContext.request.contextPath }/front?command=home">HOME</a>
    		</div>
    		<!-- 검색창 start -->
    		<div class="col-sm-6">
	      			<form class="searchForm" action="/action_page.php">
					  <div class="input-group">
					    <input type="text" class="form-control" placeholder="Search">
					    <div class="input-group-btn">
					      <button class="btn btn-default" type="submit">
					        <i class="glyphicon glyphicon-search"></i>
					      </button>
					    </div>
					  </div>
					</form>
    		</div>
    		<!-- 검색창 end -->
   		</div>
  		</div>
 </nav>
 
 <div class="header__main">
            <div class="social">
        <a class="social__item social__item--twitter" href="https://twitter.com/iloveimg_com" rel="noopener" target="_blank" title="iLovePDF Twitter"></a>
        <a class="social__item social__item--facebook" href="https://www.facebook.com/iloveimgcom/" rel="noopener" target="_blank" title="iLovePDF Facebook"></a>
    </div>
        <div class="brand">
    <div class="brand__logo">
        <a href="/ko" title="iLoveIMG">
                <img src="/img/iloveimg.svg" alt="iLoveIMG">
        </a>
    </div>
</div>        <div class="header__nav">
                <div class="main-menu" id="menuBig">
        <ul class="nav">
            <li><a href="/ko/compress-image">이미지 압축</a></li>
            <li><a class="nav__item--active" href="/ko/resize-image">이미지 크기 조절</a></li>
            <li><a href="/ko/crop-image">이미지 잘라내기</a></li>
            <li><a href="/ko/convert-to-jpg">JPG로 변환</a></li>
            <li><a href="/ko/photo-editor">포토 에디터</a></li>
            <li class="dropdown">
                <span data-toggle="dropdown" data-hover="dropdown">
                    툴 더보기                    <i class="ico ico--down"></i>
                </span>
                <ul class="dropdown-menu mega">
                    <li><a href="/ko/jpg-to-image">JPG에서 변환</a></li>
                    <li><a href="/ko/meme-generator">밈 만들기</a></li>
                    <li><a href="/ko/watermark-image">워터마크 이미지</a></li>
                    <li><a href="/ko/rotate-image">이미지 회전</a></li>
                    <li><a href="/ko/html-to-image">HTML에서 이미지</a></li>
                </ul>
            </li>
            <li class="dropdown" id="menuSmall">
                    <span class="nav__icon"><i class="ico ico--tools"></i></span>
                    <span>모든 이미지 도구<i class="ico ico--down"></i></span>
                <ul>
                    <li><a href="/ko/compress-image"><i class="ico ico--compress"></i> 이미지 압축</a></li>
                    <li><a class="nav__item--active" href="/ko/resize-image"><i class="ico ico--resize"></i> 이미지 크기 조절</a></li>
                    <li><a href="/ko/crop-image"><i class="ico ico--crop"></i> 이미지 잘라내기</a></li>
                    <li><a href="/ko/convert-to-jpg"><i class="ico ico--tojpg"></i> JPG로 변환</a></li>
                    <li><a href="/ko/jpg-to-image"><i class="ico ico--fromjpg"></i> JPG에서 변환</a></li>
                    <li><a href="/ko/rotate-image"><i class="ico ico--rotate"></i> 이미지 회전</a></li>
                    <li><a href="/ko/watermark-image"><i class="ico ico--watermark"></i> 워터마크 이미지</a></li>
                    <li><a href="/ko/meme-generator"><i class="ico ico--meme"></i> 밈 만들기</a></li>
                    <li><a href="/ko/photo-editor"><i class="ico ico--edit"></i>포토 에디터</a></li>
                    <li><a href="/ko/html-to-image"><i class="ico ico--edit"></i>HTML에서 이미지</a></li>
                </ul>
            </li>
        </ul>
    </div>
            </div>
        <div class="top-menu">
    <ul class="nav">
                    <li class="nav__item nav__item--gray">
        <a href="/ko/login"><span>로그인</span></a>
    </li>
    <li class="nav__item nav__item--red">
        <a href="/ko/register">
            <i class="ico ico--user"></i>
            <span>가입하기</span></a>
    </li>

                    <li class="nav__item nav__item--sub">
            <i class="ico ico--hamburger"></i>
            <ul>
                <li><a href="/ko"><i class="ico ico--iloveimg"></i> 홈</a></li>

                <li class="nav__item--sub">
                    <a><i class="ico ico--product"></i> 제품</a>
                    <ul class="product__menu">
                        <li><a href="https://www.iloveimg.com/ko/features"><i class="ico ico--features"></i> 기능</a></li>
                        <li><a href="https://developer.iloveimg.com" target="_blank" rel="noopener"><i class="ico ico--developer"></i> API Rest</a></li>
                        <li><a href="https://wordpress.org/plugins/iloveimg/" rel="nofollow noopener" target="_blank"><i class="ico ico--wordpress"></i> Wordpress 플러그인</a></li>
                    </ul>
                </li>
                <li><a href="/ko/pricing"><i class="ico ico--pricing"></i> 가격</a></li>
                <li class="divider"></li>
                <li class="nav__item--sub"><a href="#"><i class="ico ico--lang"></i>언어</a>
                    <span class="lang__current">
    <i class="ico ico--lang"></i>
    한국어 <i class="ico ico--down"></i>
</span>
<ul class="lang__menu">
    <li><a href="/"> English</a></li>
                                    <li><a href="/es"> Español</a></li>
                                <li><a href="/fr"> Français</a></li>
                                <li><a href="/de"> Deutsch</a></li>
                                <li><a href="/it"> Italiano</a></li>
                                <li><a href="/pt"> Português</a></li>
                                <li><a href="/ja"> 日本語</a></li>
                                <li><a href="/ru"> Pусский</a></li>
                                <li><a class="active"><svg aria-hidden="true" width="12" height="12" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M435.848 83.466L172.804 346.51l-96.652-96.652c-4.686-4.686-12.284-4.686-16.971 0l-28.284 28.284c-4.686 4.686-4.686 12.284 0 16.971l133.421 133.421c4.686 4.686 12.284 4.686 16.971 0l299.813-299.813c4.686-4.686 4.686-12.284 0-16.971l-28.284-28.284c-4.686-4.686-12.284-4.686-16.97 0z" class=""></path></svg> 한국어</a></li>
                                <li><a href="/zh-cn"> 中文 (简体)</a></li>
                                <li><a href="/zh-tw"> 中文 (繁體)</a></li>
                                <li><a href="/ar"> العربية</a></li>
                                <li><a href="/bg"> Български</a></li>
                                <li><a href="/ca"> Català</a></li>
                                <li><a href="/nl"> Dutch</a></li>
                                <li><a href="/el"> Ελληνικά</a></li>
                                <li><a href="/hi"> हिन्दी</a></li>
                                <li><a href="/id"> Bahasa Indonesia</a></li>
                                <li><a href="/ms"> Bahasa Melayu</a></li>
                                <li><a href="/pl"> Polski</a></li>
                                <li><a href="/sv"> Svenska</a></li>
                                <li><a href="/th"> ภาษาไทย</a></li>
                                <li><a href="/tr"> Türkçe</a></li>
                                <li><a href="/uk"> Українська</a></li>
                                <li><a href="/vi"> Tiếng Việt</a></li>
            </ul>
                </li>
                <li class="nav__item--sub"><a><i class="ico ico--help"></i> 도움</a>
                    <ul>
                        <li><a href="/ko/help/faq"><i class="ico ico--faq"></i> 자주 묻는 질문</a></li>
                        <li><a href="/ko/help/documentation"><i class="ico ico--documentation"></i> 도구</a></li>
                        <li><a href="/ko/help/legal"><i class="ico ico--legal"></i> 법률 &amp; 개인 정보 보호</a></li>
                        <li><a href="/ko/help/about"><i class="ico ico--about"></i> 스토리</a></li>
                        <li><a href="/ko/contact"> <i class="ico ico--contact"></i> 문의</a></li>
                    </ul>
                </li>
                <li class="divider"></li>
                <li><a href="https://www.ilovepdf.com/ko"> <i class="ico ico--ilovepdf"></i> iLovePDF</a></li>

            </ul>
        </li>
        </ul>
</div>    </div>
 
 
 
   		<!-- 카테고리 start -->
<nav class="navbar">
  <div class="container-fluid">
    	<div class="row categorybar">
	    		<div class="collapse navbar-collapse">
 			      <ul class="nav navbar-nav">
		 			 <li>
		 			 	<a href="#" class="burger-custom collapsed" data-toggle="collapse" data-target="#main-navbar" aria-expanded="false">
      					<img src="${pageContext.request.contextPath}/image/Hamburger_icon.png"></a>
		 			 </li> 
			        <li><a href="#" class="nav-item nav-link">채용정보</a></li>
			        <li><a href="#" class="nav-item nav-link">인재정보</a></li>
			        <li><a href="#" class="nav-item nav-link">이용안내</a></li>
			      </ul>			      
			    </div>
			 </div>
		 </div>
		 <!-- 카테고리 end -->

    	</nav>
    	
  
