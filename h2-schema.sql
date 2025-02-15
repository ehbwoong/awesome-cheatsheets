drop table oauth_client_token  if exists;
drop table oauth_access_token  if exists;
drop table oauth_refresh_token if exists;

drop table app_device if exists;
drop table app_platform if exists;
drop table auth_pwd if exists;
drop table auth_simple if exists;
drop table auth_sns if exists;
drop table code_mst if exists;

drop table fido_set if exists;
drop table hospital_admin_map if exists;

drop table ip_access if exists;
drop table login_log if exists;
drop table oauth_approvals if exists;
drop table oauth_client_details if exists;
drop table oauth_code if exists;
drop table role_privilege if exists;
drop table privilege_def if exists;
drop table user_role if exists;
drop table role_def if exists;

drop table user_agrmnt if exists;
drop table terms_def if exists;
drop table user_admin if exists;

drop table user_auth if exists;
drop table user_config if exists;
drop table user_device if exists;
drop table user_inactive if exists;
drop table user_inactive_log if exists;
drop table user_staff if exists;

drop table user_patient if exists;
drop table user_mst if exists;
drop table device_mst if exists;
drop table app_mst if exists;
drop table hospital_mst  if exists;








create table IF NOT EXISTS oauth_client_token (
  token_id VARCHAR(256),
  token LONGVARBINARY,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256)
);

create table IF NOT EXISTS oauth_access_token (
  token_id VARCHAR(256),
  token LONGVARBINARY,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication LONGVARBINARY,
  refresh_token VARCHAR(256)
);

create table IF NOT EXISTS oauth_refresh_token (
  token_id VARCHAR(256),
  token LONGVARBINARY,
  authentication LONGVARBINARY
);

