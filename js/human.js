// --- JavaScript الجديد والمعدّل ---

      // 1. الحصول على عناصر الـ Modal من الصفحة
      const modalOverlay = document.getElementById("infoModal");
      const modalTitle = document.getElementById("modalTitle");
      const modalText = document.getElementById("modalText");
      const closeButton = document.querySelector(".close-button");

      // 2. دالة showInfo المعدّلة: بدلاً من alert، تملأ الـ Modal بالبيانات وتظهره
      function showInfo(part, information) {
        modalTitle.innerText = `Effect of Space on the ${part}`;
        modalText.innerText = information;
        modalOverlay.classList.add("show"); // إضافة كلاس 'show' لإظهار الـ Modal
      }

      // 3. دالة لإغلاق الـ Modal
      function closeModal() {
        modalOverlay.classList.remove("show"); // حذف كلاس 'show' لإخفاء الـ Modal
      }

      // 4. ربط أحداث الإغلاق
      // إغلاق عند الضغط على زر (X)
      closeButton.addEventListener("click", closeModal);

      // إغلاق عند الضغط على الخلفية السوداء
      modalOverlay.addEventListener("click", function (event) {
        if (event.target === modalOverlay) {
          closeModal();
        }
      });