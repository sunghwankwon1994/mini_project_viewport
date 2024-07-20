const deleteQnaModalFooter = document.getElementById('deleteQna-modal-footer');

function deleteQna(qid) {
	deleteQnaModalFooter.innerHTML=`<button type="submit" name="qid" value="${qid}" class="btn btn-dark">삭제</button>
	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>`
}