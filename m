Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tavYo-0006gs-8C
	for mharc-qemu-rust@gnu.org; Thu, 23 Jan 2025 06:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tavYi-0006gG-Dr
 for qemu-rust@nongnu.org; Thu, 23 Jan 2025 06:39:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tavYg-0004tS-2T
 for qemu-rust@nongnu.org; Thu, 23 Jan 2025 06:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737632373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NfIPI43CAMMrZiN3MykY/a/0KgySdDMND+MClJN4K+0=;
 b=WBwyxfsmcRMh/6GnSQUvza5phj9cgOFZoXuL5brIaHWShNZZq/FmSz0R3VplJjtaggcmaH
 SiJ57/LtME+3L4o9qPFlcEZxvbkD2GgkdzIG11THwn7qPsRo9Ilbg3lRDJduOkoI1TDff+
 JHR5DqdDYpuSsShYVvHRjGBaqCLnryI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-t2oUp_Z3MzK0CkE8t3ET5A-1; Thu, 23 Jan 2025 06:39:32 -0500
X-MC-Unique: t2oUp_Z3MzK0CkE8t3ET5A-1
X-Mimecast-MFC-AGG-ID: t2oUp_Z3MzK0CkE8t3ET5A
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4359206e1e4so5595145e9.2
 for <qemu-rust@nongnu.org>; Thu, 23 Jan 2025 03:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737632371; x=1738237171;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NfIPI43CAMMrZiN3MykY/a/0KgySdDMND+MClJN4K+0=;
 b=UTiT5up8MsdLywoy7n+sobXbc/bcGV8nIKQZE3DQKRbQY1aWTt3SuRSuCqfYfh8xus
 9lnoZrOMNG5l0v6tBIoEfZAyW1nnLcyv7Y6De5/tYEbMECcG3j3MJnXWFiD7xn49R7OC
 /m6xdLV9bTRCUPMwzyb6sMOEBotmiMBfO6Hf/uLtM49py4yoiXiUCTxRePTYzd4JZZN6
 TRSmDv4fUfeN8rG7/kdMEJAUlwTRxp/ewfV62ntPjrdt94+eQp5ZpMPb/plsIrdeJTrI
 SM6rpfBtFfzqb8I/3jOU95XtUxMJSM+B1kORKc5BnOMAKuq8nt4UUuAqe3PHUmfA7SYA
 6qvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/n0hDtr+hjwraBj5BFtNY2iDpynaR+Jk3rDsvela0AkqFy2MrE0W/0gLhgd+6G/uKAtvUIdKyVCY=@nongnu.org
X-Gm-Message-State: AOJu0YyXd+7z45iXaVknDPu5BW0UcBwgZXIOkTdD25EjVUrfox38GRvx
 ynR4hEz+ErlXukdGgZhuYnP9qJun6wOWVZLq99m/gK7umV0E2P0fyOWTgifEJzJh7EdsHtSk8mO
 9ftli5HlhlGDJdc8zwWZYJPU6vgAElaM8eyRZTwuQ53/TzX7orS/THX/K1/fEhq3uMBTvDi17Br
 /GbVLaEDCiXW2Z8YzIkSJwe/LCJ3XlfntaLsEr
X-Gm-Gg: ASbGncuw9kN71WUVXyNis8uqJ97wrwQG/XQP1M+vUXbnMPXcfDgZm7o2v+JsOGt2aCa
 MSxcqPN+U1rmkwCBbwsyz+pWX9t6Ek3DQWi0hioGCov1AMKtgooo=
X-Received: by 2002:a5d:6d86:0:b0:388:c75d:be97 with SMTP id
 ffacd0b85a97d-38bf564960cmr24214478f8f.11.1737632370689; 
 Thu, 23 Jan 2025 03:39:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8W9KZ08JbT0ArBgx0yPrzTDMvKQObHmGD9FAqVYg0Zsb/Ahfi73r+I/JrwK5gpONkkNK9nowhgaglsgTgIIk=
