function openTab(tabName) {
    let i;
    const tabPanels = document.querySelectorAll('.tab-panel');
    tabPanels.forEach(panel => panel.style.display = 'none');
    
    const activeTab = document.getElementById(tabName);
    if (activeTab) {
        activeTab.style.display = 'block';
    }
}

// Initializing with the 'Subjective' tab as active
openTab('subjective');

// Example of dynamic patient data (this could be fetched from a server)
const patientData = [
    { name: 'John Doe', age: 45, lastVisit: '2025-01-15', id: 12345 },
    { name: 'Jane Smith', age: 34, lastVisit: '2025-01-10', id: 12346 },
    // More patients...
];

// Dynamically populate the patient list
function populatePatientList() {
    const patientListElement = document.getElementById('patient-list');
    patientData.forEach(patient => {
        const li = document.createElement('li');
        li.innerHTML = `<a href="#">${patient.name}</a>`;
        patientListElement.appendChild(li);
    });
}

// Call the function to populate the recent patient list
populatePatientList();

function addNewPatient() {
    // Add logic to navigate or show a form for adding new patient
    alert('Redirect to add new patient page');
}

function searchPatient() {
    // Add search functionality here
    alert('Search patient functionality');
}

function editPatient() {
    // Logic for editing the patient details
    alert('Edit patient details');
}
