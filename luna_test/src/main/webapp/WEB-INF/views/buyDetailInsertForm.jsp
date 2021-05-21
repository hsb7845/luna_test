<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<!-- <link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/> -->
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

<style type="text/css">
	@font-face {
	    font-family: 'Gyeonggi_Tittle_OTF_FontInstaller';
	    font-weight: normal;
	    font-style: normal;
	}
	body,button,input{
		font-family: 'Gyeonggi_Tittle_OTF_FontInstaller';
		font-weight: bold;
	}
	.cls1 {
	    font-size: 40px;
	    text-align: center;
	}
	
	.detail {
		text-align: center;
	}

	
/*--------------------------------------------------------------5.0 Forms--------------------------------------------------------------*/
button,input,select,textarea {
	font-size:100%;
	/* Corrects font size not being inherited in all browsers */
	margin:0;
	/* Addresses margins set differently in IE6/7,F3/4,S5,Chrome */
	vertical-align:baseline;
	/* Improves appearance and consistency in all browsers */
}
button,input[type="button"],input[type="reset"],input[type="submit"] {
	border:1px solid #ccc;
	border-radius:0px;
	background:#ccc;
	color:#fff;
	cursor:pointer;
	/* Improves usability and consistency of cursor style between image-type 'input' and others */
	-webkit-appearance:button;
	/* Corrects inability to style clickable 'input' types in iOS */
	padding:3px 15px;
}
button:hover,input[type="button"]:hover,input[type="reset"]:hover,input[type="submit"]:hover {
	opacity:0.6;
}
input[type="checkbox"],input[type="radio"] {
	padding: 0;
	/* Addresses excess padding in IE8/9 */
}
input[type="search"] {
	-webkit-appearance:textfield;
	/* Addresses appearance set to searchfield in S5,Chrome */
	-webkit-box-sizing:content-box;
	/* Addresses box sizing set to border-box in S5,Chrome (include -moz to future-proof) */
	-moz-box-sizing:content-box;
	box-sizing:content-box;
}
input[type="search"]::-webkit-search-decoration {
	/* Corrects inner padding displayed oddly in S5,Chrome on OSX */
	-webkit-appearance:none;
}
button::-moz-focus-inner,input::-moz-focus-inner {
	/* Corrects inner padding and border displayed oddly in FF3/4 www.sitepen.com/blog/2008/05/14/the-devils-in-the-details-fixing-dojos-toolbar-buttons/ */
	border:0;
	padding:0;
}
input[type="text"],input[type="email"],input[type="url"],input[type="password"],input[type="search"],textarea {
	border:1px solid #ccc;
	border-radius:0px;
	color:#666;
}
input[type="text"]:focus,input[type="email"]:focus,input[type="url"]:focus,input[type="password"]:focus,input[type="search"]:focus,textarea:focus {
	color:#111;
}
input[type="text"],input[type="email"],input[type="url"],input[type="password"],input[type="search"],input[type="tel"] {
	padding:6px;
	border: 1px solid #ccc;
}
textarea {
	overflow:auto;
	/* Removes default vertical scrollbar in IE6/7/8/9 */
	padding:5px;
	vertical-align:top;
	/* Improves readability and alignment in all browsers */
	width:98%;
}

/*--------------------------------------------------------------6.0 Header--------------------------------------------------------------*/
html {
	border:12px solid #111;
}
.site-header {
	padding-top:2em;
	padding-bottom:1em;
}
.header-image {
	margin-top:1em;
	text-align:center;
	margin-bottom: 2em;
}
/*--------------------------------------------------------------6.1 Links--------------------------------------------------------------*/
a {
	color:inherit;
	text-decoration:none;
	-webkit-transition:all 0.2s ease-in-out;
	-moz-transition:all 0.2s ease-in-out;
	-o-transition:all 0.2s ease-in-out;
	transition:all 0.2s ease-in-out;
}
a:visited {
	color:#666666;
}
a:hover {
	color:#ccc;
	text-decoration:none;
	-webkit-transition:all 0.2s ease-in-out;
	-moz-transition:all 0.2s ease-in-out;
	-o-transition:all 0.2s ease-in-out;
	transition:all 0.2s ease-in-out;
}
a:active,a:focus {
	text-decoration: none;
}