X-Received: by 2002:a5d:6d86:0:b0:388:c75d:be97 with SMTP id
 ffacd0b85a97d-38bf564960cmr24214452f8f.11.1737632370303; Thu, 23 Jan 2025
 03:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20250117092657.1051233-1-pbonzini@redhat.com>
 <20250117092657.1051233-8-pbonzini@redhat.com>
 <Z5HX2G0+bt+3vzVB@intel.com>
 <CABgObfYRG-BFGj3cK4xz_PZYSiVgCY-YkSJitQMSk=2AtkcBcA@mail.gmail.com>
 <Z5IK1zuMJS+P3t9j@intel.com>
In-Reply-To: <Z5IK1zuMJS+P3t9j@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 23 Jan 2025 12:39:18 +0100
X-Gm-Features: AWEUYZlXxmU1Wa29oudi5DaxTYLqCkerx3HFfJCwxbdVS6jXOB4tjsQ3XugBfnY
Message-ID: <CABgObfbKqQFe8TXi2idjJs_WJZDVs=M02LTq5T9nJqLU1Gd7dg@mail.gmail.com>
Subject: Re: [PATCH 07/10] rust: pl011: wrap registers with BqlRefCell
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E68zym_ntQH1i7Rh9QoxV7HIFfrK23l7no-e2mAPguY_1737632371
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002ec368062c5e10d2"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Jan 2025 11:39:42 -0000

--0000000000002ec368062c5e10d2
Content-Type: text/plain; charset="UTF-8"

