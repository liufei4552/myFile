--创建用户
create user liufei identified by 123456;
--更改用户
alter user 用户名 identified by 456789;
--删除用户名
drop user 用户名
--若用户拥有对象，则不能直接删除，否则将返回一个错误值。指定关键字cascade,可删除用户所有的对象，然后再删除用户。
drop user 用户名 cascade;
-- 除了前面讲到的三种系统角色
---- connect、resource和dba，用户还可以在oracle创建自己的role。用户创建的role可以由表或系统权限或两者的组合构成。为了创建role，用户必须具有create role系统权限。
1》创建角色
create role 角色名;
create role testRole;
2》授权角色
grant select on class to 角色名;
grant select on class to testRole;
--注：现在，拥有testRole角色的所有用户都具有对class表的select查询权限
3》删除角色
drop role 角色名;
drop role testRole;
一、创建
　　sys;//系统管理员，拥有最高权限
　　system;//本地管理员，次高权限
　　scott;//普通用户，密码默认为tiger,默认未解锁
　　oracle有三个默认的用户名和密码~
　　1.用户名:sys密码:change_on_install
　　2.用户名:system密码:manager
　　3.用户名:scott密码:tiger
　　二、登陆
　　sqlplus / as sysdba;//登陆sys帐户
　　sqlplus sys as sysdba;//同上
　　sqlplus scott/tiger;//登陆普通用户scott
　　三、管理用户
　　create user zhangsan;//在管理员帐户下，创建用户zhangsan
　　alert user scott identified by tiger;//修改密码
　　四，授予权限
　　1、默认的普通用户scott默认未解锁，不能进行那个使用，新建的用户也没有任何权限，必须授予权限
　　grant create session to zhangsan;//授予zhangsan用户创建session的权限，即登陆权限，允许用户登录数据库
　　grant unlimited tablespace to zhangsan;//授予zhangsan用户使用表空间的权限
　　grant create table to zhangsan;//授予创建表的权限
　　grant drop table to zhangsan;//授予删除表的权限
　　grant insert table to zhangsan;//插入表的权限
　　grant update table to zhangsan;//修改表的权限
　　grant all to public;//这条比较重要，授予所有权限(all)给所有用户(public)
　　2、oralce对权限管理比较严谨，普通用户之间也是默认不能互相访问的，需要互相授权
　　grant select on tablename to zhangsan;//授予zhangsan用户查看指定表的权限
　　grant drop on tablename to zhangsan;//授予删除表的权限
　　grant insert on tablename to zhangsan;//授予插入的权限
　　grant update on tablename to zhangsan;//授予修改表的权限
　　grant insert(id) on tablename to zhangsan;
　　grant update(id) on tablename to zhangsan;//授予对指定表特定字段的插入和修改权限，注意，只能是insert和update
　　grant alert all table to zhangsan;//授予zhangsan用户alert任意表的权限
　　五、撤销权限
　　基本语法同grant,关键字为revoke
　　六、查看权限
　　select * from user_sys_privs;//查看当前用户所有权限
　　select * from user_tab_privs;//查看所用用户对表的权限
　　七、操作表的用户的表
　　select * from zhangsan.tablename
　　八、权限传递
　　即用户A将权限授予B，B可以将操作的权限再授予C，命令如下：
　　grant alert table on tablename to zhangsan with admin option;//关键字 with admin option
　　grant alert table on tablename to zhangsan with grant option;//关键字 with grant option效果和admin类似
　　九、角色
　　角色即权限的集合，可以把一个角色授予给用户
　　create role myrole;//创建角色
　　grant create session to myrole;//将创建session的权限授予myrole
　　grant myrole to zhangsan;//授予zhangsan用户myrole的角色
　　drop role myrole;删除角色
