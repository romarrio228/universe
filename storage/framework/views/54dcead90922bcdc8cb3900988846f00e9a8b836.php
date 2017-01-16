<?php echo '<?php' ?>


use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LaratrustSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return  void
     */
    public function run()
    {
        $this->command->info('Truncating User, Role and Permission tables');
        $this->truncateLaratrustTables();
        
        $config = config('laratrust_seeder.role_structure');
        $mapPermission = collect(config('laratrust_seeder.permissions_map'));

        foreach ($config as $key => $modules) {
            // Create a new role
            $role = \<?php echo e($role); ?>::create([
                'name' => $key,
                'display_name' => ucfirst($key),
                'description' => ucfirst($key)
            ]);

            $this->command->info('Creating Role '. strtoupper($key));

            // Reading role permission modules
            foreach ($modules as $module => $value) {
                $permissions = explode(',', $value);

                foreach ($permissions as $p => $perm) {
                    $permissionValue = $mapPermission->get($perm);

                    $permission = \<?php echo e($permission); ?>::firstOrCreate([
                        'name' => $module . '-' . $permissionValue,
                        'display_name' => ucfirst($permissionValue) . ' ' . ucfirst($module),
                        'description' => ucfirst($permissionValue) . ' ' . ucfirst($module),
                    ]);

                    $this->command->info('Creating Permission to '.$permissionValue.' for '. $module);
                    
                    if (!$role->hasPermission($permission->name)) {
                        $role->attachPermission($permission);
                    } else {
                        $this->command->info($key . ': ' . $p . ' ' . $permissionValue . ' already exist');
                    }
                }
            }

            $this->command->info("Creating '{$key}' user");
            // Create default user for each role
            $user = \<?php echo e($user); ?>::create([
                'name' => ucfirst($key),
                'email' => $key.'@app.com',
                'password' => bcrypt('password'),
                'remember_token' => str_random(10),
            ]);
            $user->attachRole($role);
        }
    }

    /**
     * Truncates all the laratrust tables and the users table
     * @return    void
     */
    public function truncateLaratrustTables()
    {
<?php if(Config::get('database.default') == 'pgsql'): ?>
        DB::table('<?php echo e(config('laratrust.permission_role_table')); ?>')->truncate();
        DB::table('<?php echo e(config('laratrust.role_user_table')); ?>')->truncate();
        $usersTable = (new \<?php echo e($user); ?>)->getTable();
        $rolesTable = (new \<?php echo e($role); ?>)->getTable();
        $permissionsTable = (new \<?php echo e($permission); ?>)->getTable();
        DB::statement("TRUNCATE TABLE {$usersTable} CASCADE");
        DB::statement("TRUNCATE TABLE {$rolesTable} CASCADE");
        DB::statement("TRUNCATE TABLE {$permissionsTable} CASCADE");
<?php elseif(Config::get('database.default') == 'mysql'): ?>
        DB::statement('SET FOREIGN_KEY_CHECKS = 0');
        DB::table('<?php echo e(config('laratrust.permission_role_table')); ?>')->truncate();
        DB::table('<?php echo e(config('laratrust.role_user_table')); ?>')->truncate();
        \<?php echo e($user); ?>::truncate();
        \<?php echo e($role); ?>::truncate();
        \<?php echo e($permission); ?>::truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS = 1');
<?php endif; ?>
    
    }
}