/*--------------------------------------------------------------17.0 Print--------------------------------------------------------------*/
@media print {
	body {
			background:none !important;
		/* Brute force since user agents all print differently. */
		color:#2b2b2b;
			font-size:12pt;
	}
	.hentry,.site-content .entry-header,.site-content .entry-content,.site-content .entry-summary,.site-content .entry-meta,.page-content,.archive-header,.page-header {
			max-width:100%;
	}
	.edit-link,.page-links,.widget-area,.more-link,.site-footer,.smoothup,#social-box,.nav-links,.comments-area {
			display:none;
	}
	.site-title a,.entry-meta,.entry-meta a {
			color:#2b2b2b !important;
	}
	.entry-content a,.entry-summary a,.page-content a,.comment-content a {
			text-decoration:none;
	}
	.site-header,.entry-thumbnail,.site-content .entry-header,.site-footerr {
			background:transparent;
	}
	.site-title {
			float:none;
			font-size:19pt;
	}
	.content-area {
			padding-top:0;
	}
	.entry-thumbnail img {
			margin:0 10px 24px;
	}
	.archive-title,.page-title {
			margin: 0 10px 48px;
	}
}
/* Masonry */
@media (min-width:480px) {
	.bloggrid article {
		width:46%;
		margin-right:4%;
	}
	.bloggrid article:nth-child(2n+2) {
		margin-right:0;
	}
}
.bloggrid article.hentry,.single-portfolio .hentry {
	margin-bottom:0;
}
.bloggrid .entry-footer {
	padding-top:0;
}
@media (min-width:480px) {
	.portfoliogrid {
		margin-left:-1.2%;
		margin-right:-1.2%;
	}
	.portfoliogrid article {
		width:30.93%;
		margin-left:1.2%;
		margin-right:1.2%;
	}
}
.page-template-template-portfolio .grid .entry-thumbnail img {
	width:100%;
	transition:all 0.4s;
}
.page-template-template-portfolio .grid .entry-thumbnail img:hover {
	opacity:0.8;
	transition:all 0.4s;
}
.portfoliogrid .entry-thumbnail,.single-portfolio .entry-thumbnail {
	padding-top:0;
}
.portfoliogrid .entry-title {
	font-size:14px;
	color:#111;
	font-weight:400;
}
.portfoliogrid article.hentry {
	margin-bottom:30px;
}
a.portfoliotype {
	text-decoration:none;
	margin-right:5px;
	font-style:italic;
}
a.portfoliotype:after {
	content:'/';
	margin-left:5px;
}
a.portfoliotype:last-child:after {
	content:none;
	margin-right: 0;
}
/* WooCommerce */
.woocommerce .woocommerce-ordering select {
	padding:5px;
}
.woocommerce a.button {
	background-color:#f4f5f6;
	color:#333;
	border:1px solid rgba(0,0,0,0.1);
	font-size:11px;
	text-transform:uppercase;
	border-radius:0;
	padding:10px;
}
.woocommerce nav.woocommerce-pagination ul li span,.woocommerce nav.woocommerce-pagination ul li a {
	padding:8px 12px;
}
.woocommerce span.onsale {
	min-height:50px;
	min-width:50px;
	padding:.30px;
	line-height:50px;
	font-weight:400;
	background-color:#ACE096;
}
.woocommerce div.product .woocommerce-tabs .panel h2,.related.products h2,.woocommerce #reviews h3,.cart_totals h2,.upsells.products h2 {
	font-weight:400;
	font-size:17px;
	margin-top:0;
}
.woocommerce form h3,.woocommerce-account h2,.woocommerce-account h3 {
	font-size:17px;
	font-weight:400;
}
.woocommerce div.product .woocommerce-tabs ul.tabs li {
	background:#f4f5f6;
}
.woocommerce #reviews #comments ol.commentlist li .comment-text,.woocommerce #respond input#submit,.woocommerce a.button,.woocommerce button.button,.woocommerce input.button {
	border-radius:0;
}
.woocommerce #respond input#submit.alt,.woocommerce a.button.alt,.woocommerce button.button.alt,.woocommerce input.button.alt {
	background-color:#222;
}
.woocommerce #respond input#submit.alt:hover,.woocommerce a.button.alt:hover,.woocommerce button.button.alt:hover,.woocommerce input.button.alt:hover {
	background-color:#000;
}
.woocommerce div.product form.cart,.woocommerce div.product p.cart {
	margin-bottom:2em;
	margin-top:2em;
}
.woocommerce div.product .woocommerce-tabs ul.tabs li {
	text-transform:uppercase;
	font-size:12px;
}
.woocommerce div.product .woocommerce-tabs ul.tabs li:before {
	left:-3px;
	border-width:0;
	box-shadow:none;
}
.woocommerce div.product .woocommerce-tabs ul.tabs li,.woocommerce table.shop_table,#add_payment_method #payment,.woocommerce-checkout #payment,.select2-drop.select2-drop-above,.select2-container .select2-choice {
	border-radius:0;
}
.woocommerce div.product .woocommerce-tabs ul.tabs li:after {
	border-bottom-left-radius:0;
	border-width:0;
	box-shadow:none;
}
.woocommerce div.product .woocommerce-tabs ul.tabs li:after,.woocommerce div.product .woocommerce-tabs ul.tabs li:before {
	width:0;
}
.posted_in a {
	text-decoration:none;
	font-style:italic;
}
.posted_in a:before {
	content:'#';
}
.woocommerce div.product form.cart .variations label {
	text-transform:capitalize;
}
.woocommerce div.product form.cart .variations select {
	min-width:55%;
	padding:5px;
}
.woocommerce #reviews #comments ol.commentlist li img.avatar {
	width:42px;
	height:auto;
	border:0;
	padding:0;
}
.woocommerce nav.woocommerce-pagination {
	margin-bottom:30px;
}
.woocommerce div.product p.price,.woocommerce div.product span.price {
	font-size:14px;
}
.woocommerce #coupon_code {
	min-width:150px;
}
.woocommerce div.product form.cart .button {
	vertical-align:middle;
	float:left;
	text-transform:uppercase;
	letter-spacing:1px;
	font-size:11px;
	min-height:31px;
}
.woocommerce ul.products li.product {
	transition:all 0.3s;
}
.woocommerce ul.products li.product:hover {
	border:1px solid #eee;
	padding:20px;
	transition:all 0.3s;
}
.woocommerce ul.products li.product h3 {
	font-size:1.1em;
	font-weight:400;
}
.woocommerce form.login, .woocommerce form.register {
	padding: 20px;
	margin: 1em 0;
	border-radius: 0px;
	max-width:480px;
}
.wpcmsdev-button {
	border:0 !Important;
	border-radius:0 !Important;
	background-image:none !Important;
}
.wpcmsdev-accordion .accordion-item-title a,.wpcmsdev-tabs .headings a,.wpcmsdev-toggle .toggle-title a {
	background-image:none !Important;
}
.wpcmsdev-accordion,.wpcmsdev-tabs .headings a:first-child,.wpcmsdev-tabs .headings a:last-child,.wpcmsdev-toggle {
	border-radius:0 !Important;
}
h3#reply-title,.comments-title {
	font-weight:400;
	margin-top:0;
	font-size:16px;
	text-transform:uppercase;
}
form.comment-form {
	margin-bottom:30px;
}
.wpcmsdev-columns {
	margin-left:-15px;
	margin-right:-15px;
}
/* CUSTOM STYLE */
body { font-family: 'Roboto'; }
h1, h2, h3, h4, h5, h6 { font-family: 'Oswald'; }
.site-title { font-family: 'Herr Von Muellerhoff'; }
.site-description { font-family: 'Quattrocento Sans'; }
.entry-title { font-family: 'Oswald'; }
.main-navigation { font-family: 'Oswald'; }
.widget-title { font-family: 'Oswald' !important; }
body {
	font-size: 14px;
}
h1,
h2,
h3,
h4,
h5,
h6 {
	font-style: normal;
	font-weight: 700;
	letter-spacing: 0px;
	text-align: left;
	text-transform: none;
}
h1 { font-size: 36px; }
h2 { font-size: 30px; }
h3 { font-size: 24px; }
h4 { font-size: 18px; }
h5 { font-size: 14px; }
h6 { font-size: 12px; }
.site-title {
	font-size: 60px;
	font-style: normal;
	font-weight: 300;
	letter-spacing: 2px;
	text-align: center;
	text-transform: none;
}
.site-description {
	font-size: 14px;
	font-style: italic;
	font-weight: 300;
	letter-spacing: 0px;
	text-align: center;
	text-transform: none;
}
.entry-title {
	font-size: 20px;
	font-style: normal;
	font-weight: 700;
	letter-spacing: 1px;
	text-align: left;
	text-transform: uppercase;
}
.entry-meta,
.cat-links,
.tags-links,
.comments-link,
.edit-link {
	font-size: 13px;
	font-style: italic;
	font-weight: 300;
	letter-spacing: 0px;
	text-align: left;
	text-transform: none;
}
.main-navigation {
	font-size: 14px;
	font-style: normal;
	font-weight: 700;
	letter-spacing: 1px;
	text-transform: uppercase;
}
.widget-title {
	font-size: 14px;
	font-style: normal;
	font-weight: 700;
	letter-spacing: 1px;
	text-align: left;
	text-transform: uppercase;
}
body,
button,
input,
select,
textarea {
	color: #888888;
}
h1, h2, h3, h4, h5, h6 {
	color: #222222;
}
.entry-title, .entry-title a {
	color: #222222;
}
.main-navigation a {
	color: #222222 !important;
}
@media screen and (max-width: 1023px) {
	button.menu-toggle {
		color: #222222;
	}
}
.widget-title {
	color: #222222;
}
.site-title a, .site-description {
	color: #222222;
}
#comments label, #review_form label {
	min-width: 60px;
    display: inline-block;
}
.done {
	background: #9CCA17;
    color: #fff;
    padding: 10px;
	margin-top:15px;
	text-align:center;
	display: none;
}
.error input, input.error, .error textarea, textarea.error {
    background-color: #ffffff;
    border: 1px solid orangered !Important;
    -webkit-transition: border linear 0.2s,box-shadow linear 0.2s;
    -moz-transition: border linear 0.2s,box-shadow linear 0.2s;
    -o-transition: border linear 0.2s,box-shadow linear 0.2s;
    transition: border linear 0.2s,box-shadow linear 0.2s;
}



</style>
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<!-- 	<h1>구매 추가</h1> -->
	<p class="cls1">구매 추가</p> 
	<form method="post" action="buyDetailInsert.do">
	<table class="detail">
		<tr>
			<th scope="row">상품번호</th>
			<td><input type="text" name="pnum"></td>
		</tr>
		<tr>
			<th scope="row">수량</th>
			<td><input type="text" name="pcount"></td>
		</tr>
		<tr>
			<th scope="row">구매번호</th>
			<td><input type="text" name="bseq"></td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="submit" value="작성">
				<input type="button" value="뒤로 가기" onClick="location.href='http://localhost:8888/board/buydetail.do'">
			</td>
		</tr>
		<%@ include file="footer.jsp" %>
	</table>
	</form>
</body>
</html>