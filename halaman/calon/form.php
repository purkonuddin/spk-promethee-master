<div class="row form-group">
	<div class="col-lg-3">
		<label>Nama</label>
	</div>
	<div class="col-lg-9">
		<input class="form-control" type="text" name="nama" placeholder="Nama" required="" value="<?php if(isset($data_calon)) echo $data_calon['nama']; ?>">
	</div>
</div>
<?php include 'config/kriteria/load_data.php'; ?>

<?php foreach ($datas as $data): ?>
    <div class="row form-group">
        <div class="col-lg-3">
            <label><?php echo $data[0]['nama']; ?></label>
        </div>
        <div class="col-lg-9">
        	<?php if (isset($data_calon['kriteria'][$data[0]['nama']])): ?>
	        	<input type="hidden" name="old_sub_id[<?php echo $data[0]['id'] ?>]" value="<?php echo $data_calon['kriteria'][$data[0]['nama']]['id']; ?>">
	       	<?php else: ?>
	        	<input type="hidden" name="new_sub[<?php echo $data[0]['id']; ?>]" value="<?php echo $data[0]['id']; ?>">
        	<?php endif ?>

            <?php if ($data[0]['nama_subkriteria']=='input'): ?>
                <input class="form-control" type="number" name="value[<?php echo $data[0]['id']; ?>]" placeholder="<?php echo $data[0]['nama']; ?>" value="<?php if(isset($data_calon['kriteria'][$data[0]['nama']]['value'])) echo $data_calon['kriteria'][$data[0]['nama']]['value']; ?>">
                <input type="hidden" name="sub_id[<?php echo $data[0]['id'] ?>]" value="<?php echo $data[0]['subkriteria_id'] ?>">

            <?php else: ?>
                <select class="form-control" name="sub_id[<?php echo $data[0]['id'] ?>]">
                    <option value="">- <?php echo $data[0]['nama']; ?> -</option>
                    <?php foreach ($data as $sub): ?>
                        <option value="<?php echo $sub['subkriteria_id'] ?>" <?php if(isset($data_calon['kriteria'][$data[0]['nama']]) && $sub['nama_subkriteria']==$data_calon['kriteria'][$data[0]['nama']]['value']) echo "selected"; ?>> <?php echo $sub['nama_subkriteria']; ?> </option>
                    <?php endforeach ?>

                </select>
            <?php endif ?>

        </div>
    </div>
<?php endforeach ?>