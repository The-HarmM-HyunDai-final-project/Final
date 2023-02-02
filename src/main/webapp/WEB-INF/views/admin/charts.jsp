<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>The harmM BackOffice</title>
<link
	href="${pageContext.request.contextPath}/resources/css/admin/styles.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/admin/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/admin/main">The harmM</a>
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-secondary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<a class="nav-link" href="/admin/member">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 회원관리
						</a> <a class="nav-link" href="/admin/showliveCreate">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 경매 및 채팅 관리
						</a> <a class="nav-link" href="/admin/charts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 구매 및 판매 관리
						</a> <a class="nav-link" href="/admin/product">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 상품관리
						</a>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">구매내역 및 판매내역</h1>
				<div class="row">
					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area me-1"></i> 구매내역
							</div>
							<div class="card-body">
								<canvas id="myAreaChart" width="100%" height="50"></canvas>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-pie me-1"></i> TOP 5 구매상품
							</div>
							<div class="card-body">
								<canvas id="myPieChart" width="100%" height="50"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area me-1"></i> 판매내역
							</div>
							<div class="card-body">
								<canvas id="myAreaChart2" width="100%" height="50"></canvas>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-pie me-1"></i> TOP 5 판매상품
							</div>
							<div class="card-body">
								<canvas id="myPieChart2" width="100%" height="50"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready(function(){ 
		getGraphBuy();
		getGraphSale();
		getPieChart1();
		getPieChart2();
	});
	
	function getPieChart1(){
	  	  console.log("getPieChart1()");
	      let timeList = [];
	   	  let countList = [];
	   
		   $.ajax({
		      url:"/admin/buyTop",
		      type:"get",
		      data:{sum_price:"${TopProduct.sum_price}",pname_k:"${TopProduct.pname_k}"},
		      dataType:"json",
		      success:function(data){
		         for (let i = 0; i<data.length;i++){                  
		            timeList.push(data[i].sum_price);    
		            countList.push(data[i].pname_k);                  
		            console.log(data[i]);
		         }
		         new Chart(document.getElementById("myPieChart"), {
		             type: 'pie',
		             data: {
		               labels: countList, // X축 
		               datasets: [{ 
		                   data: timeList, // 값
		                   //label: "방문자 수",
		                   backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#A349A4'],
		                 }],
		             },
		           }); //그래프
		      },
		      error:function(){
		         alert("실패");
		      }  
		   })     
	}
	
	function getPieChart2(){
	  	  console.log("getPieChart2()");
	      let timeList = [];
	   	  let countList = [];
	   
		   $.ajax({
		      url:"/admin/saleTop",
		      type:"get",
		      data:{sum_price:"${TopProduct.sum_price}",pname_k:"${TopProduct.pname_k}"},
		      dataType:"json",
		      success:function(data){
		         for (let i = 0; i<data.length;i++){                  
		            timeList.push(data[i].sum_price);    
		            countList.push(data[i].pname_k);                  
		            console.log(data[i]);
		         }
		         new Chart(document.getElementById("myPieChart2"), {
		             type: 'pie',
		             data: {
		               labels: countList, // X축 
		               datasets: [{ 
		                   data: timeList, // 값
		                   //label: "방문자 수",
		                   backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#A349A4'],
		                 }],
		             },
		           }); //그래프
		      },
		      error:function(){
		         alert("실패");
		      }  
		   })     
	}
	
	function getGraphBuy(){
     	  let timeList = [];
	  	  let buyList = [];
	  	  
	  	  $.ajax({
	  		  url:"/admin/buyToday",
	  		  type:"get",
	  		  data:{now:"${buyToday.now}",cnt:"${buyToday.price}"},
	  		  dataType:"json",
	  		  success:function(data){
	  			  for (let i = 0; i<data.length;i++){    				  
							timeList.push(data[i].now);    
							buyList.push(data[i].price);
							console.log(data[i]);
	  			  }
	  			  new Chart(document.getElementById("myAreaChart"), {
	  		    	  type: 'line',
	  		    	  data: {
	  		    	    labels: timeList, // X축 
	  		    	  	lineTension: 0.3,
		  		        backgroundColor: "rgba(2,117,216,0.2)",
		  		        borderColor: "rgba(2,117,216,1)",
		  		        pointRadius: 5,
		  		        pointBackgroundColor: "rgba(2,117,216,1)",
		  		        pointBorderColor: "rgba(255,255,255,0.8)",
		  		        pointHoverRadius: 5,
		  		        pointHoverBackgroundColor: "rgba(2,117,216,1)",
		  		        pointHitRadius: 50,
		  		        pointBorderWidth: 2,
	  		    	    datasets: [{ 
	  		    	        data: buyList, // 값
	  		    	        label: "구매금액",
	  		    	        borderColor: "#3e95cd",
	  		    	        fill: true
	  		    	      }
	  		    	    ]
	  		    	  },
	  		    	options: {
	  		    	    scales: {
	  		    	      xAxes: [{
	  		    	        time: {
	  		    	          unit: 'date'
	  		    	        },
	  		    	        gridLines: {
	  		    	          display: false
	  		    	        },
	  		    	        ticks: {
	  		    	          maxTicksLimit: 7
	  		    	        }
	  		    	      }],
	  		    	      yAxes: [{
	  		    	        gridLines: {
	  		    	          color: "rgba(0, 0, 0, .125)",
	  		    	        }
	  		    	      }],
	  		    	    },
	  		    	    legend: {
	  		    	      display: false
	  		    	    }
	  		    	  }
	  		    	}); //그래프
	  		  },
	  		  error:function(){
	  			  alert("실패");
	  		  }  
	  	  })
    }
	function getGraphSale(){
     	  let timeList = [];
	  	  let saleList = [];
	  	  
	  	  $.ajax({
	  		  url:"/admin/saleToday",
	  		  type:"get",
	  		  data:{now:"${saleToday.now}",cnt:"${saleToday.price}"},
	  		  dataType:"json",
	  		  success:function(data){
	  			  for (let i = 0; i<data.length;i++){    				  
							timeList.push(data[i].now);    
							saleList.push(data[i].price);
							console.log(data[i]);
	  			  }
	  			  new Chart(document.getElementById("myAreaChart2"), {
	  		    	  type: 'line',
	  		    	  data: {
	  		    		labels: timeList, // X축 
	  		    	  	lineTension: 0.3,
		  		        backgroundColor: "rgba(2,117,216,0.2)",
		  		        borderColor: "rgba(2,117,216,1)",
		  		        pointRadius: 5,
		  		        pointBackgroundColor: "rgba(2,117,216,1)",
		  		        pointBorderColor: "rgba(255,255,255,0.8)",
		  		        pointHoverRadius: 5,
		  		        pointHoverBackgroundColor: "rgba(2,117,216,1)",
		  		        pointHitRadius: 50,
		  		        pointBorderWidth: 2,
	  		    	    datasets: [{ 
	  		    	        data: saleList, // 값
	  		    	        label: "판매금액",
	  		    	        borderColor: "#3e95cd",
	  		    	        fill: true
	  		    	      }
	  		    	    ]
	  		    	  },
	  		    	options: {
	  		    	    scales: {
	  		    	      xAxes: [{
	  		    	        time: {
	  		    	          unit: 'date'
	  		    	        },
	  		    	        gridLines: {
	  		    	          display: false
	  		    	        },
	  		    	        ticks: {
	  		    	          maxTicksLimit: 7
	  		    	        }
	  		    	      }],
	  		    	      yAxes: [{
	  		    	        gridLines: {
	  		    	          color: "rgba(0, 0, 0, .125)",
	  		    	        }
	  		    	      }],
	  		    	    },
	  		    	    legend: {
	  		    	      display: false
	  		    	    }
	  		    	  }
	  		    	}); //그래프
	  		  },
	  		  error:function(){
	  			  alert("실패");
	  		  }  
		     		  
	  	  })  
    }
	</script>
</body>
</html>
