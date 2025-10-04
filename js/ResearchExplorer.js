 const letters = document.querySelectorAll(".about-section div span");
      const allBtn = document.querySelector(".about-section button");
      const parts = document.querySelectorAll(
        ".terms-cards .part1, .terms-cards .part2, .terms-cards .col2"
      );
      const searchInput = document.querySelector('input[type="text"]');

      // وظيفة الفلترة بالضغط على الحروف
      letters.forEach((letter) => {
        letter.addEventListener("click", () => {
          const selectedLetter = letter.textContent;

          parts.forEach((part) => {
            const h2 = part.querySelector("h2");
            if (h2 && h2.textContent === selectedLetter) {
              part.style.display = "block";
              part.scrollIntoView({ behavior: "smooth", block: "start" });
            } else {
              part.style.display = "none";
            }
          });
        });
      });

      // زر عرض الكل
      allBtn.addEventListener("click", () => {
        parts.forEach((part) => {
          part.style.display = "block";
        });
      });

      // وظيفة البحث في كل الأعمدة
      searchInput.addEventListener("input", () => {
        const query = searchInput.value.toLowerCase().trim();

        if (query === "") {
          parts.forEach((part) => {
            part.style.display = "block";
          });
          return;
        }

        parts.forEach((part) => {
          const texts = Array.from(part.querySelectorAll("p, a")).map((el) =>
            el.textContent.toLowerCase()
          );
          const match = texts.some((text) => text.includes(query));
          part.style.display = match ? "block" : "none";
        });
      });