--�����û�
create user liufei identified by 123456;
--�����û�
alter user �û��� identified by 456789;
--ɾ���û���
drop user �û���
--���û�ӵ�ж�������ֱ��ɾ�������򽫷���һ������ֵ��ָ���ؼ���cascade,��ɾ���û����еĶ���Ȼ����ɾ���û���
drop user �û��� cascade;
-- ����ǰ�潲��������ϵͳ��ɫ
---- connect��resource��dba���û���������oracle�����Լ���role���û�������role�����ɱ��ϵͳȨ�޻����ߵ���Ϲ��ɡ�Ϊ�˴���role���û��������create roleϵͳȨ�ޡ�
1��������ɫ
create role ��ɫ��;
create role testRole;
2����Ȩ��ɫ
grant select on class to ��ɫ��;
grant select on class to testRole;
--ע�����ڣ�ӵ��testRole��ɫ�������û������ж�class���select��ѯȨ��
3��ɾ����ɫ
drop role ��ɫ��;
drop role testRole;
һ������
����sys;//ϵͳ����Ա��ӵ�����Ȩ��
����system;//���ع���Ա���θ�Ȩ��
����scott;//��ͨ�û�������Ĭ��Ϊtiger,Ĭ��δ����
����oracle������Ĭ�ϵ��û���������~
����1.�û���:sys����:change_on_install
����2.�û���:system����:manager
����3.�û���:scott����:tiger
����������½
����sqlplus / as sysdba;//��½sys�ʻ�
����sqlplus sys as sysdba;//ͬ��
����sqlplus scott/tiger;//��½��ͨ�û�scott
�������������û�
����create user zhangsan;//�ڹ���Ա�ʻ��£������û�zhangsan
����alert user scott identified by tiger;//�޸�����
�����ģ�����Ȩ��
����1��Ĭ�ϵ���ͨ�û�scottĬ��δ���������ܽ����Ǹ�ʹ�ã��½����û�Ҳû���κ�Ȩ�ޣ���������Ȩ��
����grant create session to zhangsan;//����zhangsan�û�����session��Ȩ�ޣ�����½Ȩ�ޣ������û���¼���ݿ�
����grant unlimited tablespace to zhangsan;//����zhangsan�û�ʹ�ñ�ռ��Ȩ��
����grant create table to zhangsan;//���贴�����Ȩ��
����grant drop table to zhangsan;//����ɾ�����Ȩ��
����grant insert table to zhangsan;//������Ȩ��
����grant update table to zhangsan;//�޸ı��Ȩ��
����grant all to public;//�����Ƚ���Ҫ����������Ȩ��(all)�������û�(public)
����2��oralce��Ȩ�޹���Ƚ��Ͻ�����ͨ�û�֮��Ҳ��Ĭ�ϲ��ܻ�����ʵģ���Ҫ������Ȩ
����grant select on tablename to zhangsan;//����zhangsan�û��鿴ָ�����Ȩ��
����grant drop on tablename to zhangsan;//����ɾ�����Ȩ��
����grant insert on tablename to zhangsan;//��������Ȩ��
����grant update on tablename to zhangsan;//�����޸ı��Ȩ��
����grant insert(id) on tablename to zhangsan;
����grant update(id) on tablename to zhangsan;//�����ָ�����ض��ֶεĲ�����޸�Ȩ�ޣ�ע�⣬ֻ����insert��update
����grant alert all table to zhangsan;//����zhangsan�û�alert������Ȩ��
�����塢����Ȩ��
���������﷨ͬgrant,�ؼ���Ϊrevoke
���������鿴Ȩ��
����select * from user_sys_privs;//�鿴��ǰ�û�����Ȩ��
����select * from user_tab_privs;//�鿴�����û��Ա��Ȩ��
�����ߡ���������û��ı�
����select * from zhangsan.tablename
�����ˡ�Ȩ�޴���
�������û�A��Ȩ������B��B���Խ�������Ȩ��������C���������£�
����grant alert table on tablename to zhangsan with admin option;//�ؼ��� with admin option
����grant alert table on tablename to zhangsan with grant option;//�ؼ��� with grant optionЧ����admin����
�����š���ɫ
������ɫ��Ȩ�޵ļ��ϣ����԰�һ����ɫ������û�
����create role myrole;//������ɫ
����grant create session to myrole;//������session��Ȩ������myrole
����grant myrole to zhangsan;//����zhangsan�û�myrole�Ľ�ɫ
����drop role myrole;ɾ����ɫ
