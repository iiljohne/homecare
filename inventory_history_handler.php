<?php
require_once 'includes/init.php';
require_role('caregiver');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: inventory_dashboard.php');
    exit();
}

$inventory_id = intval(getPostValue('inventory_id'));
$medicine_id = intval(getPostValue('medicine_id'));
$delete = getPostValue('delete');

if ($delete === 'yes' && !empty($inventory_id)) {
    // HC-237: guard on the row's own medicine, not the posted one.
    $invRows = dbi_get_cached_rows('SELECT medicine_id FROM hc_medicine_inventory WHERE id = ?', [$inventory_id]);
    if (!empty($invRows)) {
        require_medicine_access((int) $invRows[0][0]);
    }
    $sql = "DELETE FROM hc_medicine_inventory WHERE id = ?";
    if (!dbi_execute($sql, [$inventory_id])) {
        die_miserable_death('Error deleting inventory entry: ' . dbi_error());
    }
    audit_log('inventory.updated', 'inventory', $inventory_id, [
        'kind' => 'delete',
        'medicine_id' => $medicine_id,
    ]);
}

do_redirect('inventory_history.php?medicine_id=' . $medicine_id . '&deleted=1');
?>
