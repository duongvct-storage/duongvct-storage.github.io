document.addEventListener('DOMContentLoaded', () => {
    // Create Modal HTML
    const modalHtml = `
        <div id="pdfModal" class="pdf-modal">
            <div class="pdf-modal-content">
                <div class="pdf-modal-header">
                    <h3 id="pdf-title">PDF Viewer</h3>
                    <span class="close-modal">&times;</span>
                </div>
                <iframe id="pdf-iframe" src="" frameborder="0"></iframe>
            </div>
        </div>
    `;
    document.body.insertAdjacentHTML('beforeend', modalHtml);

    const modal = document.getElementById('pdfModal');
    const iframe = document.getElementById('pdf-iframe');
    const title = document.getElementById('pdf-title');
    const closeBtn = document.querySelector('.close-modal');

    // Handle PDF links
    document.addEventListener('click', (e) => {
        const link = e.target.closest('a[data-pdf-link]');
        if (link) {
            e.preventDefault();
            const url = link.getAttribute('href');
            const linkText = link.textContent || "PDF Viewer";
            
            title.textContent = linkText;
            iframe.src = url;
            modal.style.display = 'flex';
            document.body.style.overflow = 'hidden'; // Prevent scrolling
        }
    });

    // Close modal
    const closeModal = () => {
        modal.style.display = 'none';
        iframe.src = '';
        document.body.style.overflow = '';
    };

    closeBtn.addEventListener('click', closeModal);
    window.addEventListener('click', (e) => {
        if (e.target === modal) closeModal();
    });
    
    // Escape key to close
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && modal.style.display === 'flex') {
            closeModal();
        }
    });
});