create table app_device (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, last_auth_type varchar(10) not null, push_token varchar(2048), app_id bigint not null, user_device_id bigint, primary key (id))
;
create table app_mst (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, app_nm varchar(50) not null, app_state varchar(20) not null, app_ver varchar(20) not null, fcm_key varchar(2046), fido_api_key varchar(256), multi_enabled boolean not null, nice_site_cd varchar(50), nice_site_pwd varchar(20), prod_cd varchar(10), hospital_id bigint, primary key (id))
;
create table app_platform (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, deploy_type varchar(20) not null, hash_key varchar(2048), ios_processed boolean, pkg_nm varchar(100) not null, platform_type varchar(10) not null, store_url varchar(256) not null, app_id bigint, primary key (id))
;
create table auth_pwd (id bigint generated by default as identity, account_locked_on timestamp, hash_algo varchar(36), hash_salt varchar(36), hospital_cd varchar(20) not null, login_retries smallint, pwd varchar(2048) not null, pwd_changed_on timestamp, user_accnt varchar(50) not null, user_auth_id bigint not null, primary key (id))
;
create table auth_simple (id bigint generated by default as identity, account_locked_on timestamp, created_on timestamp not null, pwd_changed_on timestamp, pwd_retry_cnt smallint, simple_auth_type varchar(10) not null, simple_pwd varchar(2048) not null, user_accnt varchar(255), device_id bigint not null, user_auth_id bigint not null, primary key (id))
;
create table auth_sns (id bigint generated by default as identity, logged_on timestamp not null, sns_accnt varchar(50) not null, sns_key varchar(36) not null, sns_type varchar(36) not null, user_auth_id bigint not null, primary key (id))
;
create table code_mst (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, code varchar(20) not null, code_cls varchar(20) not null, code_desc varchar(1000), code_nm varchar(128) not null, code_nm_eng varchar(128), code_type varchar(20) not null, disp_ord varchar(10) not null, ref_val varchar(20), primary key (id))
;
create table device_mst (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, device_ver varchar(20) not null, model_nm varchar(50) not null, platform_type varchar(10) not null, uuid varchar(36) not null, primary key (id))
;
create table fido_set (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, api_key varchar(2048) not null, tenant_cd varchar(36) not null, primary key (id))
;
create table hospital_admin_map (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, hospital_id bigint not null, user_id bigint not null, primary key (id))
;
create table hospital_mst (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, api_url varchar(256) not null, bed_cnt smallint, biz_no varchar(10), campain_txt varchar(1000), daily_visit_cnt smallint, domain_url varchar(256) not null, enabled boolean not null, family_enabled boolean not null, fido_enabled boolean not null, home_url varchar(256), hospital_addr_cd varchar(100) not null, hospital_cd varchar(20) not null, hospital_nm varchar(30), hospital_nm_cd varchar(100) not null, hospital_telno_cd varchar(100) not null, hospital_type varchar(20) not null, intro_content varchar(2147483647), loc_cd varchar(20) not null, logo_url varchar(256), max_dormant_age smallint not null, max_pwd_age smallint not null, memo varchar(1000), opened_on timestamp, pwd_retry_cnt smallint not null, rep_nm varchar(50), service_ip varchar(40) not null, tel_no varchar(30), primary key (id))
;
create table ip_access (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, ip_addr varchar(40), user_id bigint not null, primary key (id))
;
create table login_log (id bigint generated by default as identity, app_id bigint, app_ver varchar(20), auth_type varchar(20) not null, device_uuid varchar(36), loged_on timestamp not null, login_type varchar(20) not null, service_nm varchar(100) not null, user_accnt varchar(50), user_id bigint, primary key (id))
;
create table oauth_approvals (id bigint generated by default as identity, client_id varchar(255), expires_at timestamp, last_modified_at timestamp, scope varchar(255), status varchar(255), user_id varchar(255), primary key (id))
;
create table oauth_client_details (id bigint generated by default as identity, access_token_validity integer not null, additional_information varchar(255), authorities varchar(255), authorized_grant_types varchar(255), autoapprove varchar(255), client_id varchar(255), client_secret varchar(255) not null, refresh_token_validity integer not null, resource_ids varchar(255), scope varchar(255), web_server_redirect_uri varchar(255), primary key (id))
;
create table oauth_code (id bigint generated by default as identity, authentication blob, code varchar(255), primary key (id))
;
create table privilege_def (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, privilege_desc varchar(1000), privilege_nm varchar(50) not null, primary key (id))
;
create table role_def (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, role_desc varchar(1000), role_nm varchar(50) not null, primary key (id))
;
create table role_privilege (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, privilege_id bigint not null, role_id bigint not null, primary key (id))
;
create table terms_def (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, disp_ord varchar(255) not null, ended_on timestamp not null, required boolean not null, started_on timestamp not null, terms_cd varchar(36) not null, terms_desc varchar(2147483647) not null, terms_nm varchar(50) not null, terms_owner_cd varchar(20) not null, terms_ver varchar(50) not null, primary key (id))
;
create table user_admin (user_id bigint generated by default as identity, admin_level integer not null, admin_status varchar(10) not null, applied_on timestamp not null, approved_on timestamp, primary key (user_id));
create table user_agrmnt (id bigint generated by default as identity, agree_state varchar(255) not null, created_on timestamp not null, option_val varchar(255), ref_id bigint, table_nm varchar(255), terms_id bigint not null, user_id bigint not null, primary key (id))
;
create table user_auth (id bigint generated by default as identity, last_auth_type varchar(10) not null, last_logged_on timestamp not null, app_id bigint not null, user_id bigint not null, primary key (id));
 create table user_config (id bigint generated by default as identity, created_by
 bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, dept_cd varchar(36), lang_cd varchar(100), user_id bigint not null, primary key (id))
 ;
create table user_device (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, enabled boolean not null, device_id bigint not null, user_id bigint not null, primary key (id))
;

create table user_inactive (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, addr1 varchar(100), addr2 varchar(100), birthday varchar(8), country_cd varchar(10), email varchar(50), enabled boolean not null, hospital_cd varchar(20), join_type varchar(20) not null, mileage integer, my_ci varchar(2048), phone_no varchar(30), post_no varchar(5), represent_ci varchar(2048), sex varchar(1), telecom_cd varchar(20), user_nm varchar(50), primary key (id));

create table user_inactive_log (id bigint generated by default as identity, actived_on timestamp, inactive_type varchar(20), inactived_on timestamp, user_id bigint, withdrawal_desc varchar(100), withdrawal_type varchar(20), primary key (id));

