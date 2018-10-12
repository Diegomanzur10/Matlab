prompt = {'Do you have something image in RGB colors (Y/N)?'};
dlg_title = 'Entry images';
[name] = uigetfile({'*.tif'},'File Selector')
D=imread(name);
figure(1); close 1; figure(1);
imshow(D);
title ('Colour Band');


x	(	1	)	=	622	;
x	(	2	)	=	725	;
x	(	3	)	=	733	;
x	(	4	)	=	811	;
x	(	5	)	=	634	;
x	(	6	)	=	663	;
x	(	7	)	=	605	;
x	(	8	)	=	547	;
x	(	9	)	=	640	;
x	(	10	)	=	930	;
x	(	11	)	=	348	;
x	(	12	)	=	442	;
x	(	13	)	=	544	;
x	(	14	)	=	773	;
x	(	15	)	=	664	;
x	(	16	)	=	656	;
x	(	17	)	=	628	;
x	(	18	)	=	474	;
x	(	19	)	=	640	;
x	(	20	)	=	672	;
x	(	21	)	=	650	;
x	(	22	)	=	613	;
x	(	23	)	=	595	;
x	(	24	)	=	541	;
x	(	25	)	=	540	;
x	(	26	)	=	597	;
x	(	27	)	=	570	;
x	(	28	)	=	581	;
x	(	29	)	=	576	;
x	(	30	)	=	565	;
x	(	31	)	=	0	;
x	(	32	)	=	770	;
x	(	33	)	=	774	;
x	(	34	)	=	599	;
x	(	35	)	=	526	;
x	(	36	)	=	339	;
x	(	37	)	=	637	;
x	(	38	)	=	616	;
x	(	39	)	=	569	;
x	(	40	)	=	638	;
x	(	41	)	=	629	;
x	(	42	)	=	729	;
x	(	43	)	=	436	;
x	(	44	)	=	508	;
x	(	45	)	=	478	;
y	(	1	)	=	538	;
y	(	2	)	=	711	;
y	(	3	)	=	468	;
y	(	4	)	=	413	;
y	(	5	)	=	368	;
y	(	6	)	=	450	;
y	(	7	)	=	340	;
y	(	8	)	=	507	;
y	(	9	)	=	459	;
y	(	10	)	=	528	;
y	(	11	)	=	359	;
y	(	12	)	=	404	;
y	(	13	)	=	390	;
y	(	14	)	=	423	;
y	(	15	)	=	459	;
y	(	16	)	=	410	;
y	(	17	)	=	414	;
y	(	18	)	=	245	;
y	(	19	)	=	560	;
y	(	20	)	=	598	;
y	(	21	)	=	543	;
y	(	22	)	=	452	;
y	(	23	)	=	491	;
y	(	24	)	=	461	;
y	(	25	)	=	465	;
y	(	26	)	=	600	;
y	(	27	)	=	600	;
y	(	28	)	=	547	;
y	(	29	)	=	496	;
y	(	30	)	=	711	;
y	(	31	)	=	0	;
y	(	32	)	=	209	;
y	(	33	)	=	768	;
y	(	34	)	=	515	;
y	(	35	)	=	324	;
y	(	36	)	=	393	;
y	(	37	)	=	318	;
y	(	38	)	=	529	;
y	(	39	)	=	593	;
y	(	40	)	=	510	;
y	(	41	)	=	556	;
y	(	42	)	=	248	;
y	(	43	)	=	684	;
y	(	44	)	=	538	;
y	(	45	)	=	515	;





num_ima=input('Ingrese el numero de la foto')
Height=input('Ingrese la altura de la foto')

%xmin ymin width height
[w,h]=size(D);
if Height==10
    num_pix=w*h;
    m2_pix=108.05/1228800;
    m_pix=sqrt(m2_pix);
    length=w*m_pix;
    width=h*m_pix;
    
    I2 = imcrop(D,[x(num_ima)-250 y(num_ima)-250 450 450]);
    
elseif Height==20
    num_pix=w*h;
    m2_pix=432.21/1228800;
    m_pix=sqrt(m2_pix);
    length=w*m_pix;
    width=h*m_pix;
    
    I2 = imcrop(D,[x(num_ima)-210 y(num_ima)-210 400 400]);
    
    elseif Height==30
         num_pix=w*h;
         m2_pix=972.48/1228800;
         m_pix=sqrt(m2_pix);
         length=w*m_pix;
         width=h*m_pix; 
         
             I2 = imcrop(D,[x(num_ima)-140 y(num_ima)-140 300 300]);
         
        elseif Height==50
                num_pix=w*h;
                m2_pix=2701.33/1228800;
                m_pix=sqrt(m2_pix);
                length=w*m_pix;
                width=h*m_pix;
                
                 I2 = imcrop(D,[x(num_ima)-85 y(num_ima)-85 200 200]);
                
end
imshow(I2);



