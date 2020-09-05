<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | movieList</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/custom.css">
	<style type="text/css">
		a, a:hover {
			color: #333333;
		}
	</style>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />

	<!-- 탭 -->
	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#poster">포스터</a></li>
			<li><a data-toggle="tab" href="#trailer">트레일러</a></li>
		</ul>
		<div class="tab-content">
	  		<div id="poster" class="tab-pane fade in active">
		    	<h3>포스터</h3>
		   		<p>현재 상영중인 영화입니다(예매순).</p>
		   		<div class="container">
					<div class="row">
						<div class="col-md-3">
							<img src="../images/movie_image_TENET.jpg" class="img-thumbnail">
							<h5>테넷&nbsp;<small>&nbsp;(61.43%)</small></h5>
						</div>
						<div class="col-md-3">
							<img src="../images/movie_image_Oh! My Gran.jpg" class="img-thumbnail">
							<h5>오! 문희&nbsp;<small>&nbsp;(16.25%)</small></h5>
						</div>
						<div class="col-md-3">
							<img src="../images/movie_image_DELIVER US FROM EVIL.jpg" class="img-thumbnail">
							<h5>다만 악에서 구하소서&nbsp;<small>&nbsp;(10.93%)</small></h5>
						</div>
						<div class="col-md-3">
							<img src="../images/movie_image_OK! MADAM.jpg" class="img-thumbnail">
							<h5>오케이 마담&nbsp;<small>&nbsp;(16.25%)</small></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<img src="../images/movie_image_Jjanggu.jpg" class="img-thumbnail">
							<h5>극장판 짱구는 못말려: 신혼여행 허리케인~사라진 아빠&nbsp;<small>&nbsp;(1.98%)</small></h5>
						</div>
						<div class="col-md-3">
							<img src="../images/movie_image_Ghost of war.jpg" class="img-thumbnail">
							<h5>고스트 오브 워&nbsp;<small>&nbsp;(0.88%)</small></h5>
						</div>
						<div class="col-md-3">
							<img src="../images/movie_image_Moving On.jpg" class="img-thumbnail">
							<h5>남매의 여름밤&nbsp;<small>&nbsp;(0.68%)</small></h5>
						</div>
						<div class="col-md-3">
							<img src="../images/movie_image_FUKUOKA.jpg" class="img-thumbnail">
							<h5>후쿠오카&nbsp;<small>&nbsp;(0.36%)</small></h5>
						</div>
					</div>
				</div><br>
			</div>
			<div id="trailer" class="tab-pane fade">
				<h3>트레일러</h3>
				<p>현재 상영중인 영화입니다(예매순).</p>
				<div class="container">
					<div class="row" id="section1">
						<div class="col-md-8">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item" src="https://youtube.com/embed/7oKAPbnl7mQ" allowfullscreen="" height="360" width="640" frameborder="0"></iframe>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel panel-default">
				 				<div class="panel-heading">
				 					<h5>테넷&nbsp;</h5><small>&nbsp;느와르/액션 | 150분 | 20.08.26</small>
				 				</div>
				  				<div class="panel-body">
				  					<strong>소개</strong><br>시간의 흐름을 뒤집는 인버전을 통해 현재와 미래를 오가며 세상을 파괴하려는 사토르(케네스 브래너)를 막기 위해 투입된 작전의 주도자(존 데이비드 워싱턴). 인버전에 대한 정보를 가진 닐(로버트 패틴슨)과 미술품 감정사이자 사토르에 대한 복수심이 가득한 그의 아내 캣(엘리자베스 데비키)과 협력해 미래의 공격에 맞서 제3차 세계대전을 막아야 한다!
				  				</div>
							</div>
						</div>
					</div>
				</div><br>
				<div class="container">
					<div class="row" id="section2">
						<div class="col-md-8">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item" src="https://youtube.com/embed/tecLzQwIoMI" allowfullscreen="" height="360" width="640" frameborder="0"></iframe>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel panel-default">
				 				<div class="panel-heading">
				 					<h5>오! 문희&nbsp;</h5><small>&nbsp;가족/코미디 | 109분 | 20.09.02</small>
				 				</div>
				  				<div class="panel-body">
				  					<strong>소개</strong><br>평화로운 금산 마을. 불같은 성격에 가족 사랑도 뜨거운 ‘두원’(이희준)에게 하나뿐인 딸 ‘보미’가 뺑소니 사고를 당했다는 청천벽력 같은 소식이 전해진다. 게다가 현장의 유일한 목격자는 기억이 깜빡깜빡하는 엄니 ‘문희’(나문희)와 왈왈 짖기만 하는 개 ‘앵자’뿐. 의식 불명 상태로 병원에 있는 ‘보미’. 경찰 수사에 진전이 없자 ‘두원’의 속은 점점 타들어간다. 하지만 예기치 못한 순간 엄니 ‘문희’가 뜻밖의 단서를 기억해내고 ‘두원’은 엄니와 함께 논두렁을 가르며 직접 뺑소니범을 찾아 나서기 시작하는데! 아무도 못 잡으면, 우리가 직접 잡는다!
			 	  				</div>
							</div>
						</div>
					</div>
				</div><br>
				<div class="container">
					<div class="row" id="section3">
						<div class="col-md-8">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item" src="https://youtube.com/embed/919GruRSZzE" allowfullscreen="" height="360" width="640" frameborder="0"></iframe>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel panel-default">
				 				<div class="panel-heading">
				 					<h5>다만 악에서 구하소서&nbsp;</h5><small>&nbsp;느와르/액션 | 108분 | 20.08.05</small>
				 				</div>
				  				<div class="panel-body">
				  					<strong>소개</strong><br>태국에서 충격적인 납치사건이 발생하고 마지막 청부살인 미션을 끝낸 암살자 인남(황정민)은 그것이 자신과 관계된 것임을 알게 된다. 인남은 곧바로 태국으로 향하고, 조력자 유이(박정민)를 만나 사건을 쫓기 시작한다. 한편, 자신의 형제가 인남에게 암살당한 것을 알게 된 레이(이정재). 무자비한 복수를 계획한 레이는 인남을 추격하기 위해 태국으로 향하는데... 처절한 암살자 VS 무자비한 추격자 멈출 수 없는 두 남자의 지독한 추격이 시작된다!
				  				</div>
							</div>
						</div>
					</div>
				</div><br>
				<div class="container">
					<div class="row" id="section4">
						<div class="col-md-8">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item" src="https://youtube.com/embed/p_GIIhwxS1I" allowfullscreen="" height="360" width="640" frameborder="0"></iframe>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel panel-default">
				 				<div class="panel-heading">
				 					<h5>오케이 마담&nbsp;</h5><small>&nbsp;가족/코미디 | 100분 | 20.08.12</small>
				 				</div>
				  				<div class="panel-body">
				  					<strong>소개</strong><br>극강의 쫄깃함으로 빠른 완판을 기록하는 꽈배기 맛집 사장 '미영'은 컴퓨터 수리 전문가 '석환'의 남다른 외조로 하와이 여행에 당첨되고, 난생처음 해외 여행을 떠나게 된다. 하지만 비밀 요원을 쫓는 테러리스트들도 같은 비행기에 오르고 꿈만 같았던 여행은 아수라장이 된다. 난데없는 비행기 납치 사건의 유일한 해결사가 되어버린 부부. 평범했던 과거는 접어두고, 숨겨왔던 내공을 펼치며 인질이 된 승객을 구하기 시작한다! 휴가 끝 ;; 작전 시작 ^^ 구하자 비행기! 가자 하와이로!
				  				</div>
							</div>
						</div>
					</div>
				</div><br>
				<div class="container">
					<div class="row" id="section5">
						<div class="col-md-8">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item" src="https://youtube.com/embed/u3SHFFvh64U" allowfullscreen="" height="360" width="640" frameborder="0"></iframe>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel panel-default">
				 				<div class="panel-heading">
				 					<h5>극장판 짱구는 못말려: 신혼여행 허리케인~사라진 아빠&nbsp;</h5><small>&nbsp;애니메이션 | 100분 | 20.08.20</small>
				 				</div>
				  				<div class="panel-body">
				  					<strong>소개</strong><br>아름다운 호주의 한 섬으로 신혼여행을 떠난 짱구네 가족. 즐거운 시간도 잠시, 수수께끼 원주민 가면족에게 사로잡혀 아빠가 사라진다. 이 섬에는 50년에 한 번 엄청난 보물을 얻을 수 있다는 전설이 있는데, 그 보물을 여는 열쇠가 바로 아빠라고? 여기에 보물을 노리는 트레저 헌터들까지 합세해 치열한 아빠 쟁탈전이 벌어지는데...! 위기에 처한 짱구네 가족은 무사히 아빠를 되찾을 수 있을까?
				  				</div>
							</div>
						</div>
					</div>
				</div><br>
				<div class="container">
					<div class="row" id="section6">
						<div class="col-md-8">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item" src="https://youtube.com/embed/1rYWpSdkWEA" allowfullscreen="" height="360" width="640" frameborder="0"></iframe>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel panel-default">
				 				<div class="panel-heading">
				 					<h5>고스트 오브 워&nbsp;</h5><small>&nbsp;스릴러/공포 | 94분 | 20.09.02</small>
				 				</div>
				  				<div class="panel-body">
				  					<strong>소개</strong><br>제2차 세계 대전 종전을 앞둔 1944년, 미군 ‘크리스’와 4명의 부대원들은 나치 점령 프랑스를 지키기 위해 한때 나치 최고 사령부가 점령했던 한 저택에 도착한다. 황급히 자리를 떠나는 교대 부대를 지켜보던 이들에게 이내 정체를 알 수 없는 소리와 함께 의문의 사건들이 시작되고, 두려움에 저택을 떠나려 하지만 벗어날 수 없음을 직감하며 결국 저택에 다시 돌아오게 되는데…
				  				</div>
							</div>
						</div>
					</div>
				</div><br>
				<div class="container">
					<div class="row" id="section7">
						<div class="col-md-8">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item" src="https://youtube.com/embed/J20a-ws8wE0" allowfullscreen="" height="360" width="640" frameborder="0"></iframe>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel panel-default">
				 				<div class="panel-heading">
				 					<h5>남매의 여름밤&nbsp;</h5><small>&nbsp;가족/코미디 | 104분 | 20.08.20</small>
				 				</div>
				  				<div class="panel-body">
				  					<strong>소개</strong><br>방학 동안, 아빠와 함께 할아버지 집에서 지내게 된 남매 옥주와 동주, 그렇게 오래된 2층 양옥집에서의 여름이 시작되고 한동안 못 만났던 고모까지 합세하면서 기억에 남을 온 가족의 이야기가 펼쳐진다.
				  				</div>
							</div>
						</div>
					</div>
				</div><br>
				<div class="container">
					<div class="row" id="section8">
						<div class="col-md-8">
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item" src="https://youtube.com/embed/HpDPuNVG1no" allowfullscreen="" height="360" width="640" frameborder="0"></iframe>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel panel-default">
				 				<div class="panel-heading">
				 					<h5>후쿠오카&nbsp;</h5><small>&nbsp;드라마/멜로 | 85분 | 20.08.27</small>
				 				</div>
				  				<div class="panel-body">
				  					<strong>소개</strong><br>책방 단골 ‘소담’ 때문에 불쑥 후쿠오카에 도착한 ‘제문’은 그녀와 함께 작은 술집 ‘들국화’를 찾는다. 그곳은 28년 전 첫사랑 ‘순이’를 동시에 사랑한 ‘해효’의 가게다. 순이가 좋아하던 책방의 주인으로 사는 제문과 순이의 고향 후쿠오카에서 술집을 운영하는 해효에게 “둘이 똑같아”라고 말하는 ‘소담’. 어울리지 않을 듯 어울리는 세 사람의 3일 낮밤 기묘한 여행이 시작된다!
				  				</div>
							</div>
						</div>
					</div>
				</div><br>
			</div>
		</div>
	</div>
	
<div class="container">
	<div id="disqus_thread"></div>
		<script>
		/**
		*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
		*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
		/*
		var disqus_config = function () {
		this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
		this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
		};
		*/
		(function() { // DON'T EDIT BELOW THIS LINE
		var d = document, s = d.createElement('script');
		s.src = 'https://moviehere.disqus.com/embed.js';
		s.setAttribute('data-timestamp', +new Date());
		(d.head || d.body).appendChild(s);
		})();
		</script>
	<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
</div><br>

<!-- 푸터 -->
<jsp:include page="../inc/footer.jsp" flush="false" />
	<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="../js/popper.min.js"></script>
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>