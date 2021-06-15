function gestoreOver(){
    try {
       this.style.textDecoration = "underline overline double yellow";
    } catch (e){
        alert("gestoreEnter" + e);
    }
}

function gestoreOut(){
    try {
        this.style.textDecoration = "none";
    } catch (e){
        alert("gestoreOut" + e);
    }
}

function gestoreClickAvanti () {
	try {
		cambiaFoto(+1);
	} catch (e) {
		alert ("gestoreClickAvanti" + e );
	}
}

function gestoreClickIndietro () {
	try {
		cambiaFoto(-1);
	} catch (e) {
		alert ("gestoreClickIndietro" + e );
	}
}

function cambiaFoto (x) {
    indiceFoto += x;
    if (indiceFoto == NUMERO_FOTO){
        indiceFoto = 0;
    }
    if (indiceFoto < 0){
        indiceFoto = NUMERO_FOTO -1;
    }
    nodoFoto.setAttribute("src", galleria[indiceFoto]);
}

const NUMERO_FOTO = 2;
var nodoLink1;
var nodoLink2;
var galleria;
var indiceFoto;
var nodoAvanti;
var nodoIndietro;
var nodoStartStop;
var nodoFoto;

function gestoreLoad() {
    try{
        nodoLink1 = document.getElementById("link1");
        nodoLink2 = document.getElementById("link2");
        nodoAvanti = document.getElementById("avanti");
        nodoIndietro = document.getElementById("indietro");
        nodoFoto = document.getElementById("foto");
        nodoLink1.onmouseover = gestoreOver;
        nodoLink1.onmouseout = gestoreOut;
        nodoLink2.onmouseover = gestoreOver;
        nodoLink2.onmouseout = gestoreOut;
        nodoAvanti.onclick = gestoreClickAvanti;
        nodoIndietro.onclick = gestoreClickIndietro;
        galleria = [];
        for (var i = 0; i < NUMERO_FOTO; i++) {
            var nomeFoto = "foto" + i + ".jpg";
            galleria.push(nomeFoto);
        }
        indiceFoto = 0;
        cambiaFoto(0);
    } catch(e) {
        alert("gestoreLoad"+e);    
    }
}

window.onload=gestoreLoad;