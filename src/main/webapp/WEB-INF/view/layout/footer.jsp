<div class="py-20"></div>

<script>
    document.querySelectorAll(".open-modal").forEach(openModal => {
        openModal.addEventListener("click", () => {
            const modalId = openModal.dataset.modal
            const modalElement = document.querySelector('#' + modalId)
            modalElement.classList.add("grid!")
            document.body.style.overflow = "hidden"

            window.onclick = (e) => {
                if (e.target === modalElement) {
                    modalElement.classList.remove("grid!");
                    document.body.style.overflow = "auto"
                }
            };
        });
    });

</script>
</body>

</html>