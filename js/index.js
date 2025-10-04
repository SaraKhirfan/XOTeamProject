      const chatbotBtn = document.querySelector(
        ".btnButtons button:nth-child(2)"
      );
      const iframeSection = document.querySelector(".iframe-section");
      const closeIframeBtn = document.getElementById("closeIframeBtn");

      // إظهار/إخفاء عند الضغط على زر AI Chatbot
      chatbotBtn.addEventListener("click", () => {
        if (
          iframeSection.style.display === "none" ||
          iframeSection.style.display === ""
        ) {
          iframeSection.style.display = "block";
        } else {
          iframeSection.style.display = "none";
        }
      });

      // إخفاء عند الضغط على زر (X)
      closeIframeBtn.addEventListener("click", () => {
        iframeSection.style.display = "none";
      });
      document.addEventListener("DOMContentLoaded", () => {
        const slices = document.querySelectorAll(".pie-slice");
        const legendItems = document.querySelectorAll(".legend-item");
        const createBtn = document.getElementById("createTimelineBtn");
        const wrapper = document.getElementById("timeline-wrapper");

        // مدة الأنيميشن
        const ANIMATION_DURATION = 100000;

        // دالة رسم التايملاين
        function createTimelineHTML() {
const eventsData = [
  { year: "2019", desc: "OSIRIS-REx arrives at asteroid Bennu to collect samples." },
  { year: "2020", desc: "James Webb Space Telescope ." },
  { year: "2021", desc: "Perseverance rover lands on Mars." },
  { year: "2022", desc: "Artemis I mission tests Moon systems." },
  { year: "2023", desc: "OSIRIS-REx returns to Earth with samples." },
];

          const eventsHTML = eventsData
            .map(
              (event) => `
        <div class="timeline-event">
          <div class="timeline-point"></div>
          <div class="timeline-content">
            <div class="timeline-year">${event.year}</div>
            <div class="timeline-desc">${event.desc}</div>
          </div>
        </div>
      `
            )
            .join("");

          return `
      <div class="timeline-container">
        <div class="timeline">
          ${eventsHTML}
        </div>
      </div>`;
        }

        // انيميشن slices & legend
        function animateSlices() {
          slices.forEach((slice, index) => {
            setTimeout(() => {
              slice.classList.add("visible");
              legendItems[index].classList.add("visible");
            }, index * 1000);
          });
        }

        // انيميشن التايملاين
        function animateTimeline() {
          // نفس الكود تبع الزر لكن يشتغل لحاله
          const timelineHTML = createTimelineHTML();
          wrapper.innerHTML = timelineHTML;

          const newTimelineContainer = wrapper.querySelector(
            ".timeline-container"
          );
          const newTimeline = wrapper.querySelector(".timeline");

          setTimeout(() => {
            newTimelineContainer.classList.add("show");
            setTimeout(() => {
              newTimeline.classList.add("visible");
            }, 20);
          }, 50);

          setTimeout(() => {
            newTimelineContainer.remove();
          }, ANIMATION_DURATION);
        }

        // استخدام IntersectionObserver
        const observer = new IntersectionObserver(
          (entries) => {
            entries.forEach((entry) => {
              if (entry.isIntersecting) {
                if (entry.target.classList.contains("dataOver")) {
                  animateSlices(); // يشغل الأنيميشن تبع الباي تشارت
                  observer.unobserve(entry.target); // يمنعه يشتغل أكثر من مرة
                }
                if (entry.target.classList.contains("final")) {
                  animateTimeline(); // يشغل التايملاين
                  observer.unobserve(entry.target);
                }
              }
            });
          },
          { threshold: 0.3 } // يعني لازم يبين 30% من العنصر عالشاشة
        );

        // مراقبة العناصر
        const dataOverSection = document.querySelector(".dataOver");
        const finalSection = document.querySelector(".final");

        if (dataOverSection) observer.observe(dataOverSection);
        if (finalSection) observer.observe(finalSection);
      });