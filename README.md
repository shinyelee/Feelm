# 필름 Feelm

> 영화 커뮤니티 웹 프로젝트

![img](https://user-images.githubusercontent.com/68595933/112328623-dd270780-8cf9-11eb-9a97-b486ecd6bcf3.PNG)

## 시작

- 반응형 화면을 지원하는 JSP Model1 영화 커뮤니티 프로젝트입니다.
- [시연영상 바로가기][유튜브]

---

## 개발

### 기간

- 20.08.04.~20.09.05.

### 목표

- JSP 기초 이해하기.

### 사용

- HTML/CSS
- JavaScript
- Java 8
- jQuery 3.5
- Bootstrap 3
- MySQL 5.6
- Tomcat 8.5
- GitHub

---

## 기능

### 지도

- [KakaoMaps API][지도 api]를 이용해 위치 정보를 받아옵니다.

  ![map](https://user-images.githubusercontent.com/68595933/189836242-5b3aed24-a5b2-4b7b-aeba-35ffe9b14c4e.png)

```javascript
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=60ed69c2fa2726aa0155932a27f26fe1"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
		        center: new kakao.maps.LatLng(35.158473, 129.062079), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		var imageSrc = '../images/logo.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(15, 15)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(35.158473, 129.062079); // 마커가 표시될 위치입니다
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		  position: markerPosition,
		  image: markerImage // 마커이미지 설정 
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
		
		// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var content = '<div class="customoverlay">' +
		    '  <a href="https://map.kakao.com/link/map/11102560" target="_blank">' +
		    '    <span class="title">Moviehere</span>' +
		    '  </a>' +
		    '</div>';
		
		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new kakao.maps.LatLng(35.158473, 129.062079);  
		
		// 커스텀 오버레이를 생성합니다
		var customOverlay = new kakao.maps.CustomOverlay({
		    map: map,
		    position: position,
		    content: content,
		    yAnchor: 0 
		});
		</script>
    
<!-- html생략 -->
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    // 우편번호 찾기 화면을 넣을 element
	    var element_layer = document.getElementById('layer');
	
	    function closeDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_layer.style.display = 'none';
	    }
	
	    function sample2_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample2_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample2_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample2_postcode').value = data.zonecode;
	                document.getElementById("sample2_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample2_detailAddress").focus();
	
	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_layer.style.display = 'none';
	            },
	            width : '100%',
	            height : '100%',
	            maxSuggestItems : 5
	        }).embed(element_layer);
	
	        // iframe을 넣은 element를 보이게 한다.
	        element_layer.style.display = 'block';
	
	        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	        initLayerPosition();
	    }
	
	    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	    function initLayerPosition(){
	        var width = 300; //우편번호서비스가 들어갈 element의 width
	        var height = 400; //우편번호서비스가 들어갈 element의 height
	        var borderWidth = 5; //샘플에서 사용하는 border의 두께
	
	        // 위에서 선언한 값들을 실제 element에 넣는다.
	        element_layer.style.width = width + 'px';
	        element_layer.style.height = height + 'px';
	        element_layer.style.border = borderWidth + 'px solid';
	        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
	        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	    }
	</script>
```

### 주간 박스오피스 순위

- [영화진흥위원회 OPEN API][영화 api]를 이용해 주간 박스오피스 순위를 받아옵니다.

  ![box_office](https://user-images.githubusercontent.com/68595933/189843111-8d92988f-386f-4769-978d-6a756263a109.png)

```javascript
<!-- weekly.html -->
<script 
	src="https://code.jquery.com/jquery-3.5.1.js" 
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
	crossorigin="anonymous">
	</script>
	
	<script src="weekly.js"></script>
	<script>
	for(var i=0; i<weekly.length; i++) {
		$('tbody').append('<tr>');
		$('tbody').append('<td>'+weekly[i]['rank']+'</td>')
		$('tbody').append('<td>'+weekly[i]['rankOldAndNew']+'</td>')
		$('tbody').append('<td>'+weekly[i]['openDt']+'</td>')
		$('tbody').append('<td>'+weekly[i]['movieNm']+'</td>')
		$('tbody').append('<td>'+weekly[i]['audiCnt']+'</td>')
		$('tbody').append('</tr>');
	}
	</script>
  
// weekly.json
var weekly = [
	{"rnum":"1","rank":"1","rankInten":"0","rankOldAndNew":"OLD","movieCd":"20205144","movieNm":"미나리","openDt":"2021-03-03","salesAmt":"1236983170","salesShare":"31.5","salesInten":"6601770","salesChange":"0.5","salesAcc":"6384981890","audiCnt":"131774","audiInten":"1446","audiChange":"1.1","audiAcc":"702945","scrnCnt":"1012","showCnt":"9193"},
  // 이하 생략
]
```

### 인증

- 로그인/로그아웃
- [기능 이름][요약]를 이용해 ~를 받아옵니다.

  ![login_logout](https://user-images.githubusercontent.com/68595933/189851704-a27ed709-2e7a-4ee2-9b41-2593d75679f6.png)

```java

```

- 회원가입/메일인증(구글이메일 api)/회원등급
- [기능 이름][요약]를 이용해 ~를 받아옵니다.

  ![join](https://user-images.githubusercontent.com/68595933/189851810-55f3b5e0-57a0-4480-87f9-a54b39ae4fce.png)

```java

```

- 회원정보 수정(비밀번호, 전화번호)
- 회원탈퇴(비밀번호 재확인)
- [기능 이름][요약]를 이용해 ~를 받아옵니다.

  ![withdrawal](https://user-images.githubusercontent.com/68595933/189850244-ffb7f5ae-856b-4eec-bb2c-1f6c79c44e5a.PNG)

```java

```

### 게시판

- crud
- [기능 이름][요약]를 이용해 ~를 받아옵니다.

  ![review](https://user-images.githubusercontent.com/68595933/189850663-30281a18-c80c-438e-b194-e91e4bd276ea.PNG)

```java

```

- 공감/게시글 정렬/페이징
- [기능 이름][요약]를 이용해 ~를 받아옵니다.

  ![arrange](https://user-images.githubusercontent.com/68595933/189850775-ba4b6f65-5bd8-4fde-b65b-c285b6ef1581.PNG)

```java

```

- 카테고리별 필터링/검색
- [기능 이름][요약]를 이용해 ~를 받아옵니다.

  ![category](https://user-images.githubusercontent.com/68595933/189852394-3c6ea5d0-0788-48ad-b6a2-a4a91647fd37.png)

```java

```

- 신고(구글이메일 api)
- [기능 이름][요약]를 이용해 ~를 받아옵니다.

  ![report](https://user-images.githubusercontent.com/68595933/189850487-53a3d8d2-0b4d-4039-b8d1-55eae8c941c3.PNG)

```java

```

---

## 레퍼런스

- [참고 유튜브1 바로가기][참고1]
- [참고 유튜브2 바로가기][참고2]

<!-- 링크 -->

[유튜브]: https://www.youtube.com/playlist?list=PLu_M-qKXkbvNLg5dgwucHSp10Szb51ZE-
[지도 api]: https://apis.map.kakao.com/web/guide/
[영화 api]: https://www.kobis.or.kr/kobisopenapi/homepg/apiservice/searchServiceInfo.do

[참고1]: https://www.youtube.com/playlist?list=PLRx0vPvlEmdAZv_okJzox5wj2gG_fNh_6
[참고2]: https://www.youtube.com/playlist?list=PLRx0vPvlEmdAdWCQeUPnyMZ4PsW3dGuFB
