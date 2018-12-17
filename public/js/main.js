//-------------------------------------------------------------------
var SampleNum = 0; //コア機能
var SampleNum1 = 0; //サブ機能
var SampleNum2 = 0; //技術
function addSample() {
  var text = document.createElement('input');
  this.SampleNum++;
  text.type = 'text';
  text.id = 'TextSample_' + this.SampleNum;
  text.name = 'core[]';
  text.setAttribute("style", "width: 30%;");
  text.setAttribute("form", "ideaform");
  text.setAttribute("placeholder", "アイデアをまとめられる");
  text.value = '';
  var div = document.getElementById('TextSample');
  div.appendChild(text);
  if (this.SampleNum % 5 == 0) {
    // <br />を追加
    div.appendChild(document.createElement("br"));
  }
  document.frmSampleRegist.btnSampleDel.disabled = false;
  if (this.SampleNum == 20) {
    document.frmSampleRegist.btnSampleAdd.disabled = true;
  } // ロード時の処理（削除ボタンの無効化）
  if (this.SampleNum == 1) {
    document.frmSampleRegist.btnSampleDel.disabled = true;
  }
}

function delSample() {
  var div = document.getElementById('TextSample');
  if (this.SampleNum % 5 == 0) {
    div.removeChild(div.lastChild); // <br />を削除
  }
  this.SampleNum--;
  div.removeChild(div.lastChild); // テキストボックスを削除
  document.frmSampleRegist.btnSampleAdd.disabled = false;
  if (this.SampleNum == 1) {
    document.frmSampleRegist.btnSampleDel.disabled = true;
  }
}

//-------------------------------------------------------------------
//-------------------------------------------------------------------
function addSample1() {
  var text1 = document.createElement('input');
  this.SampleNum1++;
  text1.type = 'text1';
  text1.id = 'TextSample1_' + this.SampleNum1;
  text1.name = 'sab[]';
  text1.setAttribute("style", "width: 30%;");
  text1.setAttribute("form", "ideaform");
  text1.setAttribute("placeholder", "カテゴリごとに分ける");
  text1.value = '';
  var div1 = document.getElementById('TextSample1');
  div1.appendChild(text1);
  if (this.SampleNum1 % 5 == 0) {
    // <br />を追加
    div1.appendChild(document.createElement("br"));
  }
  document.frmSampleRegist1.btnSampleDel1.disabled = false;
  if (this.SampleNum1 == 20) {
    document.frmSampleRegist1.btnSampleAdd1.disabled = true;
  } // ロード時の処理（削除ボタンの無効化）
  if (this.SampleNum1 == 1) {
    document.frmSampleRegist1.btnSampleDel1.disabled = true;
  }
}

function delSample1() {
  var div1 = document.getElementById('TextSample1');
  if (this.SampleNum1 % 5 == 0) {
    div1.removeChild(div1.lastChild); // <br />を削除
  }
  this.SampleNum1--;
  div1.removeChild(div1.lastChild); // テキストボックスを削除
  document.frmSampleRegist1.btnSampleAdd1.disabled = false;
  if (this.SampleNum1 == 1) {
    document.frmSampleRegist1.btnSampleDel1.disabled = true;
  }
}

//-------------------------------------------------------------------
//-------------------------------------------------------------------
function addSample2() {
  var text2 = document.createElement('input');
  this.SampleNum2++;
  text2.type = 'text2';
  text2.id = 'TextSample2_' + this.SampleNum2;
  text2.name = 'technology[]';
  text2.setAttribute("style", "width: 30%;");
  text2.setAttribute("form", "ideaform");
  text2.setAttribute("placeholder", "Ruby(Sinatra)");
  text2.value = '';
  var div2 = document.getElementById('TextSample2');
  div2.appendChild(text2);
  if (this.SampleNum2 % 5 == 0) {
    // <br />を追加
    div2.appendChild(document.createElement("br"));
  }
  document.frmSampleRegist2.btnSampleDel2.disabled = false;
  if (this.SampleNum2 == 20) {
    document.frmSampleRegist2.btnSampleAdd2.disabled = true;
  } // ロード時の処理（削除ボタンの無効化）
  if (this.SampleNum2 == 1) {
    document.frmSampleRegist2.btnSampleDel2.disabled = true;
  }
}

function delSample2() {
  var div2 = document.getElementById('TextSample2');
  if (this.SampleNum2 % 5 == 0) {
    div2.removeChild(div2.lastChild); // <br />を削除
  }
  this.SampleNum2--;
  div2.removeChild(div2.lastChild); // テキストボックスを削除
  document.frmSampleRegist2.btnSampleAdd2.disabled = false;
  if (this.SampleNum2 == 1) {
    document.frmSampleRegist2.btnSampleDel2.disabled = true;
  }
}

//-------------------------------------------------------------------
//-------------------------------------------------------------------
function date() {
  var date = new Date();

  var yyyy = date.getFullYear();
  var mm = ("0" + (date.getMonth() + 1)).slice(-2);
  var dd = ("0" + date.getDate()).slice(-2);

  document.getElementById("today").value = yyyy + '-' + mm + '-' + dd;
}