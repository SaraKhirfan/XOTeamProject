  
      const iframeSection = document.querySelector(".iframe-section");
      const closeIframeBtn = document.getElementById("closeIframeBtn");

      // إظهار/إخفاء عند الضغط على زر AI Chatbot
     function press(){
        if (
          iframeSection.style.display === "none" ||
          iframeSection.style.display === ""
        ) {
          iframeSection.style.display = "block";
        } else {
          iframeSection.style.display = "none";
        }
      }

      // إخفاء عند الضغط على زر (X)
      closeIframeBtn.addEventListener("click", () => {
        iframeSection.style.display = "none";
      });