Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiGjl-0007Ku-6o
	for mharc-qemu-rust@gnu.org; Wed, 12 Feb 2025 12:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiGji-0007EX-VH
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 12:41:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiGje-00069G-VW
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 12:41:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739382078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EW/yDsFugj9VWbHurSgjChytixU0To1xc8shpfuZWps=;
 b=Xi6bhCCXpmKcy3um4RsZsCE9hZAwUZN/GwIpDZJUHpMC3zYFc1q0uEGv609rGDLRuvypiq
 RF5qxEYAjhOeKDN2jHC8yhUgTwMRk25YWBxn0GaLd3YhuyhkHRORIN9BhWwX06Og8wCsLq
 Q69F0Fmqdv59ySHQZZI9WcnvxXkCGXU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-hJLVgPxmN3WO9sVdEzK3eA-1; Wed, 12 Feb 2025 12:41:16 -0500
X-MC-Unique: hJLVgPxmN3WO9sVdEzK3eA-1
X-Mimecast-MFC-AGG-ID: hJLVgPxmN3WO9sVdEzK3eA_1739382076
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43933bdcce0so32718115e9.2
 for <qemu-rust@nongnu.org>; Wed, 12 Feb 2025 09:41:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739382075; x=1739986875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EW/yDsFugj9VWbHurSgjChytixU0To1xc8shpfuZWps=;
 b=ePFmZ+UDtKMRpqoAw7TgNHApuXqpu0IJn9vJaFmMrx5kP43/QIOrfcDk4cjWx6pogR
 DLmZ470dVqabUYNR51oEv16gDOkBYlEt/DaLzt+BfCbR0aG1p0C/xROCIFvWoDEdPsuf
 c7/lm3F0UkUNJ9oOTYMI4wbP6dwj6K9fW1yTOFCXnYmpBfUGAiFE5Urmqcn6vG9qtVJG
 ilfoBe3rUsYk0VUPzAluf4aFfnDp/Vf72P0Su8xhTXYMiCz438iFTV1t9vYZ2m4KduHf
 HTd1QFOKy1/kbhwTiNMWnbfwPjzK4z/GGKFlpkw5OV3LtBahKCJUndkXKVc6IYsCHdX9
 96SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv75FlQ+oW9DpH6gZa0H5aEX2awvpam9SY+u4YH9czmoMRgbYn97MDyw5Jz5catPHdeBVsZnch/GA=@nongnu.org
X-Gm-Message-State: AOJu0Yy5hiBSjOdszGd9b64JhPWIlCQMn9tpVBvtu0vON718lbac9QfS
 zJZ+IPmNGA4YzbZrfWjxn/I7wqJzQ76BCTGSC1nIYzOdZmYhFaPpF4+P+Np0FAmXjHElR8eI4ld
 ssTAqW2PO7npMNfObVuItRtV1ZQhsSAy8O+prxgaMb9eS7or3VWXWlgAaL/2ZCjPuR7f1wu9MOG
 xhJco/qimLBR9qSnklBceWzm8eiA==
X-Gm-Gg: ASbGncvUgZMrsfoOxtZmgHioNYRI65/s5ILRykw67oyvqM2mgtfIuPUonv8ICL9UMle
 Hsw18Lm01DEVG2o0Gn73Kc7mPtQFilIBbO8lgAnLMMihks8R8wj94dRDkiaqH
X-Received: by 2002:a05:600c:19c8:b0:439:4827:73d with SMTP id
 5b1f17b1804b1-4395818fbc0mr40356005e9.18.1739382075543; 
 Wed, 12 Feb 2025 09:41:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMA9QWC+bkWGw1Sfd8WAspYpMoQLlN8sRhNWroRsORJHoc1FI8jFIDOecSuyjZkE6XpMpd0+WWGABxbLlR2Lw=
X-Received: by 2002:a05:600c:19c8:b0:439:4827:73d with SMTP id
 5b1f17b1804b1-4395818fbc0mr40355765e9.18.1739382075149; Wed, 12 Feb 2025
 09:41:15 -0800 (PST)
MIME-Version: 1.0
References: <20250211214328.640374-1-kwolf@redhat.com>
 <20250211214328.640374-7-kwolf@redhat.com>
 <b3241aed-0470-41c8-ae82-e492fd3802ee@redhat.com>
 <Z6zY8yZcKtUXoVib@redhat.com>
In-Reply-To: <Z6zY8yZcKtUXoVib@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 12 Feb 2025 18:41:05 +0100
X-Gm-Features: AWEUYZlX2-hTVzEgRC2gYErCbpszzP09CbIJ4_JM2NAngDNo1aPYwLI_aMUzGDA
Message-ID: <CABgObfYJr6pw9G0dFqUXWLAq2O+rFuFtoxrPs1KGcxdh0cKtew@mail.gmail.com>
Subject: Re: [PATCH 06/11] rust/block: Add I/O buffer traits
To: Kevin Wolf <kwolf@redhat.com>
Cc: "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Czenczek <hreitz@redhat.com>, 
 Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KMM-BfBLQPxPuzSHwvHSFfNog_fMPBZHkvgHK7AZ_pg_1739382076
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b7e830062df57228"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Wed, 12 Feb 2025 17:41:23 -0000

--000000000000b7e830062df57228
Content-Type: text/plain; charset="UTF-8"

Il mer 12 feb 2025, 18:23 Kevin Wolf <kwolf@redhat.com> ha scritto:

