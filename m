Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tK0ny-0003h2-9A
	for mharc-qemu-rust@gnu.org; Sat, 07 Dec 2024 14:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tK0nx-0003gt-5o
 for qemu-rust@nongnu.org; Sat, 07 Dec 2024 14:49:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tK0nv-0001Sz-GZ
 for qemu-rust@nongnu.org; Sat, 07 Dec 2024 14:49:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733600965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iJ38KFxeEicoe26CJnuslmuwfs1D+iB5zikfUjgUXl4=;
 b=TwFIylS1o97NGM73+0pAkJ66ttO/E6tF5Ab7yOXnYjE8yBpksJ089p2U1+K3+oLJvzRrlj
 udkGJCCCqe6TL/aXiP/0CfPIe7sCoZFB9IdQZUHVpwtbEmDkhJ3jlXjWk1nOWIrKVANABs
 eYMMQ4bYB8SAkQtwYkNPcvYn2DtbIO4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-UhDIIIO4Mqia_6trNUfZBw-1; Sat, 07 Dec 2024 14:49:24 -0500
X-MC-Unique: UhDIIIO4Mqia_6trNUfZBw-1
X-Mimecast-MFC-AGG-ID: UhDIIIO4Mqia_6trNUfZBw
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385d735965bso1752329f8f.1
 for <qemu-rust@nongnu.org>; Sat, 07 Dec 2024 11:49:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733600963; x=1734205763;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iJ38KFxeEicoe26CJnuslmuwfs1D+iB5zikfUjgUXl4=;
 b=VlBrCBfKWBZdjGfs0/OxBy56s6vGncLIpuYS4QE7bvg+kGtFNNZrOEaa9vVaLuk5A3
 +MXNHcWsiNdn+Xf9eWlj4gGbvgslKH5E+2xTqoxLdD3oQhTqgbCUYbNwaUtQYM1J+2hk
 EUXr5f98s4SzaKhiZ/vH6u98S/xRWC/cB18cD49HKeTzUBubwSfnZULNoFQCutWL4MFG
 scAWzTA/Zl7Pg5OoHjt7FDpo6fu3yP9iae9/LxqHXKWB/QNqapAeVz7B8gixsjKK1A2O
 Y2GTuHeZJpAkQ83m9iCz7Eui8yyaiyyUlRBgMQTsXtWXAkGj8jdxjaizBdFzhgug04tr
 G47Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX7MWNWK6ekcfbIZUP2J8DxUo0pDnBNkuJTJX1/Zi9pai41s7KYPhRW0jC6DAcz2+Wy4JzpdVpZic=@nongnu.org
X-Gm-Message-State: AOJu0YxgmCSE8MPYdqCJYSLZpdgFgJWVWMnN9nha6L9tETim1iPc7XKt
 4hdXX4csagwKgKzLc+BH6rNQqTBF5wjWgR0eyHZ/an+W20efPQDMa9tknsCVAC7v+3v2v7JHddu
 dfahFFs2UGR4s2Y10ZcYeD4z+aAFsqYZ2ozYvr9l594VfbKMAXhwncyY/T37Kf+NL2Rh5xnUYya
 +9022Ijn0s9PUDk+s5QinbqoUIEg==
X-Gm-Gg: ASbGnctgZpXDcWcjv7R5oHvnGrU1VFIFM8sPjMor/Oh0/4F67lSBYhVqIgd1AU2YrlH
 tCYEGm+keOAvlKpK4gtv3RDGqPAMfDQ==
X-Received: by 2002:a05:6000:70a:b0:386:1cf9:b96e with SMTP id
 ffacd0b85a97d-3862b3f6940mr5688077f8f.55.1733600963109; 
 Sat, 07 Dec 2024 11:49:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEt1u/JBIIrOPpfqteBxobI36Du+0+EnSE2cCmrDz7/8HoWcn3N3qzd11mbe436Rl7v7OO2Z8zfhJi6IyfSW8=
X-Received: by 2002:a05:6000:70a:b0:386:1cf9:b96e with SMTP id
 ffacd0b85a97d-3862b3f6940mr5688061f8f.55.1733600962685; Sat, 07 Dec 2024
 11:49:22 -0800 (PST)
MIME-Version: 1.0
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-4-zhao1.liu@intel.com>
 <75edc6e5-e65f-40c0-90ee-6ac1fa018f5c@redhat.com> <Z1RwOR3RWQTjrnYs@intel.com>
