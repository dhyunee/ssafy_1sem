const dijkstra = document.querySelector(".dijkstra").addEventListener('click',()=>{

   // 현재 내 위치
    const curPosition = JSON.parse(localStorage.getItem("position"))


    const aptPositions = []
    const aptList = document.querySelectorAll('#aptlist tr');


// 아파트 위치 배열
aptList.forEach((apt)=>{
    console.log(apt.childNodes[5].innerHTML,apt.childNodes[6].innerHTML)
    let aptLat = parseInt(apt.childNodes[5].innerHTML);
    let aptLng = parseInt(apt.childNodes[6].innerHTML);
    aptPositions.push({name : apt.childNodes[0].innerHTML, distance :Math.abs(aptLat - curPosition.lat) + Math.abs(aptLng - curPosition.lng)});
    })
    console.log(aptPositions)

    aptPositions.sort((a,b)=>{
        a.distance - b.distance;
    })

    console.log(aptPositions)
    alertify.alert('가장 거리가 가까운 아파트', aptPositions[0].name);


})