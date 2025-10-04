const buttons=document.querySelectorAll("button");
const iframe=document.querySelector("#modelFrame");
const bttnClicked=buttons.forEach((bttn)=>{
    bttn.addEventListener("click",()=>{
        let name=bttn.dataset.name;
        switch(name){
            case "waterBear":
                iframe.setAttribute("src","../models/WaterBearModel/index.html");
                break;
            case "archaea":
                iframe.setAttribute("src","../models/ArchaeaModel/index.html");
                break;
            case "humanCell":
                iframe.setAttribute("src","../models/cellModel/index.html");
                break;
            case "iss":
                iframe.setAttribute("src","../models/issModel/index.html");
                break;

        }
    });
});

bttnClicked();