Il gio 23 gen 2025, 10:05 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> > I will double check. But I do see that there is no mut access inside, at
> > least not until the qemu_chr_fe_accept_input() is moved here.
> Unfortunately
> > until all MemoryRegion and CharBackend bindings are available the uses of
> > &mut and the casts to *mut are really really wonky.
>
> yes, I agree here we should remove mut :-). (if needless_pass_by_ref_mut
> doesn't work on this place, I think we can drop it.)
>

&mut is not needed here, but it is needed in write(). After accept_input()
is moved to out of memory_ops.rs, the #[allow] can be removed.

I will do that in v2.

Paolo


> > (On the other hand it wouldn't be possible to have a grip on the qemu_api
> > code without users).
> >
> > Paolo
> >
> > > @@ -603,19 +603,19 @@ pub fn realize(&mut self) {
> > > >      }
> > > >
> > > >      pub fn reset(&mut self) {
> > >
> > > In principle, this place should also trigger
> `needless_pass_by_ref_mut`.
> > >
> >
> > Yes but clippy hides it because this function is assigned to a function
> > pointer const. At least I think so---the point is more generally that you
> > can't change &mut to & without breaking compilation.
>
> Make sense!
>
> > > > -        self.regs.reset();
> > > > +        self.regs.borrow_mut().reset();
> > > >      }
> > >
> > > [snip]
> > >
> > > > @@ -657,10 +657,10 @@ pub fn post_load(&mut self, _version_id: u32)
> ->
> > > Result<(), ()> {
> > > >  pub unsafe extern "C" fn pl011_receive(opaque: *mut c_void, buf:
> *const
> > > u8, size: c_int) {
> > > >      unsafe {
> > > >          debug_assert!(!opaque.is_null());
> > > > -        let mut state =
> > > NonNull::new_unchecked(opaque.cast::<PL011State>());
> > > > +        let state =
> NonNull::new_unchecked(opaque.cast::<PL011State>());
> > >
> > > Perhaps we can use NonNull::new and unwrap()? Then debug_assert! is
> > > unnecessary.
> > >
> > > let state = unsafe {
> > > NonNull::new(opaque.cast::<PL011State>()).unwrap().as_ref() };
> > >
> >
> > Yeah, though that's preexisting and it's code that will go away
> relatively
> > soon. I tried to minimize unrelated changes and changes to these
> temporary
> > unsafe functions, but in some cases there were some that sneaked in.
> >
> > Let me know what you prefer.
> >
>
> I prefer to use NonNull::new and unwrap(). Too much assert() pattern is
> not user-friendly. I also think it's unnecessary to change NonNull
> interface in this patch, we can see what's left when you're done with
> the most QAPI work.
>
> Thanks,
> Zhao
>
>
>

--0000000000002ec368062c5e10d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il gio 23 gen 2025, 10:05 Zhao L=
iu &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; h=
a scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; =
I will double check. But I do see that there is no mut access inside, at<br=
>
&gt; least not until the qemu_chr_fe_accept_input() is moved here. Unfortun=
ately<br>
&gt; until all MemoryRegion and CharBackend bindings are available the uses=
 of<br>
&gt; &amp;mut and the casts to *mut are really really wonky.<br>
<br>
yes, I agree here we should remove mut :-). (if needless_pass_by_ref_mut<br=
>
doesn&#39;t work on this place, I think we can drop it.)<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">&amp;mut is not nee=
ded here, but it is needed in write(). After accept_input() is moved to out=
 of <a href=3D"http://memory_ops.rs">memory_ops.rs</a>, the #[allow] can be=
 removed.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I will do that=
 in v2.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_qu=
ote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; (On the other hand it wouldn&#39;t be possible to have a grip on the q=
emu_api<br>
&gt; code without users).<br>
&gt; <br>
&gt; Paolo<br>
&gt; <br>
&gt; &gt; @@ -603,19 +603,19 @@ pub fn realize(&amp;mut self) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 pub fn reset(&amp;mut self) {<br>
&gt; &gt;<br>
&gt; &gt; In principle, this place should also trigger `needless_pass_by_re=
f_mut`.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Yes but clippy hides it because this function is assigned to a functio=
n<br>
&gt; pointer const. At least I think so---the point is more generally that =
you<br>
&gt; can&#39;t change &amp;mut to &amp; without breaking compilation.<br>
<br>
Make sense!<br>
<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.regs.reset();<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.regs.borrow_mut().reset();=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; [snip]<br>
&gt; &gt;<br>
&gt; &gt; &gt; @@ -657,10 +657,10 @@ pub fn post_load(&amp;mut self, _versi=
on_id: u32) -&gt;<br>
&gt; &gt; Result&lt;(), ()&gt; {<br>
&gt; &gt; &gt;=C2=A0 pub unsafe extern &quot;C&quot; fn pl011_receive(opaqu=
e: *mut c_void, buf: *const<br>
&gt; &gt; u8, size: c_int) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 unsafe {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug_assert!(!opaque.is_n=
ull());<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut state =3D<br>
&gt; &gt; NonNull::new_unchecked(opaque.cast::&lt;PL011State&gt;());<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 let state =3D NonNull::new_unch=
ecked(opaque.cast::&lt;PL011State&gt;());<br>
&gt; &gt;<br>
&gt; &gt; Perhaps we can use NonNull::new and unwrap()? Then debug_assert! =
is<br>
&gt; &gt; unnecessary.<br>
&gt; &gt;<br>
&gt; &gt; let state =3D unsafe {<br>
&gt; &gt; NonNull::new(opaque.cast::&lt;PL011State&gt;()).unwrap().as_ref()=
 };<br>
&gt; &gt;<br>
&gt; <br>
&gt; Yeah, though that&#39;s preexisting and it&#39;s code that will go awa=
y relatively<br>
&gt; soon. I tried to minimize unrelated changes and changes to these tempo=
rary<br>
&gt; unsafe functions, but in some cases there were some that sneaked in.<b=
r>
&gt; <br>
&gt; Let me know what you prefer.<br>
&gt;<br>
<br>
I prefer to use NonNull::new and unwrap(). Too much assert() pattern is<br>
not user-friendly. I also think it&#39;s unnecessary to change NonNull<br>
interface in this patch, we can see what&#39;s left when you&#39;re done wi=
th<br>
the most QAPI work.<br>
<br>
Thanks,<br>
Zhao<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000002ec368062c5e10d2--


