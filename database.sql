--����
--1.����ѧ������XJMS�����ݿ�
create database XJMS
--2.����һ��ѧԺ��Collage����
CREATE TABLE Collage
(Cono varchar(10) PRIMARY KEY,
Coname varchar(20) NOT NULL,
Coheader varchar(8) NOT NULL,
);
--3.����һ��רҵ��Professional����
CREATE TABLE Professional
(Spno varchar(10) PRIMARY KEY ,
Spname varchar(20) NOT NULL,
Spheader varchar(10) NOT NULL,
Cono varchar(10) NOT NULL,
FOREIGN KEY (Cono) REFERENCES Collage(Cono)
ON UPDATE CASCADE
ON DELETE CASCADE
);
--4.����һ��ѧ��������Ϣ��Student����
CREATE TABLE Student
(Sno varchar(10)  PRIMARY KEY , 
Sname varchar(8)  NOT NULL,
Ssex varchar(4)  CHECK (Ssex IN('��','Ů')),
Sbirthday varchar(8) NOT NULL,
Sid varchar(18) NOT NULL,
Spno varchar(10)  NOT NULL, 
Sxz int  NOT NULL,
Cono varchar(10)  NOT NULL,
Sclass varchar(10) NOT NULL,
Sarea varchar(10) NOT NULL,
Sage int,
Szzmm varchar(10) NOT NULL,
Snation varchar(10) NOT NULL,
Sxjzt varchar(20) NOT NULL,
Remark varchar(50) ,
CHECK (Sxz BETWEEN 2 AND 5),
CHECK (Sno BETWEEN 0000000000 AND 9999999999),
FOREIGN  KEY  (Cono)  REFERENCES  Collage(Cono)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Spno) REFERENCES Professional (Spno)
);
--5.����һ���γ̣�Course����
CREATE TABLE Course
(Cno varchar(10) PRIMARY KEY ,
Cname varchar(20) NOT NULL,
Credit float CHECK (Credit BETWEEN 0.5 AND 20),
);
--6.����һ����ʦ������Ϣ��Teacher����
CREATE TABLE Teacher
(Tno varchar(10) PRIMARY KEY,
Tname varchar(8) NOT NULL,
Tsex varchar(4) CHECK (Tsex IN('��','Ů')),
Tage int CHECK (Tage BETWEEN 25 AND 75),
Cono varchar(10) NOT NULL,
);
--7.����һ��ѡ�Σ�SC����
CREATE TABLE SC
(Sno varchar(10) NOT NULL,
Cno varchar(10) NOT NULL,
Grade int CHECK (Grade BETWEEN 0 AND 100),
CHECK (Sno BETWEEN 0000000000 AND 9999999999),
PRIMARY KEY (Sno,Cno),
FOREIGN KEY (Sno) REFERENCES  Student(Sno)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Cno) REFERENCES  Course(Cno)
ON UPDATE CASCADE
ON DELETE CASCADE
);
--8.����һ���ڿΣ�TC����
CREATE TABLE TC
(Tno varchar(10) NOT NULL,
Cno varchar(10) NOT NULL,
Student int, CHECK (student BETWEEN 30 AND 150),
PRIMARY KEY (Tno,Cno),
FOREIGN KEY (Tno) REFERENCES  Teacher(Tno)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Cno) REFERENCES  Course(Cno)
ON UPDATE CASCADE
ON DELETE CASCADE,
);
--9.����һ���������ͣ�JC����
CREATE TABLE JC
(JCno varchar(10) NOT NULL,
JCname varchar(40) NOT NULL,
PRIMARY KEY (JCno)
);
--10.����һ�����ͼ�¼��JCS����
CREATE TABLE JCS
(JCno varchar(10) NOT NULL,
Sno varchar(10) NOT NULL,
JCtime varchar(8) NOT NULL,
PRIMARY KEY (JCno,Sno),
FOREIGN KEY (JCno) REFERENCES JC(JCno)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Sno) REFERENCES Student(Sno)
ON UPDATE CASCADE
ON DELETE CASCADE
);
--��������
--1.��ѧԺ��Collage�����в�������
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('03','��ȫ��ѧ�빤��ѧԺ','����')
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('05','��������ƹ���ѧԺ','������')
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('06','��������Ϣ����ѧԺ','�ﾢ��')
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('10','���̹���ѧԺ','�Ա���')
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('18','Ӫ������ѧԺ','���')
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('20','���ѧԺ','�����')
INSERT INTO Collage(Cono,Coname,Coheader)
VALUES ('26','��ҵ����ѧԺ','¬����')
--2.��רҵ��Professional�����в�������
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('2001','�������','��ΰ','20')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('2002','���繤��','�º�','20')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('2003','Ƕ��ʽ�������','����Ⱥ','20')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0301','��ȫ����','����','03')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0302','��ȫ���̿�ɽͨ��','����','03')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0501','�Զ��� ','����','05')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0502','���ܵ�����Ϣ����','����','05')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0503','�������������ܿ���','Ǯ��','05')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0504','�������̼����Զ���','���','05')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0505','��ؼ���������','���','05')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0601','�������ѧ�뼼��','��ʮ','06')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0602','ͨ�Ź���','��ʮһ','06')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0603','������Ϣ����','֣ʮ��','06')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('0604','���ӿ�ѧ�뼼��','��ʮ��','06')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('1001','���̹���','��ʮ��','10')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('1002','���','��ʮ��','10')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('1003','��Ϣ��������Ϣϵͳ','Ǯʮ��','10')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('1801','�г�Ӫ��','��ʮ��','18')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('1802','��������','��ʮ��','18')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('2601','��ȫ����','����','26')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('2602','�Զ��� ','����','26')
INSERT INTO Professional(Spno,Spname,Spheader,Cono)
VALUES ('2603','���̹���','��ʮ��','26')
--3.�ڽ�ʦ������Ϣ��Teacher�����в�������
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11001','�����','��',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11002','������','��',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11003','���Ʒ�','��',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11004','�ź���','��',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11005','�º�','Ů',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11006','����Ⱥ','Ů',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)   
VALUES ('11007','��ΰ','Ů',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11008','Ф���','��',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11009','������','��',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)   
VALUES ('11010','����Ȼ','��',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11011','����','��',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11012','Ф����','��',30,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11013','���','��',55,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11014','����','��',30,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)   
VALUES ('11015','������','��',30,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)   
VALUES ('11016','������','��',30,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11017','������','��',50,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono)  
VALUES ('11018','��־��','Ů',50,'20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11019','������', '��',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11020','������', '��',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11021','��С��', '��',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11022','����', '��',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11023','����', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11024','����÷', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11025','�䵤��', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11026','��ѩ', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11027','������', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11028','�����', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11029','��ɺɺ', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11030','�콿��', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11031','�����', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11032','������', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11033','��ѩ', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11034','���弪', '��',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11035','������', '��',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11036','���ܹ�', '��',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11037','�', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11038','����', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11039','������', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11040','��ɺɺ', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11041','�޾���', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11042','�Ż�', '��',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11043','�ž�', '��',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11044','������', 'Ů',30, '20')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11045','����', '��',30, '03')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11046','����', '��',30, '03')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11047','����', '��',30, '03')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11048','����', 'Ů',30, '03')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11049','Ǯ��', 'Ů',30, '03')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11050','����', '��',30, '05')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11051','����', '��',30, '05')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11052','����', '��',30, '05')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11053','����', 'Ů',30, '05')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11054','Ǯ��', 'Ů',30, '05')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11055','����', '��',30, '06')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11056','����', '��',30, '06')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11057','����', '��',30, '06')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11058','����', 'Ů',30, '06')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11059','Ǯ��', 'Ů',30, '06')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11060','����', '��',30, '10')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11061','����', '��',30, '10')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11062','����', '��',30, '10')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11063','����', 'Ů',30, '10')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11064','Ǯ��', 'Ů',30, '10')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11065','����', '��',30, '18')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11066','����', '��',30, '18')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11067','����', '��',30, '18')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11068','����', 'Ů',30, '18')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11069','Ǯ��', 'Ů',30, '18')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11070','����', '��',30, '26')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11071','����', '��',30, '26')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11072','����', '��',30, '26')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11073','����', 'Ů',30, '26')
INSERT INTO Teacher(Tno,Tname,Tsex,Tage,Cono) 
VALUES ('11074','Ǯ��', 'Ů',30, '26')
--4.�ڿγ̣�Course�����в�������
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200121064','����ϵͳ',4.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200126032','רҵ����',2.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200130064','���������������',4.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200138064','���������',4.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200143032','Ƕ��ʽϵͳ����',2.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200124048 ','�������',3.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200136064 ','�������ĳ������',4.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200135072 ','���ݽṹ',4.5)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200124056','���ݿ�ԭ��Ӧ��',3.5)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200139064',' .NET��ܳ������',4.0)
INSERT INTO Course(Cno,Cname,Credit) 
VALUES ('H200137040',' ΢��ԭ��Ӧ��',2.5)
--5.��ѧ��������Ϣ��Student�����в�������
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1620980101', '����', '��', '19940101', '210102199401010101', '2001', '2', '20', '������16-1', '����', '22', '������Ա', '��', '����', '��')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1620980102', '����', '��', '19940101', '210102199401010101', '2001', '2', '20', '������16-1', '����', '22', '������Ա', '��', '����', '��')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1620980103', '����', '��', '19940101', '210102199401010101', '2001', '2', '20', '������16-1', '����', '22', '������Ա', '��', '��ѧ', '��')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1620980104', '����', '��', '19940101', '210102199401010101', '2001', '2', '20', '������16-1', '����', '22', '������Ա', '��', '��ѧ', '��')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1603010101', '����', '��', '19940101', '210102199401010101', '0301', '4', '03', '��ȫ16-1', '����', '22', '������Ա', '��', '����', '��')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1603010102', '����', '��', '19940101', '210102199401010101', '0301', '4', '03', '��ȫ16-1', '����', '22', '������Ա', '��', '����', '��')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1603010103', '����', '��', '19940101', '210102199401010101', '0301', '4', '03', '��ȫ16-1', '����', '22', '������Ա', '��', '��ѧ', '��')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1603010104', '����', '��', '19940101', '210102199401010101', '0301', '4', '03', '��ȫ16-1', '����', '22', '������Ա', '��', '��ѧ', '��')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1605010101', '����', '��', '19940101', '210102199401010101', '0501', '4', '05', '�Զ���16-1', '����', '22', '������Ա', '��', '����', '��')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1605010102', '����', '��', '19940101', '210102199401010101', '0501', '4', '05', '�Զ���16-1', '����', '22', '������Ա', '��', '����', '��')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1605010103', '����', '��', '19940101', '210102199401010101', '0501', '4', '05', '�Զ���16-1', '����', '22', '������Ա', '��', '��ѧ', '��')
INSERT  INTO Student
(Sno,Sname,Ssex,Sbirthday,Sid,Spno,Sxz,Cono,Sclass,Sarea,Sage,Szzmm,Snation,Sxjzt,Remark)
VALUES
('1605010104', '����', '��', '19940101', '210102199401010101', '0501', '4', '05', '�Զ���16-1', '����', '22', '������Ա', '��', '��ѧ', '��')
--6.��ѡ�Σ�SC�����в�������
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1620980101','H200121064',70)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1620980102','H200121064',68)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1620980101','H200124048',70)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1620980102','H200124048',68)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1603010101','H200126032',70)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1603010102','H200126032',80)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1603010101','H200136064',70)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1603010102','H200136064',74)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1605010101','H200126032',70)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1605010102','H200126032',80)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1605010101','H200136064',70)
INSERT INTO SC(Sno,Cno,Grade) 
VALUES ('1605010102','H200136064',74)
--7.���ڿΣ�TC�����в�������
INSERT 
INTO TC(Tno,Cno,student) 
VALUES ('11001','H200121064',120)
INSERT 
INTO TC(Tno,Cno,student) 
VALUES ('11002','H200124048',120)
INSERT 
INTO TC(Tno,Cno,student) 
VALUES ('11003','H200126032',120)
INSERT 
INTO TC(Tno,Cno,student) 
VALUES ('11004','H200136064',120)
--8.�ڽ������ͣ�JC�����в�������
INSERT 
INTO JC(JCno,JCname) 
VALUES('1','����')
INSERT 
INTO JC(JCno,JCname) 
VALUES('2','�ͷ�')
INSERT 
INTO JC(JCno,JCname) 
VALUES('3','�佱')
INSERT 
INTO JC(JCno,JCname) 
VALUES('4','ͨ��')
--9.�ڽ��ͼ�¼��JCS�����в�������
INSERT 
INTO JCS(JCno,Sno,JCtime) 
VALUES('1','1620980101','20161101')
INSERT 
INTO JCS(JCno,Sno,JCtime) 
VALUES('1','1603010101','20161101')
INSERT 
INTO JCS(JCno,Sno,JCtime) 
VALUES('1','1605010101','20161101')
INSERT 
INTO JCS(JCno,Sno,JCtime) 
VALUES('2','1620980102','20161101')
INSERT 
INTO JCS(JCno,Sno,JCtime) 
VALUES('2','1603010102','20161101')
INSERT 
INTO JCS(JCno,Sno,JCtime) 
VALUES('2','1605010102','20161101')
--����
--1.����ѧ����Ϣ
UPDATE Student
SET Sxjzt='����'
WHERE Sno='1603010103'
--2.���³ɼ���Ϣ
UPDATE SC
SET Grade='85'
WHERE Sno=' 1620980102'
AND Cno=' H200124048'
--3.���½�����Ϣ
UPDATE JC
SET JCname='���ʽ���'
WHERE JCno='1'
--4.��ѯ�ɼ���Ϣ
SELECT Student.Sno, Sname, Course.Cno,Cname, Teacher.Tno, Tname,Grade
FROM SC,Course,Student,Teacher,TC
WHERE SC.Cno=Course.Cno AND SC.Sno=Student.Sno AND TC.Cno=SC.Cno AND TC.Tno=Teacher.Tno
--5.������Ϣ��ѯ
SELECT * FROM Student
--6.ѧ��״̬��ѯ
SELECT Sno,Sname,Sxjzt
FROM Student
--7.������Ϣ��ѯ
SELECT Student.Sno,Sname,JC.JCno,JCname,JCtime
FROM JC,JCS,Student
WHERE JC.JCno=JCS.JCno AND JCS.Sno=Student.Sno
--8.����ͳ��
select  
(select (count(Grade)*1.0/(select count(sNo)as"������"from SC))as "90-100�ֵİٷ���" from SC Where Grade >=90 And Grade <=100)as "90-100�ֵİٷ���",
(select (count(Grade)*1.0/(select count(sNo)as"������"from SC))as "80-89�ֵİٷ���" from SC Where Grade >=80 And Grade <=89)as "80-89�ֵİٷ���",
(select (count(Grade)*1.0/(select count(sNo)as"������"from SC))as "70-79�ֵİٷ���" from SC Where Grade >=70 And Grade <=79)as "70-79�ֵİٷ���",
(select (count(Grade)*1.0/(select count(sNo)as"������"from SC))as "60-69�ֵİٷ���" from SC Where Grade >=60 And Grade <=69)as "60-69�ֵİٷ���",
(select (count(Grade)*1.0/(select count(sNo)as"������"from SC))as "60�ֵ����µİٷ���" from SC Where Grade <60)as "60�ֵ����µİٷ���",
(select count(Sage)as"16�������" from Student where Sage=16)as"16�������",
(select count(Sage)as"17�������" from Student where Sage=17)as"17�������",
(select count(Sage)as"18�������" from Student where Sage=18)as"18�������",
(select count(Sage)as"19�������" from Student where Sage=19)as"19�������",
(select count(Sage)as"20�������" from Student where Sage=20)as"20�������",
(select count(Sage)as"21�������" from Student where Sage=21)as"21�������",
(select count(Sage)as"22�������" from Student where Sage=22)as"21�������",
(select count(Sarea)as"������������������" from Student where Sarea='����')as"������������������",
(select count(Szzmm)as"������òΪ������Ա������" from Student where Szzmm='������Ա')as"������òΪ������Ա������"