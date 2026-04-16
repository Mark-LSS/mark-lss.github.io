
async function loadMasterReference() {
  const res = await fetch('../assets/data/diving_calculators_master_reference.json', { cache: 'no-store' });
  if (!res.ok) throw new Error('Unable to load master calculator reference');
  return await res.json();
}

function getCalculator(master, id) {
  const list = master && Array.isArray(master.calculators) ? master.calculators : [];
  return list.find(c => c.id === id) || null;
}

function setFieldValue(id, value) {
  const el = document.getElementById(id);
  if (el && value !== undefined && value !== null) el.value = value;
}

function setText(id, value) {
  const el = document.getElementById(id);
  if (el) el.textContent = value;
}

function show(id, yes=true) {
  const el = document.getElementById(id);
  if (!el) return;
  el.classList.toggle('hidden', !yes);
}

function markError(ids, errors) {
  ids.forEach(id => {
    const el = document.getElementById(id);
    if (el) el.classList.toggle('is-error', errors.includes(id));
  });
}

function clearErrors(ids) { markError(ids, []); }

function setNotice(text, level='warn') {
  const el = document.getElementById('calcNotice');
  if (!el) return;
  el.className = 'calc-notice';
  if (level) el.classList.add(level);
  el.textContent = text;
}

function formatNumber(value, decimals=2) {
  return Number(value).toFixed(decimals);
}
