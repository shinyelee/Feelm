<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 등록된 리뷰 -->
<br>
<div class="container">
	<div class="row">
			<table class="table table-default" style="border: 1px solid #dddddd">
				<thead>
					<tr>
						<!-- 영화제목 -->
						<th colspan="10" style="text-align: center;">다만 악에서 구하소서</th>
						<!-- 별점 -->
						<th colspan="1" style="text-align: center;">
							<span style="color: red;">3 ★★★☆☆</span>
						</th>
						<%
						// if(userID != null && userID.equals(bbs.getUserID())) { // 접속한 userID가 빈 값이 아닌 로그인 상태인 동시에 작성자와 일치할 때
						%>
						<!-- 자기 글은 공감할 수 없도록 삭제 버튼 보이게 함
						<th colspan="1" style="text-align: center;">
							<button type="button" class="btn btn-default btn-xs"><a onclick="return confirm('게시글을 삭제합니다.')" href="reviewDeleteAction.jsp?reviewID=">삭제</a></button>
						</th> -->
						<%		
						// } else {
						%>
						<!-- 다른 사람 글은 공감할 수 있도록 공감 버튼 보이게 함 -->
						<th colspan="1" style="text-align: center;">
							<button type="button" class="btn btn-default btn-xs"><a onclick="return confirm('게시글에 공감합니다.')" href="reviewLikeAction.jsp?reviewID=">공감</a></button>
						</th>
						<%		
						// }
						%>
					</tr>
					<tr>
						<!-- 한줄감상, 작성자, 작성일 -->
						<td colspan="10" style="text-align: center;">신명난 카메라와 캐릭터, 언뜻언뜻 기시감.</td>
						<td colspan="1" style="text-align: center;">박평식</td>
						<td colspan="1" style="text-align: center;">20-08-05</td>
					</tr>
				</thead>
				<tbody>
					<tr> <!-- 장문감상 -->
						<td colspan="12" style="text-align: left;">신명난 카메라와 캐릭터, 언뜻언뜻 기시감. 신명난 카메라와 캐릭터, 언뜻언뜻 기시감. 신명난 카메라와 캐릭터, 언뜻언뜻 기시감. 신명난 카메라와 캐릭터, 언뜻언뜻 기시감. 신명난 카메라와 캐릭터, 언뜻언뜻 기시감. 신명난 카메라와 캐릭터, 언뜻언뜻 기시감.</td>
					</tr>
				</tbody>
		</table>
	</div>
</div>