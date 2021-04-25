window.addEventListener('load', function () {
  
  setTimeout(function () {
    ajaxUpdate();
  }, 3000);
  
});

function ajaxUpdate() {
  var index =  ["cats/_top1", "cats/_top2"];
  var box=document.getElementById("info");//読み込みたい位置を指定
  requests=new Array(index.length);
  for (let i = 0; i < index.length; i++) {
    var url = index[i];
    requests[i] = new XMLHttpRequest();
    requests[i].responseType="document";//XMLとして扱いたいので一応記述
    requests[i].open("GET", url, true);
    requests[i].onreadystatechange = function () {
      if(requests[i].readyState === 4 && requests[i].status === 200) {
        var restxt=requests[i].responseXML;
        var int=restxt.getElementsByTagName("body")[0];//読み込まれるセレクタを指定
        box.innerHTML=int.innerHTML;
        
      }

      const button = document.getElementsByClassName("mypic-arrow");
      var buttons = Array.from(button);
      
      buttons.forEach(function(target){
        
        target.addEventListener('mouseover', function(){
          target.setAttribute("style", "background-color:gray;");
        })
        target.addEventListener('mouseout', function(){
          target.removeAttribute("style", "background-color:gray;");
        })
      });

    };
    requests[i].send();
  }
};


// window.addEventListener('load', function () {
  
//   setTimeout(function () {
//     ajaxUpdate();
//   }, 3000);
  
// });

// function ajaxUpdate() {
//   var index =  ["cats/_top1", "cats/_top2"];
//   var box=document.getElementById("info");//読み込みたい位置を指定
//   requests=new Array(index.length);
//   for (let i = 0; i < index.length; i++) {
//     var url = index[i];
//     requests[i] = new XMLHttpRequest();
//     requests[i].responseType="document";//XMLとして扱いたいので一応記述
//     requests[i].open("GET", url, true);
//     requests[i].onreadystatechange = function () {
//       if(requests[i].readyState === 4 && requests[i].status === 200) {
//         var restxt=requests[i].responseXML;
//         var int=restxt.getElementsByTagName("body")[0];//読み込まれるセレクタを指定
//         box.innerHTML=int.innerHTML;
//       }

//       const button = document.getElementsByClassName("mypic-arrow");
//       var buttons = Array.from(button);
      
//       buttons.forEach(function(target){
        
//         target.addEventListener('mouseover', function(){
//           target.setAttribute("style", "background-color:gray;");
//         })
//         target.addEventListener('mouseout', function(){
//           target.removeAttribute("style", "background-color:gray;");
//         })
//       });

//     };
//     requests[i].send();
//   }
// };





// ページの一部だけをreloadする方法
// Ajaxを使う方法
// XMLHttpRequestを使ってAjaxで更新

// ajaxUpdate();

// function ajaxUpdate() {
//   // ajaxオブジェクト生成
//   var ajax = new XMLHttpRequest;
  
//   var urlLists =  ["cats/_top2", "cats/_top1"];
//   var box=document.getElementById("info");//読み込みたい位置を指定
//   var num = -1;
//   if (num == 1){
//     num = 0;
//   } 
//   else {
//     num ++;
//   }
//   ajax.responseType="document";//XMLとして扱いたいので一応記述
//   // ajax通信open
//   ajax.open('GET', urlLists[num], true);
  
//   // ajax返信時の処理
//   ajax.onreadystatechange = function () {
// 		if(ajax.readyState === 4 && ajax.status === 200) {
//     var restxt=ajax.responseXML;//重要
//     var int=restxt.getElementsByTagName("body")[0];//読み込まれるセレクタを指定
//     box.innerHTML=int.innerHTML;//完了
//     }
//   };
//   // ajax開始
//   ajax.send(null);

//   setTimeout(function () {
//     ajaxUpdate();
//   }, 3000);
// }

// window.addEventListener('load', function () {
  
//   var url =  "cats/_top1";
  
//   var div = document.getElementById('info');
  
//   setTimeout(function () {
//     ajaxUpdate(url, div);
//   }, 3000);
  
// });

    


  // var pics_src = new Array("shared/top1.html.erb","shared/top2.html");
  // var num = -1;

  // slideshow();

  // function slideshow() {
  //   if (num == 1){
  //     num = 0;
  //   } 
  //   else {
  //     num ++;
  //   }
  //   document.getElementById("mypic")=pics_src[num];
  //   setTimeout("slideshow()",10000);
  // } 

  // function go_forward(){
  //   if (num == 1) {
  //       num = 0;
  //   }
  //   else {
  //       num ++;
  //   }
  //   document.getElementById("mypic")=pics_src[num];
  // }

  // function go_back(){
  //   if (num == 0) {
  //       num = 1;
  //   }
  //   else {
  //       num --;
  //   }
  //   document.getElementById("mypic")=pics_src[num];
  // }

// })