create table user_mst (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, addr1 varchar(100), addr2 varchar(100), birthday varchar(8), country_cd varchar(10), email varchar(50), enabled boolean not null, hospital_cd varchar(20), join_type varchar(20) not null, mileage integer, my_ci varchar(2048), phone_no varchar(30), post_no varchar(5), represent_ci varchar(2048), sex varchar(1), telecom_cd varchar(20), user_nm varchar(50), primary key (id))
;
 create table user_patient (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, agreed_on timestamp not null, enc_algo varchar(36) not null, patient_nm varchar(50) not null, patient_no varchar(256) not null, patient_rel varchar(20) not null, hospital_id bigint not null, user_id bigint not null, primary key (id))
 ;
create table user_role (id bigint generated by default as identity, created_by bigint not null, created_on timestamp not null, updated_by bigint, updated_on timestamp, role_id bigint not null, user_id bigint not null, primary key (id))
;
create table user_staff (id bigint generated by default as identity, created_on timestamp not null, dept_cd varchar(36) not null, dept_nm varchar(50) not null, duty_nm varchar(50) not null, emp_no varchar(36) not null, enabled boolean not null, hospital_cd varchar(20) not null, updated_on timestamp, user_id bigint not null, primary key (id))
;
alter table app_device add constraint FK32sanud1fkaubp3vwxkf2u63a foreign key (app_id) references app_mst;
alter table app_device add constraint FKb0n71t59crtjrwc43vcu2h7ya foreign key (user_device_id) references user_device;
alter table app_mst add constraint FKjojsnf8bf38l694l7vrpvdw4h foreign key (hospital_id) references hospital_mst;
alter table app_platform add constraint FK1fpfleleyivs77b7vpe5j1mra foreign key (app_id) references app_mst;
alter table auth_pwd add constraint FKiq8xkddtxsshacmkqokkv9gqt foreign key (user_auth_id) references user_auth;
alter table auth_simple add constraint FKn4pt43ys5jijputq2nrnv2nq4 foreign key (device_id) references device_mst;
alter table auth_simple add constraint FKgog9wrf61ecqafs57vqc62xq6 foreign key (user_auth_id) references user_auth;
alter table auth_sns add constraint FKbqr1s9h0ifnr7wqe8yjiiy8jw foreign key (user_auth_id) references user_auth;
alter table hospital_admin_map add constraint FKa87xahq93oxqy3jr22u6qncqe foreign key (hospital_id) references hospital_mst;
alter table hospital_admin_map add constraint FK5saxafrt5ehypi6eynrh2swnf foreign key (user_id) references user_admin;
alter table ip_access add constraint FKsd2c18kgieunyh97bac28r4wk foreign key (user_id) references user_mst;
alter table login_log add constraint FKik554vtrgdt74bqs64ntywv0l foreign key (user_id) references user_mst;
alter table role_privilege add constraint FK7htvjgsw86km0vrv0ci7j0siq foreign key (privilege_id) references privilege_def;
alter table role_privilege add constraint FKbt0u0miaivs1mmlq1yhyj9yb5 foreign key (role_id) references role_def;
alter table user_agrmnt add constraint FK7xtqyvibhn4wiykk7kn2cgxbm foreign key (terms_id) references terms_def;
alter table user_agrmnt add constraint FKfr8mwuw0gk1le28uy4jc77sab foreign key (user_id) references user_mst;
alter table user_auth add constraint FK2rp91yna77oocjb1bb5pmvykh foreign key (app_id) references app_mst;
alter table user_auth add constraint FKmh0gd887gsl7xpusqu2iibr89 foreign key (user_id) references user_mst;
alter table user_config add constraint FKsr8a5ccyqn571rgduymm8fvay foreign key (user_id) references user_mst;
alter table user_device add constraint FKrhckbkqhpkmb1uah2hv1n6pxf foreign key (device_id) references device_mst;
alter table user_device add constraint FKgxw00shw8jgqn8e7qvhd4559j foreign key (user_id) references user_mst;
alter table user_patient add constraint FK_UserPatient_Hospital foreign key (hospital_id) references hospital_mst;
alter table user_patient add constraint FK_UserPatient_User foreign key (user_id) references user_mst;
alter table user_role add constraint FKnbry34g9fawsewmgf062fptpo foreign key (role_id) references role_def;
alter table user_role add constraint FKbd77v306i2ok03uige0a9d68p foreign key (user_id) references user_mst;
alter table user_staff add constraint FK8pfn76d1g3qmf76ggritjnndj foreign key (user_id) references user_mst; 

 

