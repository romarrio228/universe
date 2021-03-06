

<?php $__env->startSection('content'); ?>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-body" id="vue-user">
                        <form action="" method="POST" role="form">
                        <!--<legend><?php echo e(Auth::user()->name); ?></legend>   暂时不要这行? -->

                            <div class="form-group">
                                <label for="countries">国家</label>
                                <!-- 绑定country_id，随着选择不同的国家而改变 -->
                                <select name="countries" id="countries" v-model="country_id">
                                    <?php $__currentLoopData = $countries; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $country): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                        <option  value="<?php echo e($country->id); ?>">
                                            <?php echo e($country->name); ?>

                                        </option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="provinces">省份</label>
                                <select name="provinces" id="provinces" v-model="province_id">
                                    <?php $__currentLoopData = $provinces; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $province): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                        <option v-if="country_id == <?php echo e($province->country_id); ?>" value="<?php echo e($province->id); ?>">
                                            <?php echo e($province->name); ?>

                                        </option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="cites">城市</label>
                                <select name="cites" id="cites" v-model="city_id">
                                    <?php $__currentLoopData = $cites; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $city): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                        <option v-if="province_id == <?php echo e($city->province_id); ?>" value="<?php echo e($city->id); ?>">
                                            <?php echo e($city->name); ?>

                                        </option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="districts">县区</label>
                                <select name="districts" id="districts">
                                    <?php $__currentLoopData = $districts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $district): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                        <option v-if="city_id == <?php echo e($district->city_id); ?>" value="<?php echo e($district->id); ?>">
                                            <?php echo e($district->name); ?>

                                        </option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>

    <script>
        new Vue({
            el:'#vue-user',
            data: {
                country_id:$('#countries option:selected').val(),
                province_id:$('#provinces option:selected').val(),
                city_id:$('#cites option:selected').val()
            }
        })
    </script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>