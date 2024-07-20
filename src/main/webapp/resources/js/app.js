/*// 상품 데이터 
// 후에 랜덤을 4개를 가져오는 방법으로 추천상품 4개를 메인 출력
// 서버에서 바로 이런식으로 데이터 가공해서 가져올 것 같음
const products = [
    {
        title: "몬타 01",
        price: "330,000원",
        lens: "Blue light protection",
        imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MONTA_GC10_2.jpg"
    },
    {
        title: "가우스 NC3",
        price: "330,000원",
        lens: "Blue light protection",
        imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_GAUSS_NC3_2.jpg"
    },
    {
        title: "엔온 GR7",
        price: "330,000원",
        lens: "",
        imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NONN_GR7_2.jpg"
    },
    {
        title: "트레이비 01",
        price: "330,000원",
        lens: "Blue light protection",
        imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_TTA_01_2.jpg"
    },
    {
        title: "메종마르지엘라 - MM109",
        price: "330,000원",
        lens: "",
        imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MM109_G10_1_1.jpg"
    },
    {
        title: "메종마르지엘라 - MM116",
        price: "330,000원",
        lens: "",
        imgSrc: "https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_MM116_BRC9_1_1.jpg"
    },

];

// 상품을 HTML로 변환하는 함수
const createProductCard = (product) => {
    return `
    
    <div class="col">
    <div class="card" style="width: 18rem;">
        <a href="">
            <img src="${product.imgSrc}" class="card-img" alt="${product.title}">
            <div class="card-body">
                <p class="lens">${product.lens || ''}</p>
                <h5 class="card-title">${product.title}</h5>
                <p class="card-text">${product.price}</p>
            </div>
        </a>
    </div>
    </div>`;
}

// 상품 데이터를 사용하여 상품 카드 생성 및 페이지에 추가
const displayFeaturedItems = () => {
    const featuredItemsContainer = document.getElementById('featuredItems');

    // Check if the products array is empty
    if (products.length === 0) {
        // Display a message indicating no products are available
        // remove the class names for greed form
        featuredItemsContainer.className="card-container";
        featuredItemsContainer.innerHTML = `<div class="text-center text-light"><p>현재 아무런 데이터를 불러올 수 없습니다.</p></div>`;
    } else {
        // If products are available, display them as before
        products.forEach(product => {
            featuredItemsContainer.innerHTML += createProductCard(product);
        });
    }
};

// 문서가 로드되면 실행
displayFeaturedItems();*/
AOS.init(); 