> Am 12.02.2025 um 17:48 hat Paolo Bonzini geschrieben:
> > On 2/11/25 22:43, Kevin Wolf wrote:
> > > +/// Implementing `SizedIoBuffer` provides an implementation for
> [`IoBuffer`] without having to
> > > +/// implement any functions manually.
> > > +///
> > > +/// # Safety
> > > +///
> > > +/// Types implementing `SizedIoBuffer` guarantee that the whole
> object can be accessed as an I/O
> > > +/// buffer that is safe to contain any byte patterns.
> > > +pub unsafe trait SizedIoBuffer: Sized {
> >
> > This is similar to the ByteValued trait in rust-vmm.  Can you name it
> > the same so that we can later consider replacing it?
>
> I'm not sure if it's the best name, but could be done, of course.
>
> Though the more interesting thing to replace it with eventually might be
> the zerocopy crate which has derive macros that check that the condition
> is actually fulfilled. I just didn't feel like bringing in new external
> dependencies in this first series.
>

Good idea though. zerocopy has no extra dependencies, and I agree that
sooner or later we're going to include it, so you might as well go for it.

The build.rs file is ludicrously overengineered, but converting it to meson
should be easy.

> > +    fn from_byte_slice(buf: &[u8]) -> Option<&Self> {
> > > +        if buf.len() < std::mem::size_of::<Self>() {
> > > +            return None;
> > > +        }
>
> This is a semantic difference compared to ByteValued::from_slice(),
> which requires the sizes to match exactly. For the probe function, I
> actually make use of the relaxed requirement here to access a header
> struct in a larger buffer passed from C.
>

Indeed it's similar but not the same. I haven't checked how you'd write it
with vm-memory (it could be hdr.as_bytes().read_obj(0), or maybe there's
something better), but it's something that could be added there too.

> If you want, the function can be written also
> >
> >     // SAFETY: implementing SizedIoBuffer promises that any byte pattern
> >     // is valid for the type
> >     match unsafe { buf.align_to::<Self>() } {
> >         ([], mid, _) => mid.get(0),
> >         _ => None
> >     }
> >
> > (trick stolen from rust-vmm, in fact).
>
> Clever way to avoid ptr::is_aligned(), but I feel a bit harder to
> understand than just open-coding it like above? (And probably less
> efficient, but I don't know how relevant that is.)
>

Probably not much and a lot of dead code elimination can happen, but either
way is fine of course.

Paolo



> Kevin
>
>

--000000000000b7e830062df57228
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 12 feb 2025, 18:23 Kevin =
Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; ha sc=
ritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 12.02.=
2025 um 17:48 hat Paolo Bonzini geschrieben:<br>
&gt; On 2/11/25 22:43, Kevin Wolf wrote:<br>
&gt; &gt; +/// Implementing `SizedIoBuffer` provides an implementation for =
[`IoBuffer`] without having to<br>
&gt; &gt; +/// implement any functions manually.<br>
&gt; &gt; +///<br>
&gt; &gt; +/// # Safety<br>
&gt; &gt; +///<br>
&gt; &gt; +/// Types implementing `SizedIoBuffer` guarantee that the whole =
object can be accessed as an I/O<br>
&gt; &gt; +/// buffer that is safe to contain any byte patterns.<br>
&gt; &gt; +pub unsafe trait SizedIoBuffer: Sized {<br>
&gt; <br>
&gt; This is similar to the ByteValued trait in rust-vmm.=C2=A0 Can you nam=
e it<br>
&gt; the same so that we can later consider replacing it?<br>
<br>
I&#39;m not sure if it&#39;s the best name, but could be done, of course.<b=
r>
<br>
Though the more interesting thing to replace it with eventually might be<br=
>
the zerocopy crate which has derive macros that check that the condition<br=
>
is actually fulfilled. I just didn&#39;t feel like bringing in new external=
<br>
dependencies in this first series.<br></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Good idea though. zerocopy has no extra d=
ependencies, and I agree that sooner or later we&#39;re going to include it=
, so you might as well go for it.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">The <a href=3D"http://build.rs">build.rs</a> file is ludicrously =
overengineered, but converting it to meson should be easy.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_co=
ntainer"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; &gt; +=C2=
=A0 =C2=A0 fn from_byte_slice(buf: &amp;[u8]) -&gt; Option&lt;&amp;Self&gt;=
 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if buf.len() &lt; std::mem::size_of:=
:&lt;Self&gt;() {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
This is a semantic difference compared to ByteValued::from_slice(),<br>
which requires the sizes to match exactly. For the probe function, I<br>
actually make use of the relaxed requirement here to access a header<br>
struct in a larger buffer passed from C.<br></blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Indeed it&#39;s similar but not the=
 same. I haven&#39;t checked how you&#39;d write it with vm-memory (it coul=
d be hdr.as_bytes().read_obj(0), or maybe there&#39;s something better), bu=
t it&#39;s something that could be added there too.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; If you want, the f=
unction can be written also<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0// SAFETY: implementing SizedIoBuffer promises that=
 any byte pattern<br>
&gt;=C2=A0 =C2=A0 =C2=A0// is valid for the type<br>
&gt;=C2=A0 =C2=A0 =C2=A0match unsafe { buf.align_to::&lt;Self&gt;() } {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0([], mid, _) =3D&gt; mid.get(0),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_ =3D&gt; None<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; (trick stolen from rust-vmm, in fact).<br>
<br>
Clever way to avoid ptr::is_aligned(), but I feel a bit harder to<br>
understand than just open-coding it like above? (And probably less<br>
efficient, but I don&#39;t know how relevant that is.)<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">Probably not much and=
 a lot of dead code elimination can happen, but either way is fine of cours=
e.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Kevin<br>
<br>
</blockquote></div></div></div>

--000000000000b7e830062df57228--


