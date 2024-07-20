$(document).ready(function() {
    // 체크박스 상태를 서버에서 전달된 값으로 설정
    $('input[type="checkbox"]').each(function() {
        const checkbox = $(this);
        const name = checkbox.attr('name');
        const value = checkbox.val();
        const paramValue = new URLSearchParams(window.location.search).get(name);

        if (paramValue && paramValue === value) {
            checkbox.prop('checked', true);
        }
    });

    // 초기화 버튼 클릭 시 체크박스 모두 해제 및 폼 제출
    $('#resetButton').click(function(event) {
        event.preventDefault();
        const form = document.getElementById('filterForm');
        // 폼의 모든 체크박스를 해제
        const checkboxes = form.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.checked = false;
        });

        // 페이지 번호 초기화
        const pageInput = form.querySelector('input[name="pageNo"]');
        if (pageInput) {
            pageInput.value = '1';
        } else {
            const newPageInput = document.createElement('input');
            newPageInput.type = 'hidden';
            newPageInput.name = 'pageNo';
            newPageInput.value = '1';
            form.appendChild(newPageInput);
        }

        // 필터 폼 제출
        form.submit();
    });

    // 각각의 체크박스 그룹에 대해 하나만 선택
    $('input[type="checkbox"]').click(function() {
        const name = $(this).attr('name');
        $('input[type="checkbox"][name="' + name + '"]').not(this).prop('checked', false);
    });

    // 필터 폼 제출 이벤트
    // 페이지 수는 기본 1로 해서 같이 보냄 >> 페이지 수가 없이 제출을 하게 되면 페이지 수가 제대로 보이지 않음
    $('#filterForm').submit(function(event) {
        const pageInput = $(this).find('input[name="pageNo"]');
        if (pageInput.length === 0) {
            $(this).append('<input type="hidden" name="pageNo" value="1">');
        }
    });
});

// 페이지 네비게이션 함수
// 페이지 수를 클릭할때 필터의 체크 박스 값도 같이 제출을 함
function navigateToPage(pageNo) {
    const form = document.getElementById('filterForm');
    const pageInput = document.createElement('input');
    pageInput.type = 'hidden';
    pageInput.name = 'pageNo';
    pageInput.value = pageNo;
    form.appendChild(pageInput);
    form.submit();
}
