export function toggle() {
   let sidebarToggle = document.body.querySelector('#sidebarToggle');
   if (sidebarToggle) {
      document.body.classList.toggle('sb-sidenav-toggled');
      localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
   }
};
