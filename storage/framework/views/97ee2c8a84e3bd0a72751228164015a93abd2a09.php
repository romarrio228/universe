

<?php $__env->startSection('content'); ?>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-body" id="vue-user">

                            <address>
                                <?php echo e($country); ?> <?php echo e($province); ?> <?php echo e($city); ?> <?php echo e($district); ?><br/>
                                <?php echo e($address->address); ?> <?php echo e($address->zip); ?>


                            </address>

                    </div>
                </div>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>