In-Reply-To: <Z1RwOR3RWQTjrnYs@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 7 Dec 2024 20:49:11 +0100
Message-ID: <CABgObfZfDtThE2pEUb0KDEJRLDYS=u9kOh9851uY0JKHeOE=Qw@mail.gmail.com>
Subject: Re: [RFC 03/13] rust/cell: add get_mut() method for BqlCell
To: Zhao Liu <zhao1.liu@intel.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Junjie Mao <junjie.mao@hotmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yys5K1GinisgGZsQIdpDOgUzkumimijeggf8oDTa-3Q_1733600963
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000904a7b0628b36d2d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Dec 2024 19:49:29 -0000

--000000000000904a7b0628b36d2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il sab 7 dic 2024, 16:38 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> Thanks for pointing that out, I really didn't think of that, I
> understand how that would break the atomicity of the BQL lock, right?
>

Yes, but also the function seems unnecessary.

> impl fw_cfg_config {
> >     pub(crate) fn assign_hpet_id() -> usize {
> >         assert!(bql_locked());
> >         // SAFETY: all accesses go through these methods, which guarant=
ee

>         // that the accesses are protected by the BQL.
> >         let fw_cfg =3D unsafe { &mut *hpet_fw_cfg };
>
> Nice idea!
>
> >         if self.count =3D=3D u8::MAX {
> >             // first instance
> >             fw_cfg.count =3D 0;
> >         }
>
> Will something like =E2=80=9Canything that releases bql_lock=E2=80=9D hap=
pen here?


No, there are no function calls even.

There seems to be no atomicity guarantee here.
>

It's not beautiful but it's guaranteed to be atomic. For the rare case of
static mut, which is unsafe anyway, it makes sense.

>
> >         if fw_cfg.count =3D=3D 8 {
> >             // TODO: Add error binding: error_setg()
> >             panic!("Only 8 instances of HPET is allowed");
> >         }
> >
> >         let id: usize =3D fw_cfg.count.into();
> >         fw_cfg.count +=3D 1;
> >         id
> >     }
> > }
> >
> > and you can assert bql_locked by hand instead of using the BqlCell.
>
> Thanks! I can also add a line of doc for bql_locked that it can be used
> directly without BqlCell if necessary.
>

Good idea!

And if you also agree the Phillipe's idea, I also need to add BqlCell
> for fw_cfg field in HPETClass :-).
>

No, that also breaks compilation with CONFIG_HPET=3Dn. The idea is nice but
it doesn't work. =C2=AF=E2=81=A0\=E2=81=A0_=E2=81=A0(=E2=81=A0=E3=83=84=E2=
=81=A0)=E2=81=A0_=E2=81=A0/=E2=81=A0=C2=AF

Paolo


> Regards,
> Zhao
>
>
>

--000000000000904a7b0628b36d2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il sab 7 dic 2024, 16:38 Zhao Liu &lt;<a href=3D"mailt=
o:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; ha scritto:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Thanks for pointing that out=
, I really didn&#39;t think of that, I<br>
understand how that would break the atomicity of the BQL lock, right?<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, b=
ut also the function seems unnecessary.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">&gt; impl fw_cfg_config {<br>
&gt;=C2=A0 =C2=A0 =C2=A0pub(crate) fn assign_hpet_id() -&gt; usize {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert!(bql_locked());<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// SAFETY: all accesses go through th=
ese methods, which guarantee</blockquote></div></div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// that the accesses are protected by=
 the BQL.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let fw_cfg =3D unsafe { &amp;mut *hpe=
t_fw_cfg };<br>
<br>
Nice idea!<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.count =3D=3D u8::MAX {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// first instance<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fw_cfg.count =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Will something like =E2=80=9Canything that releases bql_lock=E2=80=9D happe=
n here?</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">No, there are no function calls even.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
There seems to be no atomicity guarantee here.<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s not beautiful but it=
&#39;s guaranteed to be atomic. For the rare case of static mut, which is u=
nsafe anyway, it makes sense.</div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if fw_cfg.count =3D=3D 8 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO: Add error bind=
ing: error_setg()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panic!(&quot;Only 8 ins=
tances of HPET is allowed&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let id: usize =3D fw_cfg.count.into()=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fw_cfg.count +=3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; }<br>
&gt; <br>
&gt; and you can assert bql_locked by hand instead of using the BqlCell.<br=
>
<br>
Thanks! I can also add a line of doc for bql_locked that it can be used<br>
directly without BqlCell if necessary.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Good idea!</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
And if you also agree the Phillipe&#39;s idea, I also need to add BqlCell<b=
r>
for fw_cfg field in HPETClass :-).<br></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">No, that also breaks compilation with CON=
FIG_HPET=3Dn. The idea is nice but it doesn&#39;t work. =C2=AF=E2=81=A0\=E2=
=81=A0_=E2=81=A0(=E2=81=A0=E3=83=84=E2=81=A0)=E2=81=A0_=E2=81=A0/=E2=81=A0=
=C2=AF</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Zhao<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000904a7b0628b36d2d--


