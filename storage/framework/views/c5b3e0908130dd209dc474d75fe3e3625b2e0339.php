

<?php $__env->startSection('content'); ?>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">仪表板</div>

                    <div class="panel-body">
                        <h4>地址列表</h4>
                        <hr/>
                        <?php $__currentLoopData = $addresses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $address): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                            <address>
                            <h3>
                                <a href="<?php echo e(action('AddressController@show', [$address->id])); ?>"> <?php echo e($address->address); ?></a>
                            </h3>
                            <h4><div class="serial_number">国家 <?php echo e($address->country_id); ?></div></h4>
                            <h4><div class="english_name">省份 <?php echo e($address->province_id); ?></div></h4>
                            <h4><div class="type">城市 <?php echo e($address->city_id); ?></div></h4>
                            <h4><div class="property">县区 <?php echo e($address->district_id); ?></div></h4>
                            <h4><div class="total_class_hours">地址 <?php echo e($address->address); ?></div></h4>
                            <h4><div class="total_credits">英文地址 <?php echo e($address->english_address); ?></div></h4>
                            <h4><div class="total_credits">邮政编码 <?php echo e($address->zip); ?></div></h4>
                            <h4><div class="total_credits">标志 <?php echo e($address->flag); ?></div></h4>
                        </address>

                        

                        <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>