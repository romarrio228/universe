# universe
MIS for university

除了 users用户表、password_resets表、roles角色表、permissions权限表，
其他所有数据库表的名字，均用单数形式。复数形式有点复杂，干脆全部用单数。

clone回来的项目，是没有.env文件的。 .env文件需要从其他Laravel项目中拷贝一个过来，
并适当修改里面的参数，并执行 php artisan key:generate 。
