<%@ page language="java" pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="row" style="width: 80%">
		<div class="col-1"></div>
		<div class="col">
			<table class="table table-bordered">
				<tbody class=" align-middle">
					<tr>
						<th scope="row" class="table-dark text-light">아이디</th>
						<td colspan="3">
							<div class="form-group row align-items-center">
								<div class="col-4 w-25">
									<input class="form-control" type="text">
								</div>
								<div class="col">
									<span class="d-inline"><a href="#">아이디 중복 체크</a></span>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<th scope="row" class="table-dark text-light">비밀번호</th>
						<td>
							<div class="row">
								<div class="col">
									<input class="form-control w-50" type="password">
								</div>
							</div>


							<p class="text-primary pt-3">*알파벳, 소문자, 숫자 포함 8자 이상 30자 이하</p>
						</td>
						<td class="table-dark text-light">비밀번호 확인</td>
						<td>
							<div class="">
								<input class="form-control" type="password">
							</div>
						</td>
					</tr>

					<tr>
						<th scope="row" class="table-dark text-light">이름</th>
						<td colspan="3">
							<div class="form-group row align-items-center">
								<div class="col-4 w-25">
									<input class="form-control" type="text">
								</div>
								<div class="col"></div>
							</div>
						</td>
					</tr>

					<tr>
						<th scope="row" class="table-dark text-light">이메일</th>
						<td colspan="3">
							<div class="row">
								<div class="col">
									<div class="d-flex justify-content-start align-items-center">
										<input class="form-control" type="text"> <span
											class="px-1">@</span> <input class="form-control" type="text">
									</div>
								</div>
								<div class="col align-self-center">
									<div class="d-flex justify-content-start">
										<span class="d-inline"><a href="#">중복 체크</a></span>
									</div>
								</div>
							</div>
							<div class="col-2 align-self-center py-3">
								<div class="d-flex justify-content-start">
									<input class="form-check-input" type="checkbox" value="">
									<label class="form-check-label px-3" for=""> 이메일 수신 동의
									</label>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<th scope="row" class="table-dark text-light">주소</th>
						<td colspan="3">
							<div class="col"></div>
							<div class="d-flex justify-content-start align-items-center">
								<input class="form-control w-25" type="text"> <span
									class="d-inline px-3"><a href="#">우편번호 찾기</a></span> <input
									class="form-check-input" type="checkbox" value=""> <label
									class="form-check-label px-3" for="flexCheckDefault">
									해외 </label>
							</div>
							<div class="w-100"></div>
							<div class="row pt-3">
								<div class="col-5">
									<input class="form-control" type="text">
								</div>
								<div class="col-5">
									<input class="form-control" type="text">
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<th scope="row" class="table-dark text-light">전화번호</th>
						<td colspan="3">
							<div class="row">
								<div class="col-7">
									<div class="d-flex justify-content-start align-items-center">
										<select class="form-select w-25"
											aria-label="Default select example">
											<option selected>선택</option>
											<option value="1">010</option>
											<option value="2">011</option>
											<option value="3"></option>
										</select>
										<p class="px-3">-</p>
										<input class="form-control w-50" type="text">
										<p class="px-3">-</p>
										<input class="form-control w-50" type="text">
									</div>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<th scope="row" class="table-dark text-light">휴대전화</th>
						<td colspan="3">
							<div class="row">
								<div class="col-7">
									<div class="d-flex justify-content-start align-items-center">
										<select class="form-select w-25"
											aria-label="Default select example">
											<option selected>선택</option>
											<option value="1">010</option>
											<option value="2">011</option>
											<option value="3"></option>
										</select>
										<p class="px-3">-</p>
										<input class="form-control w-50" type="text">
										<p class="px-3">-</p>
										<input class="form-control w-50" type="text">
									</div>
								</div>
								<div class="col align-self-center">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="">
										<label class="form-check-label" for="flexCheckDefault">
											SMS 수신 동의 </label>
									</div>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<th scope="row" class="table-dark text-light">별명</th>
						<td colspan="3">
							<div class="form-group row align-items-center">
								<div class="col-4 w-25">
									<input class="form-control" type="text">
								</div>
								<div class="col">
									<span class="d-inline"><a href="#">중복 체크</a></span>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<th scope="row" class="table-dark text-light">생년월일</th>
						<td colspan="3">
							<div class="row">
								<div class="col">
									<div class="d-flex justify-content-start align-items-center">
										<select class="form-select w-25 px-3">
											<option selected></option>
											<option value="1">1999</option>
											<option value="2">2000</option>
											<option value="3">2001</option>
										</select> <label class="form-select-label px-3" for="flexCheckDefault">
											년 </label> <select class="form-select w-25">
											<option selected></option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select> <label class="form-select-label px-3" for="flexCheckDefault">
											월 </label> <select class="form-select w-25">
											<option selected></option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select> <label class="form-select-label px-3" for="flexCheckDefault">
											일 </label>
									</div>
								</div>

								<div class="col-7 align-self-center">
									<input class="form-check-input" type="checkbox" value="">
									<span class="d-inline px-3"><a href="#">음력</a></span>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<th scope="row" class="table-dark text-light">성별</th>
						<td colspan="3">
							<div class="row">
								<div class="col">
									<div class="d-flex justify-content-start align-items-center">
										<input class="form-check-input" type="radio"
											name="flexRadioDefault"> <label
											class="form-check-label px-3" for="flexRadioDefault1">
											남자 </label> <input class="form-check-input" type="radio"
											name="flexRadioDefault"> <label
											class="form-check-label px-3" for="flexRadioDefault1">
											여자 </label>
									</div>
								</div>
								<div class="col"></div>
							</div>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
		<div class="col-1"></div>
	</div>
</div>